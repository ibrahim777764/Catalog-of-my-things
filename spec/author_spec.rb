require_relative '../classes/author'
require_relative '../classes/items'

describe Author do
  let(:author) { Author.new('Shubh', 'Dev') }
  let(:item) { Items.new('game') }

  it 'should have an id' do
    expect(author.id).to be_an(Integer)
  end

  it 'should have a first name' do
    expect(author.first_name).to eq('Shubh')
  end

  it 'should have a last name' do
    expect(author.last_name).to eq('Dev')
  end

  it 'should have items' do
    expect(author.items).to be_an(Array)
  end

  it 'should add an item' do
    author.add_item(item)
    expect(author.items).to include(item)
  end


end



