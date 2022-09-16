require_relative 'items'

class Book < Item
  attr_accessor :publisher, :cover_state, :label_name, :publish_date
  attr_reader :id, :archived

  # rubocop:disable Metrics/ParameterLists
  def initialize(id, publisher, cover_state, publish_date, archived, label)
    super(id, publish_date, archived)
    @publisher = publisher
    @cover_state = cover_state
    @label_name = label
  end
  # rubocop:enable Metrics/ParameterLists

  def can_be_archived?()
    super || cover_state == 'bad'
  end
end
