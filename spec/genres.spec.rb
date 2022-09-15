require_relative '../classes/items'
require_relative '../music/genres'

describe Genres do
  before :each do
    @genre = Genres.new('Fantasy')
  end

  it 'contain a name' do
    expect(@genre.name).to eq('Fantasy')
  end

  it 'has items' do
    expect(@genre.items).to eq([])
  end

  it 'can add items' do
    @genre.add_item(Items.new('2012-07-06'))
    expect(@genre.items.length).to eq(1)
  end
end