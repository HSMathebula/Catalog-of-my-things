require_relative './item.rb'
class Book < Item
  def initialize(publish_date, archived, publisher, cover_state)
    super(publish_date, archived)
    @publisher = publisher
    @cover_state = cover_state
  end


end