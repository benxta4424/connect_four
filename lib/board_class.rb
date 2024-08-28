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

    def is_legal?(column)
        return true if column.between?(0,6)

        return false
    end

    def is_legal_row(row)
        return true if row.between?(0,5)

        return false
    end

    def adding_values(player_choice,row_number)

        row_counter=0

        if is_legal?(row_number)
            @board.reverse_each do |items|
                    if items==5 
                        @board[items][row_number]=player_choice
                        break
                    elsif  items[row_number]== '⬤'
                    
                        items[row_number]=player_choice
                        break
                    end                
            end

            return true

        elsif !is_legal?(row_number)
            puts 'Column is full'
            return false
        end
        
    end

    def check_rows(player_choice)

        row_counter=0

        @board.size-1.times do
            matching_values=0

            @board.each do |items|
                if items[row_counter]==player_choice
                    matching_values+=1
                end

                if matching_values==4
                    return true
                    break
                end
            endz

            row_counter+=1
        end

        false
    end

end