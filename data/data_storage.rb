require_relative '../game'
require_relative '../auhor'
require_relative '../classes/book'
require 'json'

def load_games
  if File.exist?('./data/games.json')
    file = File.open('./data/games.json')

    if File.empty?('./data/games.json')
      'Please add some games '
    else
      games = JSON.parse(File.read('./data/games.json'))
      games.each do |game|
        game = Game.new(game['multiplayer'], game['last_played_at'], game['publish_date'])
        @games << game
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


def save_game(multiplayer, last_played_at, publish_date)
    obj = {
      multiplayer: multiplayer,
      last_played_at: last_played_at,
      publish_date: publish_date
    }

    if File.exist?('./data/games.json')
      file = File.open('./data/games.json')

      if file.size.zero?
        game = [obj]
      else
        game = JSON.parse(File.read('./data/games.json'))
        game << obj
      end

      file.close

      myfile = File.open('./data/games.json', 'w')
      myfile.write(JSON.pretty_generate(game))
      myfile.close

    else
      puts 'File empty. add new game.'
    end
end

def load_authors
    if File.exist?('./data/authors.json')
      file = File.open('./data/authors.json')
  
      if File.empty?('./data/authors.json')
        'Please add some authors '
      else
        authors = JSON.parse(File.read('./data/authors.json'))
        authors.each do |author|
            author = Author.new(author['first_name'],author['last_name'])
          @authors << author
        end
      end
      file.close
    else
      puts 'File empty. add new author.'
    end
    puts 'list of availble authors'
    return if @authors.empty?
  
    @authors.each do |au|
      puts "author first_name: #{au.first_name}, last_name: #{au.last_name}"
    end
end


def save_autor(first_name, last_name)
    obj = {
      first_name: first_name,
      last_name: last_name,
    }

    if File.exist?('./data/authors.json')
      file = File.open('./data/authors.json')

      if file.size.zero?
        author = [obj]
      else
        author = JSON.parse(File.read('./data/authors.json'))
        author << obj
      end

      file.close

      myfile = File.open('./data/authors.json', 'w')
      myfile.write(JSON.pretty_generate(author))
      myfile.close

    else
      puts 'File empty. add new author.'
    end
end

def load_books
  @books = []
  if File.empty?('./data/books.json')
        'Please add new books'
  else 
   books = JSON.parse(File.read('./data/books.json'))
   books.select do |b|
    book = Book.new(b['publish_date'],b['archived'],b['publisher'],b['cover_state'])
    @books << book
    end
  end
end
def add_book(publish_date,archived,publisher,cover_state)
  # create a new book, set a hash with data
  book = Book.new(publish_date,archived,publisher,cover_state)
  book_hash = { publish_date: publish_date, 
  archived: archived, 
  publisher: publisher, 
  cover_state: cover_state
}
# push book to local @books array, also overwrite the json file by adding the new book
  @books << book
  book_json_array = JSON.parse(File.read('./data/books.json'))
  book_json_array << book_hash
  File.write('./data/books.json',JSON.generate(book_json_array))
end

def load_labels
  @labels = []
  if File.empty?('./data/labels.json')
        'Please add new labels'
  else 
   labels = JSON.parse(File.read('./data/labels.json'))
   labels.select do |l|
    label = Book.new(l['title'],l['color'],)
    @labels << label
    end
  end
end



  
  
