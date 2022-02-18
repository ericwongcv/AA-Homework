class TowersOfHanoi

    attr_accessor :array1, :array2, :array3, :move_count

    def initialize
        @array1 = []
        @array2 = []
        @array3 = []
        @move_count = 0
        place_discs
    end

    def place_discs
        (1..3).reverse_each do |disc|
            self.array1 << disc
        end
    end

    def play
        until won?
            puts "Tower 1: #{array1}"
            puts "Tower 2: #{array2}"
            puts "Tower 3: #{array3}"

            move
            system("clear")
            puts "move count: #{self.move_count += 1}"
            won?
        end

        puts "You Win!!"
    end

    def move
        puts "Take disc from (1, 2, or 3):"
        begin
            pick = gets.chomp.to_i
            
            if pick == 1 && array1.length > 0
                remove = array1.pop
            elsif pick == 2 && array2.length > 0
                remove = array2.pop
            elsif pick == 3 && array3.length > 0
                remove = array3.pop 
            else
                raise "error"
            end
        rescue
            puts "Is your action legal?"
            retry
        end
        

        puts "Choose the tower to stack the disc on:"
        begin
            put = gets.chomp.to_i

            if put == 1 && valid?(put, remove)
                array1 << remove 
            elsif put == 2 && valid?(put, remove)
                array2 << remove
            elsif put == 3 && valid?(put, remove)
                array3 << remove
            else
                raise "error"
            end
        rescue
            puts "Is your disc smaller than the one already placed in the tower?"
            retry
        end
    end

    def valid?(put, disc)
        if put == 1
            return true if array1.empty? || array1[-1] > disc
        elsif put == 2
            return true if array2.empty? || array2[-1] > disc
        elsif put == 3 
            return true if array3.empty? || array3[-1] > disc
        end
        false
    end

    def won?
        return true if array3 == [3, 2, 1]
        false
    end

end

TowersOfHanoi.new.play