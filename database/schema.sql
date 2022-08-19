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


