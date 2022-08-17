class Label 
  attr_reader :items

  def initialize(title, color)
    @id = rand(1...700)
    @title = title
    @items = []
  end


end
