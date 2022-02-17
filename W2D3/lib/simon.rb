class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence

    if !game_over
      self.sequence_length += 1
      system("clear")
      return round_success_message
    end
  end

  def show_sequence
    self.seq.each do |color|
      puts color
      sleep 1
      system("clear")
      sleep 1
    end
    add_random_color
    puts seq[-1]
    sleep 1
    system("clear")
  end

  def require_sequence
    self.seq.each do |color|
      puts "Enter the color:"
      entry = gets.chomp
      system("clear")
      return self.game_over = true if entry != color
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "You passed the round! Total Length: #{sequence_length}."
    sleep 1
    system("clear")
  end

  def game_over_message
    puts "Game over."
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = []
  end
end

Simon.new.play
