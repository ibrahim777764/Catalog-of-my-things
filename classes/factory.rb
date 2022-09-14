require_relative './game_author_utility'

class Factory
  include GameModule

  def initialize
    @options = {
      '3' => method(:list_games),
      '6' => method(:list_authors),
      '10' => method(:create_game)
    }
  end

  def handle_input(input)
    if input.to_i.between?(0, 11)
      @options[input.to_s].call
    else
      puts 'Invalid input'
    end
  end

  def exit
    puts 'Thank You for using my Catalog of Things!!'
    exit(true)
  end
end
