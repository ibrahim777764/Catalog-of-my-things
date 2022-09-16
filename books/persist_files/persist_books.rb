require 'json'

module BooksPersistence
  def store_books(books)
    data = []

    books.each do |book|
      data << { id: book.id, publisher: book.publisher, cover_state: book.cover_state, publish_date: book.publish_date,
                archived: book.archived, label: book.label_name }
    end
    File.write('./json_files/books.json', JSON.generate(data))
  end

  def load_books
    data = []
    file = './json_files/books.json'
    return data unless File.exist?(file) && File.read(file) != ''

    JSON.parse(File.read(file)).each do |book|
      data << Book.new(book['id'], book['publisher'], book['cover_state'], book['publish_date'], book['archived'],
                       book['label'])
    end

    data
  end
end
