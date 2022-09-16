require_relative '../classes/game'

describe Game do
  before(:each) do
    @game = Game.new('multiplayer', 2018, 2020)
  end
  it 'creates a new game' do
    expect(@game).to be_an_instance_of(Game)
  end
end

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
