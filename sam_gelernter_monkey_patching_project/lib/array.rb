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

end
