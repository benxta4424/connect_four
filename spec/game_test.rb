require './lib/play_game'
require './lib/players_class'

describe "#player_one" do

    let(:mother_class){PlayGame.new}
    
    context 'should return the first player with a name and a symbol of choice' do
          
        it 'returns the name of a player' do
            allow(mother_class).to receive(:get_symbol).and_return('red')
            allow(mother_class).to receive(:get_name).and_return('ben')

            solution=mother_class.player_one('ben','red')

            expect(solution.name).to eq('ben')

        end

        it 'returns the choice of a player' do
            allow(mother_class).to receive(:get_symbol).and_return('red')
            allow(mother_class).to receive(:get_name).and_return('ben')

            solution=mother_class.player_one('ben','red')

            expect(solution.choice).to eq('red')

        end
    end

end