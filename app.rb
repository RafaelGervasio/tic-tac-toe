# Players need to be able to select (1) Circle or Cross (2) Where of the 9 squares to put it
#     They can't put it in a place where there's already something else

# There should be a class called game that initializes the board, and the two players
#It should also contain the rules, to be checked each time a player makes a move

#There should be a class called players that allows them to actually play
    #A method called play, where they select X or O and from 1-9 Where it goes

#p1 uses crosses
#p2 uses circles


class Game
    def initializes (p1, p2)
        @board = [
            [nil, nil, nil]
            [nil, nil, nil]
            [nil, nil, nil]
        ]
        @p1 = p1
        @p2 = p2
    end

class Players < Game

    def play_a_move(position)
        #If p1, use X, if P2, use O
        #Update the @board in the right sport with the right market
    end
end