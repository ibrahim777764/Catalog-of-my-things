require_relative './classes/game_author_utility'

def main
  games = []
  user_input(games)
end

# def console
#   until options
#     choice = gets.chomp.to_i
#     if choice == 11
#       puts 'Thank You for using my Catalog of Things!!'
#       break
#     end
#     user_input(choice)
#   end
# end

def options
  puts
  puts 'List of things'
  puts '========================'
  puts '0 Save and Exit'
  puts '1 List all books'
  puts '2 List all music albums'
  puts '3 List all games'
  puts '4 List all genres'
  puts '5 List all Levels'
  puts '6 List all authors'
  puts '7 List all sources'
  puts '8 Add a book'
  puts '9 Add a music album'
  puts '10 Add a game'
  puts '11 Exit'
  puts '========================'
  puts 'Enter your choice'
end

def user_input(games)
  loop do
    options
    choice = gets.chomp.to_i
    if choice == 11
      puts 'Thank You for using my Catalog of Things!!'
      break
      end
    case choice
    when 0
      puts 'Your progress is saved'
    when 1
      puts 'book list displayed'
    when 2
      puts 'music album display'
    when 3
      list_all_games(games)
    when 4
      puts 'display genre'
    when 5
      puts 'all level display'
    when 6
      list_all_authors(games)
    when 7
      puts 'display all sources'
    when 8
      puts 'book added successfully'
    when 9
      puts 'music album added successfully'
    when 10
      add_game(games)
    else
      puts 'Invalid choice, Kindly choice between 1 and 10!'
    end
  end
end
main