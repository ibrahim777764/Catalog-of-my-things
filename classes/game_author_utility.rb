require_relative './game'
require_relative './author'

class Utility
  @games = []
end

def add_game(games)
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
  games.push(Game.new(multiplayer, last_played_at, publish_date, author))
  puts 'The game was added successfully'
end
