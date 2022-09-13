require_relative '../classes/author'
require_relative '../classes/game'

describe Game do
    let(:game) { Game.new(true, 2019, 2017) }
    describe '#can_be_archived?' do
        it 'returns true if last_plated_at is greater than 2' do
        expect(game.can_be_archived?).to be true
        end
    end
end

describe Game do
    let(:game) { Game.new(true, 2021, 2017) }
    describe '#can_be_archived?' do
        it 'returns false if last_plated_at is less than 2' do
        expect(game.can_be_archived?).to be false
        end
    end
end