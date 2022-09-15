require_relative '../classes/storage'

describe Storage do
  include Storage

  describe '#dump_game' do
    it 'should dump game' do
      expect(File).to receive(:write).with('games.json', '[]')
      dump_game
    end
  end
end

describe Storage do
  include Storage

  describe '#load_game' do
    it 'should load game' do
      expect(File).to receive(:exist?).with('games.json').and_return(true)
      expect(File).to receive(:read).with('games.json').and_return('[]')
      load_game
    end
  end
end
