require 'json'
require_relative 'musicAlbum'
module AlbumsManager
  def store_albums(albums)
    data =[]
    file = './albums.json'
    return unless File.exist?(file)
    albums.each do | album | 
      data << {publish_date: album.publish_date, name: album.name,  on_spotify: album.on_spotify } 
    end
    File.write(file, JSON.generate(data))
  end

  def load_albums
    # read from file
    data = []
    file = './albums.json'
    return data unless File.exist?(file) && File.read(file) != ''
    JSON.parse(File.read(file)).each { |album| data << Musics.new( album['name'], album['publish_date'], album['on_spotify']) }
    data
  end
end