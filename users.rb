# initialise le profil des user avec leur nom, le nombre de vies, le total de question répondu et le nombre de bonnes réponses
# vérifie si le player est en vie en comparant son nombre de vies avec 0
class User

    attr_reader :username
    attr_accessor :lives, :questions_total, :good_answers, :alive

    def initialize(username)
        @username = username
        @lives = 3
        @questions_total = 0
        @good_answers = 0
    end

    def dead? 
        if @lives == 0 
            true
        end
    end

end
