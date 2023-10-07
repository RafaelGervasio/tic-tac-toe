module Board
    attr_reader :board
    
    def create_board
        @board = [
            ['------Game Board------'],
            ['empty', 'empty', 'empty'],
            ['empty', 'empty', 'empty'],
            ['empty', 'empty', 'empty']
        ]
        puts "Welcome to Tic Tac Toe!!"
        puts "------------------------"
        puts "------------------------"
    end
    
    def display_board
        board.each { |row| p row }
        puts '---------'
    end
    
    def game_over?
        flat_board = board.flatten[1..-1]
      
        # Check rows
        (0..2).each do |i|
          if flat_board[i] == flat_board[i + 1] && flat_board[i] == flat_board[i + 2] && flat_board[i] != 'empty'
            if flat_board[i] == 'X'
                puts "The winner is #{@p1}!!!"
            else
                puts "The winner is #{@p2}!!!"
            return true
            end
          end
        end
      
        # Check columns
        (0..2).each do |i|
          if flat_board[i] == flat_board[i + 3] && flat_board[i] == flat_board[i + 6] && flat_board[i] != 'empty'
            if flat_board[i] == 'X'
                puts "The winner is #{@p1}!!!"
            else
                puts "The winner is #{@p2}!!!"
            return true
            end
          end
        end
      
        # Check diagonals
        if (flat_board[0] == flat_board[4] && flat_board[0] == flat_board[8] && flat_board[0] != 'empty') ||
           (flat_board[2] == flat_board[4] && flat_board[2] == flat_board[6] && flat_board[2] != 'empty')
           if flat_board[i] == 'X'
            puts "The winner is #{@p1}!!!"
            else
            puts "The winner is #{@p2}!!!"
            return true
            end
        end
      
        false
      end
    end

module Players
    @p1 = ''
    @p2 = ''

    def create_player
        puts "What's your name?"
        reply = gets.chomp
        if @p1 == nil
            @p1 = reply
        else
            @p2 = reply
        end
    end
end


class Game
    include Board
    include Players

    def initialize
        @turn = 1
        start_game()
    end

    def current_turn
        if @turn==1
            return @p1
        elsif @turn==-1
            return @p2
        end
    end
    
    def make_move(row, collumn)
        if current_turn() == @p1
            board[row][collumn-1] = 'X'
        else
            board[row][collumn-1] = 'O'
        end
        @turn = -@turn
    end

    def start_game
        create_board()
        create_player()
        create_player()
        current_turn()

        i = 0
        while game_over?() == false && i<9
            display_board()
            if @turn == 1
                puts "It's #{@p1}'s turn:"
                puts "What row do you want to put your 'X' in?"
                p_row = gets.chomp
                puts "What collumn do you want to put your 'X' in?"
                p_collumn = gets.chomp
                make_move(p_row.to_i, p_collumn.to_i)
            elsif @turn == -1
                puts "It's #{@p2}'s turn"
                puts "What row do you want to put your 'O' in?"
                p_row = gets.chomp
                puts "What collumn do you want to put your 'O' in?"
                p_collumn = gets.chomp
                make_move(p_row.to_i, p_collumn.to_i)
            end
            i+=1
        end
        a = game_over?
        if !a
            puts "The game is a draw!"
            return
        end
    end

end


my_game = Game.new