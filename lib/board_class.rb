class Board
  def initialize
    @board = Array.new(6) { Array.new(7, "⬤") }
  end

  def display_board
    @board.each do |row|
      puts row.join("  ")
      puts
    end
  end

  def is_legal?(column)
    return true if column.between?(0, 6)

    false
  end

  def is_legal_row(row)
    return true if row.between?(0, 5)

    false
  end

  def adding_values(player_choice, row_number)
    row_counter = 0

    if is_legal?(row_number)
      @board.reverse_each do |items|
        if items == 5
          @board[items][row_number] = player_choice
          break
        elsif items[row_number] == "⬤"

          items[row_number] = player_choice
          break
        end
      end

      return true

    end

    false
  end

  def board_class
    @board
  end

  def check_columns(player_choice, column_number)
    matched_values = 0

    board_class.each do |column|
      if column[column_number] == player_choice
        matched_values += 1

        return true if matched_values == 4
      elsif column[column_number].nil?
        return false
      else
        matched_values = 0
      end
    end

    false
  end

  def check_rows(player_choice, row_number)
    matched_values = 0

    board_class[row_number].each do |items|
      if items == player_choice
        matched_values += 1

        return true if matched_values == 4
      else
        matched_values = 0
      end
    end

    false
  end

  def check_right_diagonal(player_choice, row_number, column_number)
    matched_values = 0

    return nil unless column_number.between?(0, 6) && row_number.between?(0, 5)

    while board_class[row_number][column_number]

      if board_class[row_number][column_number] == player_choice
        matched_values += 1

        return true if matched_values == 4

      else
        matched_values = 0
      end

      return false if row_number < 0 || column_number > 6

      row_number -= 1
      column_number += 1
    end

    nil
  end

  def check_secondary_diagonal(player_choice, row_number, column_number)
    return nil unless row_number.between?(0, 5) && column_number.between?(0, 6)

    matched_values = 0

    while row_number >= 0 && column_number >= 0
      if board_class[row_number][column_number] == player_choice
        matched_values += 1
        return true if matched_values == 4
      else
        matched_values = 0
      end

      row_number -= 1
      column_number -= 1
    end

    nil
  end
end
