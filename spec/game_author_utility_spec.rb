require_relative '../classes/game_author_utility'
require_relative '../classes/game'
require_relative '../classes/author'
describe GameModule do
    include GameModule
    describe '#add_game' do
        it 'adds a game to the games.json file' do
        game = Game.new(true, 2019, 2019)
        game.author.first_name = 'John'
        game.author.last_name = 'Doe'
        add_game(game)
        games = fetch_games
        expect(games.count).to eql(7)
        end
    end
    
    describe '#fetch_games' do
        it 'fetches all games from the games.json file' do
        games = fetch_games
        expect(games.count).to eql(7)
        end
    end

end
