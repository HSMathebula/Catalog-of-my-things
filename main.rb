require_relative './data/data_storage'
class Main < App
  def initialize
    @option = [
      '1 : List all books ',
      '2 : List all musics albums ',
      '3 : List of games',
      '4 : List all genres',
      '5 : List all labels',
      '6 : List all authors',
      '7 : Add a book',
      '8 : Add a music album',
      '9 : Add a game',
      '10 : Exit'
    ]
    @exit = false
  end

  def main
    until @exit
      @option.each do |opt|
        puts opt
      end
      choice = gets.chomp.to_i
      get_choice(choice)
    end
  end

  def get_choice(choice)
    case choice
    when 2
      add_album = App.new
      add_album.add_album
    when 8
      list_albums = App.new
      list_albums.list_albums
    when 10
      @exit = true
    else
      puts 'wrong choice !'
    end
  end
end

main = Main.new
main.main
