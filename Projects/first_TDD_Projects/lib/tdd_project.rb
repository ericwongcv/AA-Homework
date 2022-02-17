class Array
    def my_uniq
        hash = {}
        self.each do |num|
            hash[num] = true
        end
        hash.keys
    end

    def two_sum
        indices = []
        (0...self.length - 1).each do |idx1|
            (idx1 + 1...self.length).each do |idx2|
                indices << [idx1, idx2] if self[idx1] + self[idx2] == 0
            end
        end
        indices
    end

    def my_transpose
        (0...self.length).each do |row_i|
            (row_i + 1...self.length).each do |col_i|
                self[row_i][col_i], self[col_i][row_i] = self[col_i][row_i], self[row_i][col_i]
            end
        end
        self
    end

    def stock_picker
        largest_profit = 0
        days = []
        (0...self.length - 1).each do |idx|
            profit = self[idx + 1] - self[idx]
            if profit > largest_profit
                largest_profit = profit
                days = [idx, idx + 1]
            end
        end
        days
    end

end