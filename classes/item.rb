require 'date'
class Item
  attr_accessor :genre, :author, :source, :label
  attr_reader :publish_date

  def initialize(id, publish_date, archived : false)
    @id = id
    @publish_date = Date.parse(publish_date)
    @archived = archived
  end

  def move_to_archive
    can_be_archived? ? @archived = true : false
  end

  private

  def can_be_archived?
    (Date.today.year - @publish_date.year) > 10
  end
end

c = Item.new(1, '2010-08-12')

puts c.move_to_archive
