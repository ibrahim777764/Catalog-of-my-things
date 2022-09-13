require_relative '../classes/author'

describe Author do
    let(:author) { Author.new('Shubh', 'Dev') } 
    describe '#add_item' do
        it 'returns true if item is added' do
            expect(author.add_item('foo')).to be true
        end
    end
end