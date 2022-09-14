require 'json'
require_relative './game'
require_relative './author'
require_relative './options'

module GameModule
  def add_game(game)
    game_data = './games.json'
    games = []
    new_game = {
      'multiplayer' => game.multiplayer,
      'last_played_at' => game.last_played_at,
      'publish_date' => game.publish_date,
      'author' => {
        'first_name' => game.author.first_name,
        'last_name' => game.author.last_name
      }
    }
    games = JSON.parse(File.read(game_data)) if File.exist?(game_data)
    games.push(new_game)
    File.write(game_data, JSON.pretty_generate(games))
    File.close unless File.closed?(game_data)
  end

  def fetch_games
    game_data = './games.json'
    games = []
    if File.exist?(game_data)
      if File.zero?(game_data)
      games
    else
      JSON.parse(File.read(game_data))
    end
    else
    games
  end
end

 def list_games
   games = fetch_games
   if games.empty?
    puts 'No games added yet'
   else
    puts "#{games.count} Games found"
    games.each do |game|
      puts "Multiplayer: #{game['multiplayer']}"
      puts "Last played at: #{game['last_played_at']}"
      puts "Publish date: #{game['publish_date']}"
      puts "Author: #{game['author']['first_name']} #{game['author']['last_name']}"
      puts '============================'
   end
  end
   options
 end

 def create_game
  puts 'Is this game multiplayer? [Y/N]'
  multiplayer = gets.chomp.downcase
  multiplayer = multiplayer == 'y'
  puts 'When did you play this game? [YYYY]'
  last_played_at = gets.chomp.to_i
  puts 'When was this game published? [YYYY]'
  publish_date = gets.chomp.to_i
  puts 'Enter author first name'
  author_first_name = gets.chomp
  puts 'Enter author last name'
  author_last_name = gets.chomp
  author = Author.new(author_first_name, author_last_name)
  game = Game.new(multiplayer, last_played_at, publish_date)
  game.author = author
  add_game(game)
  p 'Game added successfully'
  options
 rescue StandardError
  puts 'Invalid input'
 end

 def list_authors
  games = fetch_games
  if games.empty?
    puts 'No authors added yet'
  else
    games.each do |game|
      puts "#{game.author.first_name} #{game.author.last_name}"
      puts '============================'
    end
  end
end
end

include GameModule
fetch = fetch_games
puts fetch.count
