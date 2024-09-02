require "./lib/play_game"
require "./lib/players_class"
require "./lib/board_class"

describe PlayGame do
  describe "#player_one" do
    let(:mother_class) { PlayGame.new }

    context "should return the first player with a name and a symbol of choice" do
      it "returns the name of a player" do
        allow(mother_class).to receive(:get_symbol).and_return("red")
        allow(mother_class).to receive(:get_name).and_return("ben")

        solution = mother_class.player_one

        expect(solution.name).to eq("ben")
      end

      it "returns the choice of a player" do
        allow(mother_class).to receive(:get_symbol).and_return("red")
        allow(mother_class).to receive(:get_name).and_return("ben")

        solution = mother_class.player_one

        expect(solution.choice).to eq("red")
      end
    end
  end

  describe "#win?" do
    let(:mother_class) { PlayGame.new }
    let(:board) { double("Board") }

    before do
      allow(mother_class).to receive(:board).and_return(board)
    end

    context "a win is declared when a connection is made" do
      it "verical connection (columns)" do
        allow(board).to receive(:check_columns).with(1, anything).and_return(true)
        allow(board).to receive(:check_rows).and_return(false)
        allow(board).to receive(:check_right_diagonal).and_return(false)
        allow(board).to receive(:check_secondary_diagonal).and_return(false)

        expect(mother_class.win?(1)).to eq(true)
      end

      it "horizontal connection (rows)" do
        allow(board).to receive(:check_columns).and_return(false)
        allow(board).to receive(:check_rows).with(1, anything).and_return(true)
        allow(board).to receive(:check_right_diagonal).and_return(false)
        allow(board).to receive(:check_secondary_diagonal).and_return(false)

        solution = mother_class.win?(1)
        expect(solution).to eq(true)
      end

      it "primary diagonal connection" do
        allow(board).to receive(:check_columns).and_return(false)
        allow(board).to receive(:check_rows).and_return(false)
        allow(board).to receive(:check_right_diagonal).with(1, anything, anything).and_return(true)
        allow(board).to receive(:check_secondary_diagonal).and_return(false)

        solution = mother_class.win?(1)
        expect(solution).to eq(true)
      end

      it "secondary diagonal connection" do
        allow(board).to receive(:check_columns).and_return(false)
        allow(board).to receive(:check_rows).and_return(false)
        allow(board).to receive(:check_right_diagonal).and_return(false)
        allow(board).to receive(:check_secondary_diagonal).with(1, anything, anything).and_return(true)

        solution = mother_class.win?(1)
        expect(solution).to eq(true)
      end
    end

    context "a loss is awarded when no connection has been made either way" do
      it "no connection" do
        allow(board).to receive(:check_columns).and_return(false)
        allow(board).to receive(:check_rows).and_return(false)
        allow(board).to receive(:check_right_diagonal).and_return(false)
        allow(board).to receive(:check_secondary_diagonal).and_return(false)

        solution = mother_class.win?(1)
        expect(solution).to eq(false)
      end
    end
  end
end
