require "byebug"

class Array
    def span
        return nil if self.empty?
        (self.max - self.min) if self.all? { |ele| ele.integer? || ele.float? }
    end

    def average
        return nil if self.empty?
        (self.sum * 1.0) / self.length if self.all? { |ele| ele.integer? || ele.float? }
    end

    def median
        return nil if self.empty?
        length = self.length 
        sorted = self.sort
        if length.odd?
            sorted[length/2]
        else
            (sorted[length/2 - 1] + sorted[length/2]) / 2.0
        end
    end

    def counts
        counts = Hash.new(0)
        self.each { |ele| counts[ele] += 1 }
        counts 
    end

    def my_count(value)
        counter = 0
        self.each { |ele| counter += 1 if ele == value }
        counter
    end

    def my_index(value)
        return nil if !self.include?(value)
        self.each.with_index { |ele, i| return i if ele == value }
    end

    def my_uniq
        uniques = []
        self.each { |ele| uniques << ele if !uniques.include?(ele) }
        uniques
    end

    def my_transpose
        length = self.length
        transposed = Array.new(length) { Array.new(length) }
        (0...length).map do |row|
            (0...length).map do |col|
                transposed[row][col] = self[col][row]
            end
        end
        transposed
    end
end
