require_relative '../book.rb'
require_relative '../item.rb'
describe Book do

  before :each do
    @book = Book.new('2022-09-09', false, 'Brahim', 'bad')
  end

end
