require 'json'
require_relative 'music_album'
module AlbumsManager
  # store music album
  def store_albums(albums)
    data = []
    albums.each do |album|
      data << { publish_date: album.publish_date, name: album.name, on_spotify: album.on_spotify }
    end
    File.write('./albums.json', JSON.generate(data))
  end

  # store genre file
  def save_genre(genres)
    save_genres = []
    genres.each do |genre|
      save_genres << { name: genre.name }
    end

    File.write('./genres.json', JSON.generate(save_genres))
  end

  # load from json file
  def load_genres
    data = []
    file = './genres.json'
    return data unless File.exist?(file) && File.read(file) != ''

    JSON.parse(File.read(file)).each { |genre| data << Genres.new(genre['name']) }
    data
  end

  def load_albums
    # read from file
    data = []
    file = './albums.json'
    return data unless File.exist?(file) && File.read(file) != ''

    JSON.parse(File.read(file)).each do |album|
      data << Musics.new(album['name'], album['publish_date'], album['on_spotify'])
    end
    data
  end
end
