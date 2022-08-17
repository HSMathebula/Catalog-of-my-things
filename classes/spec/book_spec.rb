require_relative '../book.rb'
require_relative '../item.rb'
describe Book do

  before :each do
    @book = Book.new('2022-09-09', false, 'Brahim', 'bad')
  end
    describe 'Class test' do

      it "should be an instance of Book" do
        @book.should be_an_instance_of (Book)
        expect(@book.class).to eq(Book)
      end
    end
end
