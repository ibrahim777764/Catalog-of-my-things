require_relative '../book'

describe Book do
  before :each do
    @label = Label.new('new', 'red')
    @book = Book.new(1, 'ibrahim', 'bad', '2022-09-05', false, 'Gift')
    @second_book = Book.new(5, 'ibrahim', 'good', '2022-09-05', false, 'Gift')
    @third_book = Book.new(23, 'ibrahim', 'good', '2010-06-05', false, 'Gift')
    @book.add_label(@label)
  end

  describe '#new' do
    it 'takes 6 parameters and returns a Book object' do
      expect(@book).to be_instance_of Book
    end
  end

  describe '#can_be_archived?' do
    it 'should return true when cover_state equals "bad" ' do
      expect(@book.can_be_archived?).to eql true
    end

    it 'should return false when cover_state is not equal to "bad" ' do
      expect(@second_book.can_be_archived?).to eql false
    end

    it 'should return true if published_date is older than 10 years' do
      expect(@third_book.can_be_archived?).to eql true
    end
  end

  describe '#add_label' do
    it 'should add label to item ' do
      expect(@book.label.items.length).to eql 1
    end
  end
end
