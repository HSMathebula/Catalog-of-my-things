require_relative '../classes/book'
require_relative '../classes/label'
require_relative '../classes/music_album'
require_relative '../classes/genre'
require_relative '../classes/game'
require_relative '../classes/author'
require 'date'
require 'json'

class App # rubocop:disable Metrics/ClassLength
  attr_reader :books, :labels, :albums, :genres, :games, :authors

  def initialize
    @books = []
    @labels = []
    @albums = []
    @genres = []
    @games = []
    @authors = []
    load_games
    load_authors
    load_books
    load_labels
    load_albums
    load_genres
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
    File.write('./data/books.json', JSON.pretty_generate(book_json_array))
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
    File.write('./data/labels.json', JSON.pretty_generate(label_json_array))
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

  def save_game(last_played_at, multiplayer, publish_date)
    obj = {
      last_played_at: last_played_at,
      multiplayer: multiplayer,
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

  def list_books
    load_books
    unless @books.empty?
      @books.select do |book|
        puts " publisher :#{book.publisher} publish_date :#{book.publish_date}"
      end
    end
  end

  def add_game
    print 'Publish Date: [YYYY-MM-DD] '
    publish_date = gets.chomp

    print 'Multiplayer: Y/N '
    multiplayer = gets.chomp
    case multiplayer
    when 'y'
      answer = 'yes'
    when 'n'
      answer = 'no'
    else
      puts 'Please add Y or N '
      answer = gets.chomp
    end

    print 'Last Played at: [YYYY-MM-DD] '
    last_played_at = gets.chomp.to_s

    save_game(publish_date, answer, last_played_at)
    puts 'Game Created successfully'
  end

  def list_games
    load_games
    @games.each do |game|
      puts "last_played_at :#{game.last_played_at} , multiplayer :#{game.multiplayer} ,publish_date :#{game.publish_date}"
    end
  end

  def list_authors
    load_authors
    authors.each do |author|
      puts "First_name :#{author.first_name} , last_name :#{author.last_name}"
    end
  end

  # user interface start
  def list_books
    @books.select do |book|
      p "publisher: #{book.publisher}, publish_date #{book.publish_date}"
    end
  end

  def list_labels
    @labels.select do |label|
      p "title: #{label.title}, color: #{label.color}"
    end
  end

  def get_book
    puts 'when was this book published : '
    publish_date = gets.chomp
    publish_date.to_i
    puts 'is it archived'
    print 'Yes(y) or No(n) : '
    archived = gets.chomp.to_s.downcase
    archived = archived.include? 'y'
    puts 'who is this book publisher : '
    publisher = gets.chomp
    puts 'how is this book cover : '
    cover_state = gets.chomp
    add_book(publish_date, archived, publisher, cover_state)
    p 'Book added succesfully'
  end

  def add_album
    print 'Music name: '
    name = gets.chomp
    print 'Genre: '
    g_name = gets.chomp
    print 'Published date: '
    publish_date = gets.chomp
    print 'Music is on Spotify? [Y/N]'
    spotify = gets.chomp.upcase
    case spotify
    when 'Y'
      spotify = true
    when 'N'
      spotify = false
    else
      puts 'Invalid option \n'
    end

    album = MusicAlbum.new(name, publish_date, on_spotify: spotify)
    @albums.push(album)
    save_album(name, publish_date, spotify)

    genre = Genre.new(g_name)
    @genres.push(genre)
    save_genre(g_name)
    puts 'Music Added successfully'
  end

  def list_albums
    puts ''
    puts 'List of all music albums:'
    puts ''
    if @albums.empty?
      puts 'No music recorded yet.'
      return
    end
    @albums.each do |album|
      puts "Song name: #{album.name},\nPublished date: #{album.publish_date},\nOn Spotify: #{album.on_spotify}\n\n"
    end
  end

  def list_genres
    puts ''
    puts 'List of all genres:'
    puts ''
    if @genres.empty?
      puts 'No genres recorded yet.'
      return
    end
    @genres.each do |genre|
      puts "Genre: #{genre.name}"
    end
    puts ''
  end
end
