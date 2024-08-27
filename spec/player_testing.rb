require "./lib/players_class"

describe Players do
  describe "#initialize" do
    context "should create a new instance of a player" do
      let(:player) { { name: "Ben", choice: "one" } }
      subject(:player_class) { described_class.new(player[:name], player[:choice]) }

      it "should correctly return the name" do
        name = player[:name]
        expect(name).to eq(player_class.name)
      end

      it "should correctly return the choice" do
        choice = player[:choice]
        expect(choice).to eq(player_class.choice)
      end
    end
  end
end
