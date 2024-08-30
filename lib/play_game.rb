require './lib/board_class'
require './lib/players_class'
require './lib/different_colors'

class PlayGame

    def initialize
        @board=Board.new

        @player_name=nil
        @player_choice=nil

        @player_one=Players.new(@player_name,@player_choice)
        @player_two=Players.new(@player_name,@player_choice)
    end
end