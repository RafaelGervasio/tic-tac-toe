module Board
    def create_board
        attr_reader :board

        @board = [
            ['-- Game Board --'],
            [nil, nil, nil],
            [nil, nil, nil],
            [nil, nil, nil]
        ]
    end
    
    def display_board
        board.each {|row| puts row}
        puts ''
    end
    
    def game_over?
        flat_board = board.flatten[1..-1]
        
        i=0
        3.times do
            if (flat_board[i] == flat_board[i+1] == flat_board [i+2] && flat_board[i] != nil)
                return true
            i+=3
            end
        end
        
        i=0
        3.times do
            if (flat_board[i] == flat_board[i+3] == flat_board [i+6] && flat_board[i] != nil)
                return true
            i+=1
            end
        end

        if (flat_board[0] == flat_board[4] == flat_board[8] && flat_board[0] != nil)
            return true
        elsif (flat_board[2] == flat_board[4] == flat_board[6] && flat_board[2] != nil)
            return true
        end
        
        return false

    end


module Players
    attr_reader :p1
    attr_reader :p2

    @p1 = ''
    @p2 = ''

    def create_player
        puts "What's your name?"
        reply = gets.chomp
        if !!p1 == false
            p1 = reply
        else
            p2 = reply
        end
    end
end


class Game
    @turn = 1
    attr_reader :turn

    include Board
    include Players

    def initialize
        
    end

    def current_turn (turn=1)
        if turn==1
            return self.p1
        elsif turn==-1
            return self.p2
        end
    end
    
    def make_move(row, collumn)
        if current_turn() == self.p1
            board[row][collumn-1] = 'X'
        else
            board[row][collumn-1] = 'O'
        end
        turn = -(turn)
    end

    def start_game
        create_board()
        create_player()
        create_player()

        unless game_over?()
            display_board()
            if turn == 1
                puts "#{p1}'s turn"
                puts "What row do you want to put your 'X' in?"
                p_row = gets.chomp
                puts "What collumn do you want to put your 'X' in?"
                p_collumn = gets.chomp
                make_move(p_row, p_collumn)
            elsif turn == -1
                puts "#{p2}'s turn"
                puts "What row do you want to put your 'X' in?"
                p_row = gets.chomp
                puts "What collumn do you want to put your 'X' in?"
                p_collumn = gets.chomp
                make_move(p_row, p_collumn)
            end
            display_board()
        end
    end

end
