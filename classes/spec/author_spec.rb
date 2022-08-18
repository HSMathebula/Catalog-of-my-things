require_relative '../author'
require_relative '../game'
require 'date'

describe Author do
  before :each do
    @author = Author.new('Nedjwa', 'Bouraiou')
    @game = Game.new('02-04-2011', 'yes', '05-03-2019')
  end
  it 'takes two parameters and returns an author object' do
    @author.should be_an_instance_of Author
  end
  it 'returns if the authors first name' do
    @author.first_name.should eql 'Nedjwa'
  end
  it 'returns if the authors last name' do
    @author.last_name.should eql 'Bouraiou'
  end
  it 'Check author items' do
    @author.add_item(@game)
    expect(@author.items.size).to eq(1)
  end
end
