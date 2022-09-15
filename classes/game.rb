require_relative './items'
require 'date'
require_relative './author'

class Game < Items
  attr_accessor :multiplayer, :last_played_at, :publish_date

  def initialize(multiplayer, last_played_at, publish_date)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?()
    last_played_at = Date.today.year - @last_played_at
    return true if last_played_at > 2

    false
  end
end
