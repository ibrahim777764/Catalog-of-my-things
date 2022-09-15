require 'date'
class Items
  attr_accessor :author, :label, :genre, :source
  attr_reader :id

  def initialize(publish_date)
    @id = rand(1..10_000)
    @publish_date = publish_date
    @archived = false
    @author = author
    @label = label
    @genre = genre
    @source = source
  end

  def move_to_archive()
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?()
    current_date = Date.today.year
    final_date = current_date - @publish_date.year
    final_date > 10
  end

  def add_genre(genre)
    @genre = genre.name
    genre.item << self unless genre.items.include?(self)
  end
end

# b = Items.new(2020)
# puts b.move_to_archive
