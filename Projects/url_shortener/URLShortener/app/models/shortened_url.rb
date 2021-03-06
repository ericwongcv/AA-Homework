class ShortenedUrl < ApplicationRecord
    validates :long_url, :short_url, :submitter_id, presence: true
    validates :short_url, uniqueness: true
    validate :no_spamming, :nonpremium_max

    belongs_to :submitter,
        class_name: :User,
        foreign_key: :submitter_id,
        primary_key: :id

    has_many :visits,
        class_name: :Visit,
        foreign_key: :shortened_url_id,
        primary_key: :id

    has_many :visitors,
        -> { distinct },
        through: :visits,
        source: :visitor
    

    def self.random_code
        loop do
            random_code = SecureRandom.urlsafe_base64(16)
            return random_code unless ShortenedUrl.exists?(short_url: random_code)
        end
    end 

    def self.create_for_user_and_long_url!(user, long_url)
        ShortenedUrl.create!(
            submitter_id: user.id,
            long_url: long_url,
            short_url: ShortenedUrl.random_code
        )
    end

    def num_clicks
        visits.count
    end

    def num_uniques
        visitors.count
    end

    def num_recent_uniques
        visitors.where('created_at > ?', 10.minutes.ago).distinct.count
    end

    def self.prune(n)
        ShortenedUrl
          .joins(:submitter)
          .joins('LEFT JOIN visits ON visits.shortened_url_id = shortened_urls.id')
          .where("(shortened_urls.id IN (
            SELECT shortened_urls.id
            FROM shortened_urls
            JOIN visits
            ON visits.shortened_url_id = shortened_urls.id
            GROUP BY shortened_urls.id
            HAVING MAX(visits.created_at) < \'#{n.minute.ago}\'
          ) OR (
            visits.id IS NULL and shortened_urls.created_at < \'#{n.minutes.ago}\'
          )) AND users.premium = \'f\'")
          .destroy_all

    private

    def no_spamming
        last_minute = ShortenedUrl
          .where('created_at >= ?', 1.minute.ago)
          .where(submitter_id: submitter_id)
          .length
    
        errors[:maximum] << 'of five short urls per minute' if last_minute >= 5
    end

    def nonpremium_max
      return if User.find(self.submitter_id).premium
    
      number_of_urls =
        ShortenedUrl
          .where(submitter_id: submitter_id)
          .length
    
      if number_of_urls >= 5
        errors[:Only] << 'premium members can create more than 5 short urls'
      end
    end
end