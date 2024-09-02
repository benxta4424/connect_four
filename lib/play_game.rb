require "./lib/board_class"
require "./lib/players_class"
require "./lib/different_colors"

class PlayGame
  include DifferentColors

  attr_reader :board, :turns

  def initialize
    @board = Board.new
    @turns = 0
    @chosen_colors=[]
  end

  def get_symbol
    puts
    puts
    choice = 0
    
    colors = [
      "1. \e[31mred\e[0m", # Red
      "2. \e[42mgreen\e[0m",       # Green
      "3. \e[43myellow\e[0m",      # Yellow
      "4. \e[44mblue\e[0m",        # Blue
      "5. \e[45mmagenta\e[0m",     # Magenta
      "6. \e[46mcyan\e[0m"         # Cyan
    ]

    puts "Please pick a color out of these six options:"
    puts colors.join("  ")
    puts

    while !choice.between?(1,6)

    print "Pick a color:"
    choice = gets.chomp.to_i
    puts

    end

    if choice == 1
      red
    elsif choice == 2
      green
    elsif choice == 3
      yellow
    elsif choice == 4
      blue
    elsif choice == 5
      magenta
    elsif choice == 6
      cyan
    end
  end

  def get_name
    puts
    puts
    print "Please pick a name:"
    gets.chomp
  end

  def player_one
    Players.new(get_name, get_symbol)
  end

  def play_game
    first_player = player_one
    second_player = player_one
    current_player = first_player

    @turns = 0
    column_pick = -1

    while turns < 42

      if @board.is_legal?(column_pick)
        print "#{current_player.name} pick a column:"
        column_pick = gets.chomp.to_i
        @board.adding_values(current_player.choice, column_pick)
      else
        until @board.is_legal?(column_pick)
          print "#{current_player.name} pick a column:"
          column_pick = gets.chomp.to_i

          if @board.is_legal?(column_pick)
            @board.adding_values(current_player.choice, column_pick)
            break
          end
        end
      end

      puts
      puts
      puts

      @board.display_board

      if win?(current_player.choice)
        puts "#{current_player.name} has won!"
        return nil
      end

      current_player = current_player == first_player ? second_player : first_player

      @turns += 1

    end

    "There is a tie!"
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
