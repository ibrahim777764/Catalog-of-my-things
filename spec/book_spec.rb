require_relative '../books/book'
require_relative '../books/label'
require_relative '../books/items'
describe Book do
  before :each do
    @label = Label.new('new', 'red')
    @book = Book.new(1,'ibrahim', 'bad', '2022-09-05', false, 'Gift')
    @second_book = Book.new(2,'ibrahim', 'good', '2022-09-05', false, 'Gift')
    @third_book = Book.new(12,'ibrahim', 'good', '2010-06-05', false, 'Gift')
    @book.add_label(@label)
  end
  describe '#new' do
    it 'takes 6 parameters and returns a Book object' do
      expect(@book).to be_instance_of Book
    end
  end

  describe '#add_label' do
    it 'should add label to item ' do
      expect(@book.label.items.length).to eql 1
    end
  end
end
