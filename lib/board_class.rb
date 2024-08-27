class Board

    def initialize
        @board=Array.new(6) { Array.new(7,'⬤') }
    end

    def display_board
        @board.each do |row|
            puts row.join('  ')
            puts
        end
    end

    def umple
        @board[5][0]='M'
    end

end