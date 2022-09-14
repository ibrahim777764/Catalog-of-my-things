require 'json'

module Storage
    def dump_games
       games = @games.map { |game| game.multiplayer, game.last_played_at,
         game.publish_date, game.author.first_name, game.author.last_name }
         source = JSON.dump(games)
         File.write('games.json', source)
    end

    def load_games
        return unless File.exist?('games.json')
        games = JSON.parse(File.read('games.json'))
        games.each do |game|
            game = Game.new(game[0], game[1], game[2])
            game.author = Author.new(game[3], game[4])
            @games.push(game)
        end
    end

    
end