class Bootcamp

    def initialize(name, slogan,student_capacity)
        @name=name
        @slogan=slogan
        @student_capacity=student_capacity
        @students=[]
        @teachers=[]
        @grades= Hash.new { |hash,k| hash[k]=[]}
    end

    def name
        @name
    end

    def slogan
        @slogan
    end

    def teachers
        @teachers
    end

    def students
        @students
    end

    def hire(str1)
        @teachers<<str1
    end

    def enroll(str)
        if @students.length<@student_capacity
            @students<<str
            return true
        end
        return false
    end

    def enrolled?(str)
        @students.each do |i|
            if (i.include?(str))
                return true
            end
        end
        return false
    end

    def student_to_teacher_ratio
        return (@students.length/@teachers.length)
    end

    def add_grade(str1, num_1)
        if enrolled?(str1)
            @grades[str1]<<num_1
            return true
        end
        return false
    end

    def num_grades(str1)
        if enrolled?(str1)
            return @grades[str1].length
        end
        return 0    
    end

    def average_grade(str)
        if enrolled?(str)
            if (num_grades(str)>0)
                return @grades[str].sum/num_grades(str)
            end
        end
        return nil
    end
end