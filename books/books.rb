require_relative '../classes/items'

class Book < Item
  attr_accessor :publisher, :cover_state, :label_name
  attr_reader :id, :publish_date, :archived

  # rubocop:disable Metrics/ParameterLists
  def initialize(publisher, cover_state, publish_date, archived, label, id)
    super(publish_date, archived, id)
    @publisher = publisher
    @cover_state = cover_state
    @label_name = label
  end
  # rubocop:enable Metrics/ParameterLists

  def can_be_archived?()
    super || cover_state == 'bad'
  end
end
