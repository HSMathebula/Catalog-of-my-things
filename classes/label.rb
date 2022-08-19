class Label
  attr_accessor :title, :color
  attr_reader :items

  def initialize(title, color)
    @id = rand(1...700)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include? item
    item.label = self
  end
end
