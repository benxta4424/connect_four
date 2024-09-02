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

    def get_symbol

        puts "What color circle would you want to pick for the game? You have six options:"
        puts '-red'
        puts '-green'
        puts '-yellow'
        puts '-blue'
        puts '-magenta'
        puts '-cyan'

        choice=gets.chomp

        if choice=='red'
            red
        elsif choice=='green'
            green
        elsif choice=='yellow'
            yellow
        elsif choice=='blue'
            blue
        elsif choice=='magenta'
            magenta
        elsif choice=='cyan'
            cyan
        end
    end

    def get_name
        gets.chomp
    end

    def player_one(name,choice)
        Players.new(get_name,get_symbol)
    end
end