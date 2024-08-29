require "./lib/board_class"

describe Board do
  describe "#display_board" do
    subject(:board_creation) { described_class.new }

    it "should display a 7 by 6 board" do
      expected_output = <<~OUTPUT
        ⚪ ⚪ ⚪ ⚪ ⚪ ⚪ ⚪
        ⚪ ⚪ ⚪ ⚪ ⚪ ⚪ ⚪
        ⚪ ⚪ ⚪ ⚪ ⚪ ⚪ ⚪
        ⚪ ⚪ ⚪ ⚪ ⚪ ⚪ ⚪
        ⚪ ⚪ ⚪ ⚪ ⚪ ⚪ ⚪
        ⚪ ⚪ ⚪ ⚪ ⚪ ⚪ ⚪

      OUTPUT

      expect { board_creation.display_board }.to output { expected_output }.to_stdout
    end
  end

  describe "#is_legal?" do
    context "doesn't allow illegal moves" do
      let(:legal_class) { described_class.new }
      let(:moves) { [0, 9] }

      it "should allow the move 0" do
        solution = legal_class.is_legal?(moves[0])

        expect(solution).to eq(true)
      end

      it "should not allow the move 9 since its out of bounds" do
        solution = legal_class.is_legal?(moves[1])

        expect(solution).to eq(false)
      end
    end
  end

  describe "#adding_values" do
    context "adds a value at the bottom of a row" do
      let(:board_creation) { described_class.new }

      it "puts the value at the bottom of the row" do
        allow(board_creation).to receive(:is_legal?).with(4).and_return(true)

        solution = board_creation.adding_values("red", 4)
        expect(solution).to be_truthy
      end

      it "doesn't add value to the row because the index is too big" do
        allow(board_creation).to receive(:is_legal?).with(8).and_return(false)

        solution = board_creation.adding_values("yellow", 8)
        expect(solution).to be_falsey
      end
    end
  end

  describe "#check_columns" do

    subject(:mother_class){described_class.new}
    let(:failing_grid){[[0,0,0,0,0,0,0],
                        [0,0,0,0,0,0,0],
                        [0,0,0,0,0,0,0],
                        [1,0,0,0,0,0,0],
                        [1,0,0,0,0,0,0],
                        [1,0,0,0,0,0,0]]}

    let(:passing_grid){[[0,0,0,0,0,0,0],
                        [0,0,0,0,0,0,0],
                        [1,0,0,0,0,0,0],
                        [1,0,0,0,0,0,0],
                        [1,0,0,0,0,0,0],
                        [1,0,0,0,0,0,0]]}

      let(:empty_grid){[[0,0,0,0,0,0,0],
                        [0,0,0,0,0,0,0],
                        [0,0,0,0,0,0,0],
                        [0,0,0,0,0,0,0],
                        [0,0,0,0,0,0,0],
                        [0,0,0,0,0,0,0]]}
                        

    context 'testing for consecutive values wins and fails' do

      it 'falsey for only 3 consecutive values' do

        allow(mother_class).to receive(:board_class).and_return(failing_grid)

        solution=mother_class.check_columns(1,0)

        expect(solution).to eq(false)

      end

      it 'truthy for 4 consecutive values' do
          allow(mother_class).to receive(:board_class).and_return(passing_grid)

          solution=mother_class.check_columns(1,0)

          expect(solution).to eq(true)
      end

    end

    context 'testing for an empty column' do

      context 'returns false for every column of an empty grid' do

        it 'returns false for column 5' do
          allow(mother_class).to receive(:board_class).and_return(empty_grid)

          solution=mother_class.check_columns(1,4)

          expect(solution).to eq(false)
        end

        it 'returns false for column 1' do
          allow(mother_class).to receive(:board_class).and_return(empty_grid)

          solution=mother_class.check_columns(1,0)

          expect(solution).to eq(false)
        end

      end


    end
  
  end

  describe "#check_rows" do

    subject(:mother_class){described_class.new}
    let(:winning_grid){[[1,1,1,1,1,1,1],
                        [0,0,0,0,0,0,0],
                        [0,0,0,0,0,0,0],
                        [0,0,0,0,0,0,0],
                        [0,0,0,0,0,0,0],
                        [0,0,0,0,0,0,0]]}

     let(:losing_grid){[[0,0,0,0,1,1,1],
                        [0,0,0,0,0,0,0],
                        [0,0,0,0,0,0,0],
                        [0,0,0,0,0,0,0],
                        [0,0,0,0,0,0,0],
                        [0,0,0,0,0,0,0]]}

      let(:empty_grid){[[0,0,0,0,0,0,0],
                        [0,0,0,0,0,0,0],
                        [0,0,0,0,0,0,0],
                        [0,0,0,0,0,0,0],
                        [0,0,0,0,0,0,0],
                        [0,0,0,0,0,0,0]]}

    context 'testing the main functionality' do

      it 'should return true for a full row of values' do
        allow(mother_class).to receive(:board_class).and_return(winning_grid)

        solution=mother_class.check_rows(1,0)

        expect(solution).to eq(true)
      end

      it 'should return false for only 3 consecutive values' do
        allow(mother_class).to receive(:board_class).and_return(losing_grid)

        solution=mother_class.check_rows(1,0)

        expect(solution).to eq(false)
      end

    end

    context 'edge cases' do

      it 'should return false for an empty row' do
        allow(mother_class).to receive(:board_class).and_return(empty_grid)

        solution=mother_class.check_rows(1,0)

        expect(solution).to eq(false)
      end
    end

  end

  
end
