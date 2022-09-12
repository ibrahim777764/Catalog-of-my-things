require 'date'
class Items
    attr_accessor :author, :label, :genre, :source
    attr_reader :id
  def initialize(publish_date)
    @id = rand(1..10000)
    @publish_date = publish_date
    @archived = false
    @author =author
    @label = label
    @genre = genre
    @source = source
  end

  def move_to_archive()
    #@archived = true if can_be_archived? true
   if can_be_archived? == true
      @archived = true
   end
  end

  private
  def can_be_archived?()
    current_date = Date.today.year
    finalDate = current_date - @publish_date
    finalDate > 10? true : false
  end

end

b = Items.new(2020)
puts b.move_to_archive