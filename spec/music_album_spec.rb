require_relative '../music/music_album'
require 'yaml'
describe Musics do
    before :each do
      @music_album = Musics.new('2010-02-02', 'name', true)
    end
  
    describe '#new' do
      it 'takes 2 parameters and returns a MusicAlbum object' do
        expect(@music_album).to be_instance_of Musics
      end
    end
  
    describe '#on_spotify' do
      it 'returns correct state' do
        expect(@music_album.on_spotify).to eq true
      end
    end
  end