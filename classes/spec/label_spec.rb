require_relative '../label.rb'
require_relative '../item.rb'

describe Label do 

  before :each do
    @label = Label.new('purple money', 'purple')
    @item1 = Book.new('2022-09-09', false, 'Brahim', 'bad')
  end

  

end