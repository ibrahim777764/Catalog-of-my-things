require_relative './items'
require 'date'

class Game < Items
  attr_accessor :multiplayer, :last_plated_at, :publish_date

  def initialize(multiplayer, last_plated_at, publish_date)
    super(publish_date)
    @multiplayer = multiplayer
    @last_plated_at = last_plated_at
  end

  def can_be_archived?()
    last_plated_at = Date.today.year - @last_plated_at
    return true if last_plated_at > 2

    false
  end
end
