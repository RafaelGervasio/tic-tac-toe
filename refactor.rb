module Board
    def create_board
        attr_reader :board

        @board = [
            ['-- Game Board --']
            [nil, nil, nil]
            [nil, nil, nil]
            [nil, nil, nil]
        ]
    end
    
    def display_board
        board.each {|row| puts row}
        puts ''
    end
    
    def game_over
        #code
    end

module Players
    
    attr_reader :p1
    attr_reader :p2

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