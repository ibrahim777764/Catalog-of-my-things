require 'date'
class Items
  attr_accessor :author, :label, :genre, :source, :publish_date
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
    (Date.today.year - @publish_date.year) > 10
  end

  def add_genre(genre)
    @genre = genre.name
    genre.item << self unless genre.items.include?(self)
  end
end
