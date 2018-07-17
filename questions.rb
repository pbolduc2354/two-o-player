# create two random numbers and create the question that will be send to the user
class Question 

    attr_reader :number1, :number2

    def initialize 
        @number1 = rand(1...40)
        @number2 = rand(1...40)
    end

    def get_answer
        @number1 +  @number2 
    end


end
