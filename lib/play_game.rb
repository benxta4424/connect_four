require "./lib/board_class"
require "./lib/players_class"
require "./lib/different_colors"

class PlayGame
  include DifferentColors

  attr_reader :board

  def initialize
    @board = Board.new

    @first_player = nil
    @second_player = nil
  end

  def get_symbol
    puts "What color circle would you want to pick for the game? You have six options:"
    puts "-red"
    puts "-green"
    puts "-yellow"
    puts "-blue"
    puts "-magenta"
    puts "-cyan"

    choice = gets.chomp

    if choice == "red"
      red
    elsif choice == "green"
      green
    elsif choice == "yellow"
      yellow
    elsif choice == "blue"
      blue
    elsif choice == "magenta"
      magenta
    elsif choice == "cyan"
      cyan
    end
  end

  def get_name
    gets.chomp
  end

  def player_one
    Players.new(get_name, get_symbol)
  end

  def play_game
    first_player = player_one
    second_player = player_one
    current_player = first_player

    turns = 0
    column_pick = -1

    while turns < 42 || win?(current_player.choice)

      if @board.is_legal?(column_pick)
        puts "#{current_player.name} pick a column"
        column_pick = gets.chomp.to_i
        @board.adding_values(current_player.choice, column_pick)
      else
        until @board.is_legal?(column_pick)
          puts "#{current_player.name} pick a column"
          column_pick = gets.chomp.to_i

          if @board.is_legal?(column_pick)
            @board.adding_values(current_player.choice, column_pick)
            break
          end
        end
      end

      @board.display_board

      current_player = current_player == first_player ? second_player : first_player

      turns += 1

    end
  end

  def win?(player_choice)
    6.times do |check_rows|
      7.times do |check_columns|
        return true if board.check_columns(player_choice, check_columns)
        return true if board.check_rows(player_choice, check_rows)
        return true if board.check_right_diagonal(player_choice, check_rows, check_columns)
        return true if board.check_secondary_diagonal(player_choice, check_rows, check_columns)
      end
    end
    false
  end
  
end
