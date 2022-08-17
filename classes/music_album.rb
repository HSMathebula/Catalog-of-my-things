require 'classes/item.rb'

class MusicAlbum < Item
  attr_accessor :id, :name, :on_spotify, :publish_date

  def initialize(name, publish_date, on_spotufy)
    super(id, publish_date)
    @name = name
    @on_spotify = on_spotify
end