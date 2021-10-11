require "byebug"

class Bootcamp
    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new { |h,k| h[k] = [] }
    end

    def name
        @name
    end
    def slogan
        @slogan
    end
    def student_capacity
        @student_capacity
    end
    def students
        @students
    end
    def teachers
        @teachers
    end

    def hire(teacher)
        @teachers << teacher
    end
    def enroll(student)
        if @students.length < @student_capacity
            @students << student
            return true
        else
            return false
        end
    end

    def enrolled?(student)
        students.include?(student)
    end

    def round_down(num)
        num.round <= num ? num.round : num.round - 1
    end

    def student_to_teacher_ratio
        avg = ((@students.length * 1.0 )/ @teachers.length)
        round_down(avg)
    end 
    

    def add_grade(student, grade)
        if @students.include?(student)
            @grades[student] << grade
            return true
        else 
            return false 
        end
    end

    def num_grades(student)
        @grades[student].length
    end

    def average_grade(student)
        return nil if !@students.include?(student) || @grades[student] == []
        round_down((@grades[student].sum * 1.0) / @grades[student].length)
    end
end
