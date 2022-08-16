require 'date'

class Item
  attr_accessor :genre, :author, :source, :label
  attr_reader :publish_date

  # rubocop:disable Style/OptionalBooleanParameter
  def initialize(id, publish_date, archived = false)
    @id = id
    @publish_date = Date.parse(publish_date)
    @archived = archived
  end
  # rubocop:enable Style/OptionalBooleanParameter

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    (Date.today.year - @publish_date.year) > 10
  end
end

c = Item.new(1, '2010-08-12')

puts c.move_to_archive
