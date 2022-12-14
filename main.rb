require_relative './music/music_util'
require_relative './classes/game_app'
require_relative './books/app'

def main
  console
end

def console
  until options
    choice = gets.chomp.to_i
    if choice == 11
      puts 'Thank You for using my Catalog of Things!!'
      break
    end
    user_input(choice)
  end
end

def options
  puts
  puts 'List of things'
  puts '========================'
  puts '0 Save and Exit'
  puts '1 List all books'
  puts '2 List all music albums'
  puts '3 List all games'
  puts '4 List all genres'
  puts '5 List all Labels'
  puts '6 List all authors'
  puts '7 Add Genre'
  puts '8 Add a book'
  puts '9 Add a music album'
  puts '10 Add a game'
  puts '11 Exit'
  puts '========================'
  puts 'Enter your choice'
end

def user_input(choice)
  apps = Apps.new
  app = App.new
  game_app = GameApp.new
  case choice
  when 0
    puts 'Your progress is saved'
  when 1
    apps.list_books
  when 2
    app.list_music_album
  when 3
    game_app.list_all_games
  when 4
    app.list_genres
  when 5
    apps.list_labels
  when 6
    game_app.list_all_authors
  when 7
    app.add_genre
  when 8
    apps.add_book
  when 9
    app.add_music_album
  when 10
    game_app.add_game
  else
    puts 'Invalid choice, Kindly choice between 1 and 11!!'
  end
end
main
