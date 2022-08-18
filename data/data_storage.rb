require_relative '../game'
require 'json'

def load_games
  if File.exist?('./data/games.json')
    file = File.open('./data/games.json')

    if File.empty?('./data/games.json')
      'Please add some games '
    else
      games = JSON.parse(File.read('./data/games.json'))
      games.each do |game|
        games = Game.new(game['multiplayer'], game['last_played_at'], game['publish_date'])
        @games << games
      end
    end
    file.close
  else
    puts 'File empty. add new game.'
  end
  puts 'list of availble games'
  return if @games.empty?

  @games.each do |ga|
    puts "game multiplayer: #{ga.multiplayer}, last_played_at: #{ga.last_played_at}, publish_date: #{ga.publish_date}"
  end
end
