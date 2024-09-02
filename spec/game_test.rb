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

  describe "#play_game" do
    let(:mother_class) { described_class.new }

    context "the game scores in a tie" do
      it "returns the correct phrase for a tie" do
        allow(mother_class).to receive(:turns).and_return(43)
        allow(mother_class).to receive(:player_one).and_return("ben", "red")
        allow(mother_class).to receive(:player_one).and_return("dan", "green")

        solution = mother_class.play_game
        expect(solution).to eq("There is a tie!")
      end
    end

    context "the game scores in a win for the first player" do
      it "correctly returns the name of the winning player" do
        allow(mother_class).to receive(:player_one).and_return("ben", "red")
        allow(mother_class).to receive(:win?).with("red").and_return(true)

        solution = mother_class.win?("red")
        expect(solution).to eq(true)
      end

      it "correctly returns the name of the second player" do
        allow(mother_class).to receive(:player_one).and_return("ben", "red")
        allow(mother_class).to receive(:player_one).and_return("dede", "blue")
        allow(mother_class).to receive(:win?).with("blue").and_return(true)

        solution = mother_class.win?("blue")
        expect(solution).to eq(true)
      end
    end
  end
end
