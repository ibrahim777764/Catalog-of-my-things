require_relative '../classes/items'
class Musics < Items
  attr_accessor :on_spotify, :name, :publish_date
  def initialize(name, publish_date, on_spotify= false)
    @on_spotify = on_spotify
    @name = name
    super(publish_date)
  end

  def can_be_archived?()
    super && @on_spotify
  end
end
