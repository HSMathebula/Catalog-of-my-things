class Label
  attr_reader :items

  def initialize(title, _color)
    @id = rand(1...700)
    @title = title
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include? item
    item.label = self
  end
end
