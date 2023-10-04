#TODO
#Make it into a command line game


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
            @board[position1][position2] = 'O'
        end

        @board.each {|row| p row}
        puts '---------'

        evaluate_game()
    end

    def evaluate_game
        
        countX = 0
        countO = 0
        winner = ''

        #Horizontal check
        @board.each do |arr|
            arr.each do |elem|
                if elem == 'X'
                    countX+=1
                elsif elem =='O'
                    countO +=1
                end
            end

            if countX == 3
                winner = self.p1
            elsif countO == 3
                winner = self.p2
            else
                countO = 0
                countX = 0
            end
        end

        #Vertical check
        flat_board = @board.flatten
        if(
            (flat_board[0] == 'X' && flat_board[3] == 'X' && flat_board[6] == 'X') or
            (flat_board[1] == 'X' && flat_board[4] == 'X' && flat_board[7] == 'X') or
            (flat_board[2] == 'X' && flat_board[5] == 'X' && flat_board[8] == 'X')
        )
            winner = self.p1
        
        elsif(
            (flat_board[0] == 'O' && flat_board[3] == 'O' && flat_board[6] == 'O') or
            (flat_board[1] == 'O' && flat_board[4] == 'O' && flat_board[7] == 'O') or
            (flat_board[2] == 'O' && flat_board[5] == 'O' && flat_board[8] == 'O')
        )
            winner = self.p2
        end

        #Diagonal check
        if(
            (flat_board[0] == 'X' && flat_board[4] == 'X' && flat_board[8] == 'X') or
            (flat_board[2] == 'X' && flat_board[4] == 'X' && flat_board[6] == 'X') 
        )
            winner = self.p1
        
        elsif(
            (flat_board[0] == 'O' && flat_board[4] == 'O' && flat_board[8] == 'O') or
            (flat_board[2] == 'O' && flat_board[4] == 'O' && flat_board[6] == '') 
        )
            winner = self.p2
        end
        
        unless winner==''
            puts "The winner is #{winner}!"
        end
        
        total_rounds = 0
        flat_board.each do |elem|
            if elem=='O' or elem=='X'
                total_rounds+=1
            end
        end

        if total_rounds == 9
            winner = 0
            puts "The game is a draw!"
        end

    end


end


t = TicTacToe.new('Rafa', 'Jon')

t.play_round('Rafa', 0, 2)
t.play_round('Jon', 1, 1)
t.play_round('Rafa', 0, 0)
t.play_round('Jon', 0, 1)
t.play_round('Rafa', 2, 1)
t.play_round('Jon', 1, 2)
t.play_round('Rafa', 1, 0)
t.play_round('Jon', 2, 0)
t.play_round('Rafa', 2, 2)
