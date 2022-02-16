class Board
  attr_accessor :cups
  attr_reader :name1, :name2

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = []

    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    (0..13).each do |idx|
      if idx == 6 || idx == 13
        cups << []
      else
        cups << [:stone] * 4
      end
    end
  end

  def valid_move?(start_pos)

    if !(0..13).to_a.include?(start_pos)
      raise "Invalid starting cup"
    elsif cups[start_pos].empty?
      raise "Starting cup is empty"
    end

  end

  def make_move(start_pos, current_player_name)
    pos = start_pos + 1
    side = current_player_name == name1 ? 13 : 7

    until cups[start_pos].empty?
      if pos != side
        cups[pos] << cups[start_pos].pop
      end
        pos = (pos + 1) % 14
    end

    render

    ending_cup_idx = (pos + 13) % 14
    next_turn(ending_cup_idx)    
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 7 || ending_cup_idx == 13
      return :prompt
    elsif cups[ending_cup_idx].count == 1
      return :switch
    else
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return cups[0..5].all? { |cup| cup.empty? } || cups[7..12].all? { |cup| cup.empty? }
  end

  def winner
    return :draw if cups[6] == cups[13]
    cups[6].count > cups[13].count ? name1 : name2
  end
end
