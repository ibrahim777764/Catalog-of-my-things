require 'json'
require_relative 'game'
require_relative 'author'
module Storage
  def dump_all
    dump_game
    dump_authors
  end

  def load_all
    load_game
    load_authors
  end

  def dump_game(games)
    games = games.map do |game|
      { player: game.multiplayer, last_played: game.last_played_at, published_date: game.publish_date }
    end
    source = JSON.dump(games)
    File.write('./json_files/games.json', source)
  end

  def dump_authors(authors)
    authors = authors.map { |author| { fname: author.first_name, lname: author.last_name } }
    source = JSON.dump(authors)
    File.write('./json_files/authors.json', source)
  end

  def load_authors
    authors_arr = []
    return unless File.exist?('./json_files/authors.json')

    authors = JSON.parse(File.read('./json_files/authors.json'))
    authors.each do |author|
      authors_arr << Author.new(author['fname'], author['lname'])
    end
    authors_arr
  end

  def load_game
    games_arr = []
    return unless File.exist?('./json_files/games.json')

    games = JSON.parse(File.read('./json_files/games.json'))
    games.each do |game|
      games_arr << Game.new(game['player'], game['last_played'], game['published_date'])
    end
    games_arr
  end
end
