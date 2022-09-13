require_relative '../classes/author'
require_relative '../classes/game'

describe Author do
    let(:author) { Author.new('John', 'Doe') }
    let(:game) { Game.new('2020', 'Action', 'Easy') }
    
    describe '#initialize' do
        it 'should initialize with first_name and last_name' do
        expect(author.first_name).to eq('John')
        expect(author.last_name).to eq('Doe')
        end
    end
    
    describe '#add_item' do
        it 'should add an item to the author' do
        author.add_item(game)
        expect(author.items).to include(game)
        end
    end
    end