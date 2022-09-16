require_relative '../classes/storage'

describe Storage do
  include Storage

  describe '#load_game' do
    it 'should load game' do
      expect(File).to receive(:exist?).with('./json_files/games.json').and_return(true)
      expect(File).to receive(:read).with('./json_files/games.json').and_return('[]')
      load_game
    end
  end
end
