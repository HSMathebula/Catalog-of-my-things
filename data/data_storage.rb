require_relative '../classes/book'
require_relative '../classes/label'
require_relative '../classes/music_album'
require_relative '../classes/genre'
require_relative '../classes/game'
require_relative '../classes/author'

require 'json'

class App
  attr_reader :books, :labels, :albums, :genres, :games, :authors

  def initialize
    @books = []
    @labels = []
    @albums = []
    @genres = []
    @games = []
    @authors = []
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

  # game data preservation
  def load_games
    if File.exist?('./data/games.json')
      file = File.open('./data/games.json')

      if File.empty?('./data/games.json')
        'Please add some games '
      else
        games = JSON.parse(File.read('./data/games.json'))
        games.each do |game|
          game = Game.new(game['publish_date'], game['multiplayer'], game['last_played_at'])
          @games << game
        end
      end
      file.close
    else
      puts 'File empty. add new game.'
    end
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
          author = Author.new(author['first_name'], author['last_name'])
          @authors << author
        end
      end
      file.close
    else
      puts 'File empty. add new author.'
    end
  end

  def save_author(first_name, last_name)
    obj = {
      first_name: first_name,
      last_name: last_name
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

  # Music album and genre

  def load_albums
    if File.exist?('./data/music_albums.json')
      file = File.open('./data/music_albums.json')

      if File.empty?('./data/music_albums.json')
        puts 'Please add new album'
      else
        albums = JSON.parse(File.read('./data/music_albums.json'))
        albums.each do |a|
          album = MusicAlbum.new(a['name'], a['publish_date'], a['on_spotify'])
          @albums << album
        end
      end

      file.close
    else
      puts 'This file dont exits'
    end
  end

  def save_album(name, publish_date, on_spotify)
    obj = {
      name: name,
      publish_date: publish_date,
      on_spotify: on_spotify
    }

    if File.exist?('./data/music_albums.json')
      file = File.open('./data/music_albums.json')
      if file.size.zero?
        album = [obj]
      else
        album = JSON.parse(File.read('./data/music_albums.json'))
        album << obj
      end
      file.close

      myfile = File.open('./data/music_albums.json', 'w')
      myfile.write(JSON.pretty_generate(album))
      myfile.close
    else
      puts 'This file dont exist'
    end
  end

  def load_genres
    if File.exist?('./data/genres.json')
      file = File.open('./data/genres.json')

      if File.empty?('./data/genres.json')
        'Please add new music'
      else
        genres = JSON.parse(File.read('./data/genres.json'))
        genres.each do |g|
          genre = Genre.new(g['name'])
          @genres << genre
        end
      end

      file.close
    else
      puts 'This file dont exits'
    end
  end

  def save_genre(name)
    obj = { name: name }

    if File.exist?('./data/genres.json')
      file = File.open('./data/genres.json')

      if file.size.zero?
        genre = [obj]
      else
        genre = JSON.parse(File.read('./data/genres.json'))
        genre << obj
      end

      file.close

      myfile = File.open('./data/genres.json', 'w')
      myfile.write(JSON.pretty_generate(genre))
      myfile.close
    else
      puts 'This file dont exist'
    end
  end
end

app = App.new
app.save_game('2021-01-30', 'yes', '2021-01-30')
p app.games.length
