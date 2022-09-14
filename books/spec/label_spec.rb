require_relative '../label'
require_relative '../items'

describe Label do
  before :each do
    @label = Label.new('gift', 'red')
    @item = Item.new(27, '2021-07-12', false)
    @label.add_item(@item)
  end

  describe '#new' do
    it 'takes 2 parameters and returns a Label object' do
      expect(@label).to be_instance_of Label
    end

    it 'takes 3 parameters and returns a Item object' do
      expect(@item).to be_instance_of Item
    end
  end

  describe '#add_item' do
    it 'should return item to items collection' do
      expect(@label.items.length).to eql 1
    end
  end
end
