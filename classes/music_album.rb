require 'classes/item'

class MusicAlbum < Item
  attr_accessor :id, :name, :on_spotify, :publish_date

  def initialize(name, publish_date, _on_spotufy)
    super(publish_date)
    @id = Random.rand(1...1000)
    @name = name
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify == true
  end
end
