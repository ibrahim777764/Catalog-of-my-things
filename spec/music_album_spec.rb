require_relative '../classes/items'
require_relative '../music/music_album'

describe 'MusicAlbum' do
  before :each do
    @music = Musics.new('2000-01-01', true)
  end

  it 'should be archived' do
    expect(@music.can_be_archived?).to be true
  end

  it 'should not be able to be archived' do
    @music_album = Musics.new('2020-04-01', true)
    expect(@music_album.move_to_archive).to be false
  end
end