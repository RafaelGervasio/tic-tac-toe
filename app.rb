# Players need to be able to select (1) Circle or Cross (2) Where of the 9 squares to put it
#     They can't put it in a place where there's already something else

# There should be a class called game that initializes the board, and the two players
#It should also contain the rules, to be checked each time a player makes a move

#There should be a class called players that allows them to actually play
    #A method called play, where they select X or O and from 1-9 Where it goes

#p1 uses crosses
#p2 uses circles


#TODO
#Display the 3 arrays as vertical, not horizontal -> Use /n probably

#Create game rules, to evalute if someone won (each round evaluate it), and if so, display the winner

#Make it so once the board is full game_rules() (that should me a method!) is automatically evaluated, and results are displed, 
#and everything resets


# class Game
#     attr_accessor :name
    
#     @@board  = [
#         [nil, nil, nil],
#         [nil, nil, nil],
#         [nil, nil, nil],
#     ]
    
#     players = []
    
#     def initialize (name)
#         @name = name
#     end

#     def evaluate_game
#         #Evaluate
#         countX = 0
#         countO = 0
#         winner = 0

#         @@board.each do |arr|
#             arr.each do |elem|
#                 if elem == 'X'
#                     countX+=1
#                 else
#                     countO +=1
#                 end
#             end
#             if countX == 3
#                 winner = players[0]
#             elsif countO == 3
#                 winner = players[1]
#             end
#         end

#         unless winner==0
#             puts "The winner is #{winner}!"
#         end
#     end


# end

# class Players < Game

#     attr_reader :player_name

#     @@players = []
#     def self.all
#         @@players
#     end
    
    
#     def initialize (player_name)
#         @player_name = player_name
#         @@players.push(@player_name) 
#         players.push(@player_name)
#     end


#     def play_move(position1, position2)
#         if self.player_name == @@players[0]
#             @@board[position1][position2] = 'X'
#         else
#             @@board[position1][position2] = 'O'
#         end
#         p @@board
#         evaluate_game()
#     end
# end

# my_game = Game.new('my_game')
# rafa = Players.new('Rafa')
# jon = Players.new('Jon')

# rafa.play_move(0, 0)
# rafa.play_move(0, 1)
# rafa.play_move(0, 2)




#Let me re-think the design

# - I need a board
# - I need two players
# - I need a way to evaluate each round, and display the winner if needed
# - I need a way for players to play and have the board be updated



class TicTacToe
    attr_reader :p1, :p2
    
    def initialize (p1, p2)
        @p1 = p1
        @p2 = p2
        @board = [
            [nil, nil, nil],
            [nil, nil, nil],
            [nil, nil, nil],
        ]
    end

    def play_round(player, position1, position2)
        if self.p1 == player
            @board[position1][position2] = 'X'
        else
            [position1][position2] = 'O'
        end

        p @board

        evaluate_game()
    end

    def evaluate_game
        countX = 0
        countO = 0
        winner = ''

        @board.each do |arr|
            arr.each do |elem|
                if elem == 'X'
                    countX+=1
                else
                    countO +=1
                end
            end
            if countX == 3
                winner = self.p1
            elsif countO == 3
                winner = self.p2
            end
        end

        unless winner==''
            puts "The winner is #{winner}!"
        end
    end


end


t = TicTacToe.new('Rafa', 'Jon')
p t.p1
p t.p2

t.play_round('Rafa', 0, 0)
t.play_round('Rafa', 0, 1)
t.play_round('Rafa', 0, 2)