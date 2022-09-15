require 'json'

module  Storage

    def dump_all
        dump_game
        dump_authors
    end

    def load_all
        load_game
        load_authors
    end

    def dump_game
        @games = [] if @games.nil?
        games = @games.map { |game| [game.multiplayer, game.last_played_at, game.publish_date] }
        source = JSON.dump(games)
        File.write('games.json', source)
    end

    def dump_authors
        @authors = [] if @authors.nil?
        authors = @authors.map { |author| [author.first_name, author.last_name] }
        source = JSON.dump(authors)
        File.write('authors.json', source)
    end

    def load_authors
        return unless File.exist?('authors.json')

        authors = JSON.parse(File.read('authors.json'))
        authors.each do |author|
            obj = Author.new(author[0], author[1])
            @authors << obj
        end

    end

    def load_game
        return unless File.exist?('games.json')

        games = JSON.parse(File.read('games.json'))
        games.each do |game|
            obj = Game.new(game[0], game[1], game[2])
            # obj.id = game.first
            @games << obj
    end
end
end
