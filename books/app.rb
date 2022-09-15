require 'io/console'
require_relative 'book'
require_relative 'label'
require_relative 'item'

require_relative './persist_files/persist_books'
require_relative './persist_files/persist_labels'

require_relative './modules/label_module'
require_relative './modules/book_module'

class App
  def initialize
    @books = load_books
    @labels = load_labels
  end

  include BooksPersistence
  include LabelsPersistence
  include BookModule
  include LabelModule

  def menu
    puts
    puts '               Welcome to our catalog!'
    puts '------------------------------------------------------------------------------'
    puts '  | 1 |     List all books                                |'
    puts
    puts '  | 2 |     List all labels                               |'
    puts
    puts '  | 3 |     Create a book                                 |'
    puts
    puts '  | 4 |     Exit                                          |'
    puts '------------------------------------------------------------------------------'
  end

  def check(options)
    case options
    when 1
      list_books
    when 2
      list_labels
    when 3
      add_book
    end
  end

  def execute
    choice = 0
    while choice != 4
      menu
      puts
      puts
      print 'Please Choose Your Option [1-4]: '
      choice = gets.chomp.strip.to_i
      puts
      puts
      check(choice)

      puts
      puts
    end

    store_books(@books)
    store_labels(@labels)
    puts 'Thank you for using our app !'
  end
end
