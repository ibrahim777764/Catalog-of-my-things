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
    @archived = true if can_be_archived? == true
  end

  private

  def can_be_archived?()
    current_date = Date.today.year
    final_date = current_date - @publish_date
    final_date > 10
  end
end

b = Items.new(2020)
puts b.move_to_archive
