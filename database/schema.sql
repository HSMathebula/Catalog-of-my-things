CREATE DATABASE catalog;

CREATE TABLE Games (
  id SERIAL PRIMARY KEY,
  publish_date DATE NOT NULL,
  multiplayer BOOLEAN NOT NULL,
  last_played_at DATE NOT NULL,
  item_id INT NOT NULL,
  CONSTRAINT item_fk FOREIGN KEY (item_id) REFERENCES Items (id)
)

CREATE TABLE Authors(
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(100),
  last_name VARCHAR(100)
)

CREATE TABLE Items(
  id SERIAL PRIMARY KEY, 
  genre_id     INT NOT NULL,
  author_id    INT NOT NULL,
  label_id     INT NOT NULL,
  publish_date DATE NOT NULL,
  archived     BOOLEAN NOT NULL,
  CONSTRAINT label_fk FOREIGN KEY (label_id) REFERENCES Labels (id),
  CONSTRAINT author_fk FOREIGN KEY (author_id) REFERENCES Authors (id),
  CONSTRAINT genre_fk FOREIGN KEY (genre_id) REFERENCES Genres (id)
);

CREATE TABLE Book(
  id SERIAL PRIMARY KEY, 
  publisher VARCHAR(100),
  cover_state VARCHAR(100),
  item_id INT NOT NULL,
  CONSTRAINT item_fk FOREIGN KEY (item_id) REFERENCES Items (id)
)

CREATE TABLE Genres(
  id SERIAL PRIMARY KEY,
  name VARCHAR(100)
)

CREATE TABLE Music_Album(
  id SERIAL PRIMARY KEY,
  publish_date DATE,
  name VARCHAR(100),
  on_spotify BOOLEAN,
  item_id INT,
  CONSTRAINT item_fk FOREIGN KEY (item_id) REFERENCES Items (id)
)

CREATE TABLE Labels(
  id SERIAL PRIMARY KEY,
  title VARCHAR(100),
  color VARCHAR(100)


