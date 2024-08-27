require './lib/board_class'

describe Board do

    describe "#display_board" do

        subject(:board_creation){described_class.new}

        it 'should display a 7 by 6 board' do
            expected_output=<<~OUTPUT
                            ⚪ ⚪ ⚪ ⚪ ⚪ ⚪ ⚪
                            ⚪ ⚪ ⚪ ⚪ ⚪ ⚪ ⚪
                            ⚪ ⚪ ⚪ ⚪ ⚪ ⚪ ⚪
                            ⚪ ⚪ ⚪ ⚪ ⚪ ⚪ ⚪
                            ⚪ ⚪ ⚪ ⚪ ⚪ ⚪ ⚪
                            ⚪ ⚪ ⚪ ⚪ ⚪ ⚪ ⚪

                        OUTPUT

            expect{board_creation.display_board}.to output{expected_output}.to_stdout
        end

    end

    describe "#" do

    

    end


end