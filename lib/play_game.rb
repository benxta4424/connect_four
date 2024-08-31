require './lib/board_class'
require './lib/players_class'
require './lib/different_colors'

class PlayGame

    include DifferentColors

    def initialize
        @board=Board.new

        @first_player=nil
        @second_player=nil
    end

    def player_one
        
    end
end