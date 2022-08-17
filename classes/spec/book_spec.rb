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
      it "should throw error when given wrong parameters" do
        lambda{Book.new "2022-01-02", true, 'bamo'}.should raise_exception ArgumentError
      end
      it "should be a child of class item" do
        expect(@book.class.superclass).to eq(Item)
      end
      it "should return the right values and types" do
        expect(@book.publish_date.class).to eq(Date)
        expect(@book.publish_date).to eq Date.parse('2022-09-09')
        expect(@book.cover_state).to eq 'bad'
        expect(@book.publisher).to eq 'Brahim'
      end
      it "raises error when calling a private method" do
        lambda{ @book.can_be_archived }.should raise_error NoMethodError
      end
    end
end
