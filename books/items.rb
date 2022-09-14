require 'date'
class Item
  attr_accessor :genre, :author, :source, :label
  attr_reader :id, :archived

  def initialize(id, publish_date, archived)
    @id = id
    @archived = archived
    @publish_date = publish_date
  end

  def move_to_archive()
    @archived = true if can_be_archived?
  end

  def add_label(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  private

  def can_be_archived?
    (Date.today.year - Date.parse(@publish_date).year).to_i > 10
  end
end
