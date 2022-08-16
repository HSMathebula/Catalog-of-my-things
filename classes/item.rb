class Item
  attr_accessor :genre, :author, :source, :label

  def initialize(id, publish_date,archived)
    @id = id
    @publish_date = publish_date
    @archived = archived
  end

end