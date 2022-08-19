require './data/data_storage.rb'

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

  def list_book
  end
  
  def add_book
  end

  def add_game
  end

  def add_album
  end

  def get_choice(choice)
    case choice
    when 1
  
    when 2
    # game method
    when 11
      @exit = true
    else
      puts 'wrong choice !'
    end
  end
  
end



