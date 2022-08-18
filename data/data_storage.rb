require_relative '../classes/book'
require_relative '../classes/label'
require_relative '../classes/music_albums'
require_relative '../classes/genres'

require 'json'

class App
  attr_reader :books, :labels

  def initialize
    @books = []
    @labels = []
    @albums = []
    @genres = []
  end

  def load_books
    if File.empty?('./data/books.json')
      'Please add new books'
    else
      books = JSON.parse(File.read('./data/books.json'))
      books.select do |b|
        book = Book.new(b['publish_date'], b['archived'], b['publisher'], b['cover_state'])
        @books << book
      end
    end
  end

  def add_book(publish_date, archived, publisher, cover_state)
    # create a new book, set a hash with data
    book = Book.new(publish_date, archived, publisher, cover_state)
    book_hash = { publish_date: publish_date,
                  archived: archived,
                  publisher: publisher,
                  cover_state: cover_state }
    # push book to local @books array, also overwrite the json file by adding the new book
    @books << book
    book_json_array = File.empty?('./data/books.json') ? [] : JSON.parse(File.read('./data/books.json'))
    book_json_array << book_hash
    File.write('./data/books.json', JSON.generate(book_json_array))
  end

  def load_labels
    if File.empty?('./data/labels.json')
      'Please add new labels'
    else
      labels = JSON.parse(File.read('./data/labels.json'))
      labels.select do |l|
        label = Label.new(l['title'], l['color'])
        @labels << label
      end
    end
  end

  def add_label(title, color)
    # create a new label, set a hash with data
    label = Label.new(title, color)
    label_hash = { title: title, color: color }
    # push label to local @labels array, also overwrite the json file by adding the new label
    @labels << label
    label_json_array = File.empty?('./data/labels.json') ? [] : JSON.parse(File.read('./data/labels.json'))
    label_json_array << label_hash
    File.write('./data/labels.json', JSON.generate(label_json_array))
  end

  # music

  def load_albums
    if File.empty?('./data/music_albums.json')
      'Please add new album'
    else
      albums = JSON.parse(File.read('./data/music_albums.json'))
      albums.select do |a|
        album = MusicAlbum.new(a['name'], a['publish_date'], a['on_spotify'])
        @albums << album
      end
    end
  end

  def save_album(name, publish_date, on_spotify)
    obj = {
      name: name,
      publish_date: publish_date,
      on_spotify: on_spotify
    }

    album = MusicAlbum.new(name, publish_date, on_spotify)

    @albums << album
    myFile = File.empty?('./data/music_albums.json') ? [] : JSON.parse(File.read('./data/music_albums.json'))
    myFile << obj

    File.write('./data/music_albums.json', JSON.generate(myFile))
  end

  def load_genres
    if File.empty?('./data/genres.json')
      'Please add new music'
    else
      genres = JSON.parse(File.read('./data/genres.json'))
      genres.select do |g|
        genre = Genre.new(g['name'])
        @genres << genre
      end
    end
  end

  def save_genre(name)
    obj = { name: name }
    genre = Label.new(name)

    @genres << genre
    myFile = File.empty?('./data/labels.json') ? [] : JSON.parse(File.read('./data/labels.json'))
    myFile << obj
    File.write('./data/labels.json', JSON.generate(myFile))
  end
end

# def load_games
#   if File.exist?('./data/games.json')
#     file = File.open('./data/games.json')

#     if File.empty?('./data/games.json')
#       'Please add some games '
#     else
#       games = JSON.parse(File.read('./data/games.json'))
#       games.each do |game|
#         game = Game.new(game['multiplayer'], game['last_played_at'], game['publish_date'])
#         @games << game
#       end
#     end
#     file.close
#   else
#     puts 'File empty. add new game.'
#   end
#   puts 'list of availble games'
#   return if @games.empty?

#   @games.each do |ga|
#     puts "game multiplayer: #{ga.multiplayer}, last_played_at: #{ga.last_played_at}, publish_date: #{ga.publish_date}"
#   end

# def save_game(multiplayer, last_played_at, publish_date)
#     obj = {
#       multiplayer: multiplayer,
#       last_played_at: last_played_at,
#       publish_date: publish_date
#     }

#     if File.exist?('./data/games.json')
#       file = File.open('./data/games.json')

#       if file.size.zero?
#         game = [obj]
#       else
#         game = JSON.parse(File.read('./data/games.json'))
#         game << obj
#       end

#       file.close

#       myfile = File.open('./data/games.json', 'w')
#       myfile.write(JSON.pretty_generate(game))
#       myfile.close

#     else
#       puts 'File empty. add new game.'
#     end
# end

# def load_authors
#     if File.exist?('./data/authors.json')
#       file = File.open('./data/authors.json')

#       if File.empty?('./data/authors.json')
#         'Please add some authors '
#       else
#         authors = JSON.parse(File.read('./data/authors.json'))
#         authors.each do |author|
#             author = Author.new(author['first_name'],author['last_name'])
#           @authors << author
#         end
#       end
#       file.close
#     else
#       puts 'File empty. add new author.'
#     end
#     puts 'list of availble authors'
#     return if @authors.empty?

#     @authors.each do |au|
#       puts "author first_name: #{au.first_name}, last_name: #{au.last_name}"
#     end
# end

# def save_autor(first_name, last_name)
#     obj = {
#       first_name: first_name,
#       last_name: last_name,
#     }

#     if File.exist?('./data/authors.json')
#       file = File.open('./data/authors.json')

#       if file.size.zero?
#         author = [obj]
#       else
#         author = JSON.parse(File.read('./data/authors.json'))
#         author << obj
#       end

#       file.close

#       myfile = File.open('./data/authors.json', 'w')
#       myfile.write(JSON.pretty_generate(author))
#       myfile.close

#     else
#       puts 'File empty. add new author.'
#     end
# end
