require_relative 'music_album'
require_relative 'genres'
require_relative 'music_manager'
class App
  include AlbumsManager
  def initialize
    @music_album = load_albums || []
    @genres = load_genres || []
  end

  def empty(array)
    array.empty?
  end

  def message(text)
    puts "\n#{text}\n\n"
  end

  def list_music_album
    message('No Music-album found in the catalog') if empty(@music_album)
    @music_album.each_with_index do |album, i|
      puts "#{i + 1}) Name: #{album.name} || published on #{album.publish_date} || Is on spotify? = #{album.on_spotify}"
    end
  end

  # create a music album
  def add_music_album
    print 'Album Name : '
    name = gets.chomp
    print 'Publish date [YYYY-MM-DD] : '
    publish_date = gets.chomp
    print 'Is it on spotify? [y/n]: '
    spotify = gets.chomp
    spotify = spotify == 'y'
    my_album = Musics.new(name, publish_date, spotify)
    @music_album.push(my_album)
    store_albums(@music_album)
    message('Music album added successfully!!')
  end

  # Add genre
  def add_genre
    print 'Genre Name : '
    name = gets.chomp
    my_genre = Genres.new(name)
    @genres.push(my_genre)
    save_genre(@genres)
    message('Genre added successfully!!')
  end

  # listing genre
  def list_genres
    if empty(@genres)
      message('No genre in the catalog')
      return
    end
    puts "\n"
    @genres.each do |genre|
      puts "ID: #{genre.id} | Name: #{genre.name}"
    end
  end
end
