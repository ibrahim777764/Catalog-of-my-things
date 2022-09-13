require_relative './items'

class Author < Items
  attr_reader :id
  attr_accessor :first_name, :last_name, :items

  def initialize(first_name, last_name)
    super(publish_date)
    @id = Random.rand(1..500)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    puts @items
  end
end

# authorr = Author.new('John', 'Doe')
# puts authorr.add_item('foo')
