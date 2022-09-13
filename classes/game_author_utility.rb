module GameAuthorUtility
  def add_game(games)
    puts 'Is this game for multiplayer? [Y/N]'
    multiplayer = gets.chomp.downcase == 'y'
    puts 'When was the last time you played this game?[YYYY]'
    last_plated_at = gets.chomp.to_i
    puts 'When was this game published?[YYYY]'
    publish_date = gets.chomp.to_i
    games << Game.new(multiplayer, last_plated_at, publish_date)
  end

  def add_author(authors)
    puts 'What is the name of the author?'
    first_name = gets.chomp
    puts 'What is the last name of the author?'
    last_name = gets.chomp
    authors << Author.new(first_name, last_name)
  end

  def list_games(games)
    p 'There are no games in the library' if games.empty?
    games.each do |game|
      puts "Multiplayer: #{game.multiplayer}"
      puts "Last played at: #{game.last_plated_at}"
      puts "Published at: #{game.publish_date}"
      puts '========================'
    end
  end

  def list_authors(authors)
    p 'There are no authors in the library' if authors.empty?
    authors.each do |author|
      puts "First name: #{author.first_name}"
      puts "Last name: #{author.last_name}"
      puts '========================'
    end
  end
end
