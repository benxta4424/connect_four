require "./lib/board_class"

describe Board do
  let(:player_choice) { 1 }

  describe "#display_board" do
    subject(:board_creation) { described_class.new }

    it "should display a 7 by 6 board" do
      expected_output = [["⬤", "⬤", "⬤", "⬤", "⬤", "⬤", "⬤"], ["⬤", "⬤", "⬤", "⬤", "⬤", "⬤", "⬤"],
                         ["⬤", "⬤", "⬤", "⬤", "⬤", "⬤", "⬤"], ["⬤", "⬤", "⬤", "⬤", "⬤", "⬤", "⬤"], ["⬤", "⬤", "⬤", "⬤", "⬤", "⬤", "⬤"], ["⬤", "⬤", "⬤", "⬤", "⬤", "⬤", "⬤"]]

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
    subject(:mother_class) { described_class.new }
    let(:failing_grid) do
      [[0, 0, 0, 0, 0, 0, 0],
       [0, 0, 0, 0, 0, 0, 0],
       [0, 0, 0, 0, 0, 0, 0],
       [1, 0, 0, 0, 0, 0, 0],
       [1, 0, 0, 0, 0, 0, 0],
       [1, 0, 0, 0, 0, 0, 0]]
    end

    let(:passing_grid) do
      [[0, 0, 0, 0, 0, 0, 0],
       [0, 0, 0, 0, 0, 0, 0],
       [1, 0, 0, 0, 0, 0, 0],
       [1, 0, 0, 0, 0, 0, 0],
       [1, 0, 0, 0, 0, 0, 0],
       [1, 0, 0, 0, 0, 0, 0]]
    end

    let(:empty_grid) do
      [[0, 0, 0, 0, 0, 0, 0],
       [0, 0, 0, 0, 0, 0, 0],
       [0, 0, 0, 0, 0, 0, 0],
       [0, 0, 0, 0, 0, 0, 0],
       [0, 0, 0, 0, 0, 0, 0],
       [0, 0, 0, 0, 0, 0, 0]]
    end

    context "testing for consecutive values wins and fails" do
      it "falsey for only 3 consecutive values" do
        allow(mother_class).to receive(:board_class).and_return(failing_grid)

        solution = mother_class.check_columns(1, 0)

        expect(solution).to eq(false)
      end

      it "truthy for 4 consecutive values" do
        allow(mother_class).to receive(:board_class).and_return(passing_grid)

        solution = mother_class.check_columns(1, 0)

        expect(solution).to eq(true)
      end
    end

    context "testing for an empty column" do
      context "returns false for every column of an empty grid" do
        it "returns false for column 5" do
          allow(mother_class).to receive(:board_class).and_return(empty_grid)

          solution = mother_class.check_columns(1, 4)

          expect(solution).to eq(false)
        end

        it "returns false for column 1" do
          allow(mother_class).to receive(:board_class).and_return(empty_grid)

          solution = mother_class.check_columns(1, 0)

          expect(solution).to eq(false)
        end
      end
    end
  end

  describe "#check_rows" do
    subject(:mother_class) { described_class.new }
    let(:winning_grid) do
      [[1, 1, 1, 1, 1, 1, 1],
       [0, 0, 0, 0, 0, 0, 0],
       [0, 0, 0, 0, 0, 0, 0],
       [0, 0, 0, 0, 0, 0, 0],
       [0, 0, 0, 0, 0, 0, 0],
       [0, 0, 0, 0, 0, 0, 0]]
    end

    let(:losing_grid) do
      [[0, 0, 0, 0, 1, 1, 1],
       [0, 0, 0, 0, 0, 0, 0],
       [0, 0, 0, 0, 0, 0, 0],
       [0, 0, 0, 0, 0, 0, 0],
       [0, 0, 0, 0, 0, 0, 0],
       [0, 0, 0, 0, 0, 0, 0]]
    end

    let(:empty_grid) do
      [[0, 0, 0, 0, 0, 0, 0],
       [0, 0, 0, 0, 0, 0, 0],
       [0, 0, 0, 0, 0, 0, 0],
       [0, 0, 0, 0, 0, 0, 0],
       [0, 0, 0, 0, 0, 0, 0],
       [0, 0, 0, 0, 0, 0, 0]]
    end

    context "testing the main functionality" do
      it "should return true for a full row of values" do
        allow(mother_class).to receive(:board_class).and_return(winning_grid)

        solution = mother_class.check_rows(1, 0)

        expect(solution).to eq(true)
      end

      it "should return false for only 3 consecutive values" do
        allow(mother_class).to receive(:board_class).and_return(losing_grid)

        solution = mother_class.check_rows(1, 0)

        expect(solution).to eq(false)
      end
    end

    context "edge cases" do
      it "should return false for an empty row" do
        allow(mother_class).to receive(:board_class).and_return(empty_grid)

        solution = mother_class.check_rows(1, 0)

        expect(solution).to eq(false)
      end
    end
  end

  describe "#check_right_diagonal" do
    subject(:mother_class) { described_class.new }

    let(:player_choice) { 1 }

    let(:winning_grid) do
      [[0, 0, 0, 0, 0, 0, 0],
       [0, 0, 0, 0, 0, 0, 0],
       [0, 0, 0, 1, 0, 0, 0],
       [0, 0, 1, 0, 0, 0, 0],
       [0, 1, 0, 0, 0, 0, 0],
       [1, 0, 0, 0, 0, 0, 0]]
    end

    let(:winning_grid_six_values) do
      [[0, 0, 0, 0, 0, 1, 0],
       [0, 0, 0, 0, 1, 0, 0],
       [0, 0, 0, 1, 0, 0, 0],
       [0, 0, 1, 0, 0, 0, 0],
       [0, 1, 0, 0, 0, 0, 0],
       [1, 0, 0, 0, 0, 0, 0]]
    end

    let(:losing_grid) do
      [[0, 0, 0, 0, 0, 0, 0],
       [0, 0, 0, 0, 0, 0, 0],
       [0, 0, 0, 0, 0, 0, 0],
       [0, 0, 1, 0, 0, 0, 0],
       [0, 1, 0, 0, 0, 0, 0],
       [1, 0, 0, 0, 0, 0, 0]]
    end

    let(:empty_diagonal) do
      [[1, 1, 1, 1, 1, nil, 1],
       [1, 1, 1, 1, nil, 1, 1],
       [1, 1, 1, nil, 1, 1, 1],
       [1, 1, nil, 1, 1, 1, 1],
       [1, nil, 1, 1, 1, 1, 1],
       [nil, 1, 1, 1, 1, 1, 1]]
    end

    context "4 values in a row in a diagonal" do
      it "returns with a true value for 4 values in a row" do
        allow(mother_class).to receive(:board_class).and_return(winning_grid)
        solution = mother_class.check_right_diagonal(player_choice, 5, 0)
        expect(solution).to eq(true)
      end

      it "returns true for more than 4 values in a row" do
        allow(mother_class).to receive(:board_class).and_return(winning_grid_six_values)
        solution = mother_class.check_right_diagonal(player_choice, 5, 0)
        expect(solution).to eq(true)
      end
    end

    context "not enough values on the diagonal or the diagonal is empty" do
      it "returns false for a diagonal where only 3 values connect to each-other" do
        allow(mother_class).to receive(:board_class).and_return(losing_grid)
        solution = mother_class.check_right_diagonal(player_choice, 5, 0)
        expect(solution).to eq(false)
      end

      it "it returns nil for an empty diagonal" do
        expect(mother_class).to receive(:board_class).and_return(empty_diagonal)
        solution = mother_class.check_right_diagonal(player_choice, 5, 0)
        expect(solution).to eq(nil)
      end
    end

    context "out of bounds row/column" do
      it "returns nil for out of bounds row" do
        solution = mother_class.check_right_diagonal(player_choice, 7, 0)
        expect(solution).to eq(nil)
      end

      it "returns nil for out of bounds column" do
        solution = mother_class.check_right_diagonal(player_choice, 4, 77)
        expect(solution).to eq(nil)
      end
    end
  end

  describe "#check_secondary_diagonal" do
    subject(:mother_class) { described_class.new }

    context "a win is declared if there are 4 ore more values connected in the left diagonal" do
      let(:winning_grid) do
        [[0, 0, 0, 0, 0, 0, 0],
         [0, 0, 1, 0, 0, 0, 0],
         [0, 0, 0, 1, 0, 0, 0],
         [0, 0, 0, 0, 1, 0, 0],
         [0, 0, 0, 0, 0, 1, 0],
         [0, 0, 0, 0, 0, 0, 1]]
      end

      it "returns true for 4 consecutive values connected " do
        allow(mother_class).to receive(:board_class).and_return(winning_grid)
        solution = mother_class.check_secondary_diagonal(player_choice, 5, 6)
        expect(solution).to eq(true)
      end

      context "a no-contest is declared if there are less than 4 values connected in the left diagonal" do
        let(:losing_grid) do
          [[0, 0, 0, 0, 0, 0, 0],
           [0, 0, 0, 0, 0, 0, 0],
           [0, 0, 0, 0, 0, 0, 0],
           [0, 0, 0, 0, 1, 0, 0],
           [0, 0, 0, 0, 0, 1, 0],
           [0, 0, 0, 0, 0, 0, 1]]
        end

        it "returns fasle for less than 4 values connected" do
          allow(mother_class).to receive(:board_class).and_return(losing_grid)
          solution = mother_class.check_secondary_diagonal(player_choice, 5, 6)
          expect(solution).to eq(nil)
        end
      end

      context "an nil value on the bottom row is an automatic no contest" do
        let(:nil_diagonal) do
          [[0, nil, 0, 0, 0, 0, 0],
           [0, 0, nil, 0, 0, 0, 0],
           [0, 0, 0, nil, 0, 0, 0],
           [0, 0, 1, 0, nil, 0, 0],
           [0, 1, 0, 0, 0, nil, 0],
           [1, 0, 0, 0, 0, 0, nil]]
        end

        it "should return nil for an empty diagonal" do
          allow(mother_class).to receive(:board_class).and_return(nil_diagonal)
          solution = mother_class.check_secondary_diagonal(player_choice, 5, 6)
          expect(solution).to eq(nil)
        end
      end

      context "out of bounds case" do
        it "returns nil for a row or a column thats out of bounds" do
          solution = mother_class.check_secondary_diagonal(player_choice, 77, 66)
          expect(solution).to eq(nil)
        end
      end
    end
  end
end
