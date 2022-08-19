require_relative './data/data_storage'
class Main
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

  def user_interface
    until @exit
      @option.each do |opt|
        puts opt
      end
      choice = gets.chomp.to_i
      get_choice(choice)
    end
  end

  def get_choice(choice)
    @app = App.new
    case choice
    when 1
      @app.list_books
    when 2
      @app.list_albums
    when 3
      @app.list_games
    when 4
      @app.list_genres
    when 5
      @app.list_labels
    when 6
      @app.list_authors
    when 7
      @app.get_book
    when 8
      @app.add_album
    when 9
      @app.add_game
    when 10
      @exit = true
    else
      puts 'wrong choice !'
    end
  end
end

main = Main.new
main.user_interface
