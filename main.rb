@option = [
  '1 : List all books ',
  '2 : List all musics albums ',
  '3 : List of games',
  '4 : List all genres',
  '5 : List all labels',
  '6 : List all authors',
  '7 : List all sources',
  '8 : Add a book',
  '9 : Add a music album',
  '10 : Add a game',
  '11 : Exit'
]

@exit = false

def get_choice(choice)
  case choice
  when 1
  # book method
  when 2
  # game method
  when 11
    @exit = true
  else
    puts 'wrong choice !'
  end
end

def main()
  until @exit
    @option.each do |opt|
      puts opt
    end
    choice = gets.chomp.to_i
    get_choice(choice)
  end
end
main
