require_relative '../label.rb'
require_relative '../item.rb'

describe Label do 

  before :each do
    @label = Label.new('purple money', 'purple')
    @item1 = Book.new('2022-09-09', false, 'Brahim', 'bad')
  end

  it "is an instance of class Label" do
    @label.should be_an_instance_of Label
    @label.class == Label

  end
  it "returns the right value" do
    expect(@label.color).to eq 'purple'
  end
  it "values are editable" do
    @label.title = 'green money'; @label.color = 'red'
    expect(@label.title).to eq 'green money'
    expect(@label.color).to eq 'red'
  end

  describe "should have relationship with Item ( which is a book )" do
    before :each do
    @item2 = Book.new('2011-02-09', true, 'Sidi', 'very good')
    @item3 = Book.new('2012-02-05', false, 'Abderaman', 'good')
    @label.add_item(@item1); @label.add_item(@item2); @label.add_item(@item3)
    end
  end

end