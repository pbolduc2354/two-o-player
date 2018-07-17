require './questions'
require './users'


# create the new question every turn and puts it
# show the question
# take the answer in the terminal
# ajust the number of good answer the player have
# manage if the answer is good or if it is bad and make the changes
def play_turn(user)

    question = Question.new

    puts "#{user.username}: What does #{question.number1} plus #{question.number2} equal?"
    user.questions_total += 1
    user_answer = gets.chomp.to_i
    correct_answer = question.get_answer

    if user_answer == correct_answer
        puts "#{user.username}: Yes! You are correct."
        user.good_answers += 1
        user.questions_total += 1
    else
        user.lives -= 1
        puts "#{user.username}: Seriously? No!"
        user.questions_total += 1
    end

end

# create new players
# count the number of turn each player had to know who's turn it is
# while the two player are alive, start a new turn 
# if the counter is even, it is playerOne turn to play else it is playertwo's
# when the game is finished show the winner and his score
def game_flow
    user1 = User.new("Player 1")
    user2 = User.new("Player 2")

    while user1.lives > 0 && user2.lives > 0
        puts "----- NEW TURN -----"

        if user1.questions_total == user2.questions_total
            play_turn(user1)
            puts "P1: #{user1.lives}/3 vs P2: #{user2.lives}/3"

        else
            play_turn(user2)
            puts "P1: #{user1.lives}/3 vs P2: #{user2.lives}/3"

        end

    end

    winner = user1.dead? ? user1 : user2
    puts "--------------------------"
    puts "#{winner.username} wins with a score of #{winner.good_answers}/#{winner.questions_total}"
    puts "----- Game Over -----"
    puts "Good Bye!"

end

game_flow

