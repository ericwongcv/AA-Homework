require 'rspec'
require "tdd_project"

describe "#my_uniq" do
    subject(:array) { [1, 2, 1, 3, 3] }
    it "removes duplicates from an array and returns unique elements in order they appeared" do
        expect(array.my_uniq).to eq([1,2,3])
    end
end

describe "two_sum" do
    subject(:array) { [-1, 0, 2, -2, 1] }
    it "find index of pairs where the pair in the array sum to zero." do
        expect(array.two_sum).to eq([[0, 4], [2, 3]])
    end
end

describe "#my_transpose" do
    subject(:rows) { [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8]
      ] }

      it "applies transpose to a square grid." do
        cols = [
            [0, 3, 6],
            [1, 4, 7],
            [2, 5, 8]
          ]
        expect(rows.my_transpose).to eq(cols)
      end
end

describe "#stock_picker" do
    subject(:stock_prices) { [174.61, 175.84, 172.9, 172.39, 171.66, 174.83, 176.28, 172.12, 168.64, 168.88, 172.79] }
    it "should return the most profitable pair of days to buy then sell." do
        expect(stock_prices.stock_picker).to eq([9, 10])
    end
end