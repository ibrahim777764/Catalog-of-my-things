module GameAuthorUtility
  def add_game
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
    @games.push(game)
    p 'Game added successfully'
    puts
  end

  def list_all_games
    p 'No games added yet' if @games.length.zero?
    @games.each do |game|
     puts 'Multiplayer: #{game.multiplayer}'
     puts 'Last played at: #{game.last_played_at}'
     puts 'Publish date: #{game.publish_date}'
     puts '====================================='
    end
  end
end
