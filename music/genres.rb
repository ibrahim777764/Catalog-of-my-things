require_relative '../classes/items'
class Genres < Items
  attr_reader :id, :items
  attr_accessor :name
  def initialize(name)
    @id = rand(1..1000)
    @name = name
    @items =[]
  end
  def add_item(item)
    @items << item
    item.add_genre = self
  end
end
