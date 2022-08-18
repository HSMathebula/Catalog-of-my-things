require_relative '../item'
require_relative '../author'
require 'date'

describe Item do
  before :each do
    @item = Item.new('02-04-2011')
    @author = Author.new('ikram', 'Bouraiou')
  end
  it 'takes One parameter and returns an item object' do
    @item.should be_an_instance_of Item
  end
  it 'returns if the item date' do
    @item.publish_date.should eql Date.parse('02-04-2011')
  end
  it 'returns true for the move to archives method' do
    expect(@item.move_to_archive).to be true
  end
  it 'Check adding authors' do
    @item.add_author(@author)
    expect(@author.items.size).to eq(1)
  end
end
