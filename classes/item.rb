require 'date'
class Item
  attr_accessor :genre, :author,:label
  attr_reader :publish_date

  # rubocop:disable Style/OptionalBooleanParameter
  def initialize(publish_date, archived = false)
    @id = rand(1..1000)
    @publish_date = Date.parse(publish_date)
    @archived = archived
  end
  # rubocop:enable Style/OptionalBooleanParameter

  def add_author(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  def add_genre(genre)
    @genre = genre
    genre.add_item(self) unless genre.items.include? self
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    (Date.today.year - @publish_date.year) > 10
  end
end
