require "rspec"
require "towers_of_hanoi"

describe TowersOfHanoi do
    subject(:game) { TowersOfHanoi.new }
    
    describe "#initialize" do
        subject(:array1) { [ ] }
        subject(:array2) { [ ] }
        subject(:array3) { [ ] }

        it "should make three arrays (@array1, @array2, @array3) which represents the piles of discs." do
        
        expect(array1).to eq( [] )
        expect(array2).to eq( [] )
        expect(array3).to eq( [] )

        end
    end

    describe "#place_discs" do

        it "should place 3 discs in the starting position @array1" do
            expect(game.array1).to eq([3, 2, 1])
        end
    end

    describe "won" do
        
        it "should return true if stacked on the last tower in order 3, 2, 1" do
            game.array3 = [3, 2, 1]
            expect(game.won?).to eq(true)
        end
    end
end