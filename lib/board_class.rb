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
            
        end

        false
        
        
    end

    def board_class
        @board
    end

    def check_columns(player_choice,column_number)

        matched_values=0

        board_class.each do |column|
            if column[column_number]==player_choice
                matched_values+=1

                if matched_values==4
                    return true
                end
            elsif column[column_number].nil? 
                return false
            else
                matched_values=0
            end
        end

        false
        
    end

    def check_rows(player_choice,row_number)
        matched_values=0

        board_class[row_number].each do |items|
            if items==player_choice
                matched_values+=1
                
                if matched_values==4
                    return true
                end
            else
                matched_values=0
            end
        end

        false

    end

    def check_right_diagonal(player_choice,row_number,column_number)
        matched_values=0

        return nil unless column_number.between?(0,6) && row_number.between?(0,5) 


        while board_class[row_number][column_number]

            if board_class[row_number][column_number]==player_choice
                matched_values+=1

                if matched_values==4
                    return true
                end

            else
                matched_values=0
            end

            if row_number<0 || column_number>6
                return false
            end

            row_number-=1
            column_number+=1
        end

        nil
    end

end