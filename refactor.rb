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