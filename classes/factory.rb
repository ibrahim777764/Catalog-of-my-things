require_relative 'game_app'

class Factory
  def initialize
    @gameapp = GameApp.new
  end

  def on_exit
    @gameapp.dump_all
  end

  def display_list
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

  def dispatch(option)
    case option
    when 0
      puts 'Your progress is saved'
    when 1
      puts 'book list displayed'
    when 2
      puts 'music album display'
    when 3
      @gameapp.list_all_games
    when 4
      puts 'display genre'
    when 5
      puts 'all level display'
    when 6
      @gameapp.list_all_authors
    when 7
      puts 'all source display'
    when 8
      puts 'add a book'
    when 9
      puts 'add a music album'
    when 10
      @gameapp.add_game
    when 11
      puts 'Thank You for using my Catalog of Things!!'
    end
  end
end
