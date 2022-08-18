require_relative '../game'
require 'date'

describe Game do
  before :each do
    @game = Game.new('02-04-2011', 'yes', '05-03-2019')
  end
  it 'takes three parameters and returns a game object' do
    @game.should be_an_instance_of Game
  end
  it 'returns if the game has multiplayers ' do
    @game.multiplayer.should eql 'yes'
  end
  it 'returns the last_played_at date wich is 05-03-2019' do
    @game.last_played_at.should eql Date.parse('05-03-2019')
  end
  it 'raises an exception for private method' do
    expect { @game.can_be_archived? }.to raise_error NoMethodError
  end
end
