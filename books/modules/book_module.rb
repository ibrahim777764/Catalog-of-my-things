require_relative '../book'
require_relative '../items'
require_relative '../label'
require_relative '../persist_files/persist_books'
require_relative '../persist_files/persist_labels'
class BookModule
  include BooksPersistence
  include LabelsPersistence
  def initialize
    @books = load_books || []
    @labels = []
  end

  def list_books
    if @books.empty?
      puts 'There is no books to display'
    else
      puts 'Here is the list of books'
      puts
      @books.each_with_index do |book, index|
        print "#{index}) Publisher: \"#{book.publisher}\", Publish Date: \"#{book.publish_date}\","
        print " Cover state: \"#{book.cover_state}\",  Archived: \"#{book.archived}\" ,  Label: \"#{book.label_name}\""
        puts
      end
    end
  end

  # rubocop:disable Metrics/MethodLength
  def add_book
    print 'Publisher: '
    publisher = gets.chomp.strip
    print 'Is the book\'s cover state good or bad ? [G/B]: '
    cover_state = gets.chomp.strip.upcase
    case cover_state
    when 'G'
      cover_state = 'good'
    when 'B'
      cover_state = 'bad'
    end
    print 'Enter publish date in [yyyy-mm-dd] format: '
    publish_date = gets.chomp

    puts 'Choose a label or create your own label: '
    @labels.each_with_index do |label, idx|
      puts "#{idx + 1}) #{label.title}"
    end
    puts '0) ***** Create your own label *****'
    label_choice = gets.chomp.strip.to_i
    if label_choice.zero?
      print 'Please give a label name to your book: '
      title = gets.chomp.strip.upcase
      print 'Please give a color to your label: '
      color = gets.chomp.strip.upcase
      label = Label.new(title, color)
      @labels.push(label)
    else
      title = @labels[label_choice - 1].title

    end

    book = Book.new(rand(1000), publisher, cover_state, publish_date, false, title)
    book.move_to_archive
    @books.push(book)
    unless label.nil?
      label.add_item(book)
      book.add_label(label)
      store_books(@books)
      store_labels(@labels)
    end
    puts 'Book created successfully'
  end
  # rubocop:enable Metrics/MethodLength
end
