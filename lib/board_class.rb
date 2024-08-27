class Board

    def initialize
        @board=Array.new(6) { Array.new(7,'⬤') }

        @red_circle = "\033[31m⬤\033[0m"
        @black_circle_yellow = "\033[33m⬤\033[0m"
    end

    def display_board
        @board.each do |row|
            puts row.join('  ')
            puts
        end
    end

    def is_legal?(row_number)
        return true if row_number.between?(0,6)

        return false
    end

    def adding_values(player_choice,row_number)
        if(is_legal?(row_number))
            @board[5][row_number]=player_choice
            return true
        end

        return false
        
    end

end