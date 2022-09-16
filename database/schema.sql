-- Create database items if not exists.
CREATE DATABASE IF NOT EXISTS catalog_items;

-- Create table item
CREATE TABLE Item(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
  genre_id     INT NOT NULL,
  author_id    INT NOT NULL,
  label_id     INT NOT NULL,
  publish_date DATE NOT NULL,
  archived     BOOLEAN NOT NULL,
  CONSTRAINT label_fk FOREIGN KEY (label_id) REFERENCES Labels (id),
  CONSTRAINT author_fk FOREIGN KEY (author_id) REFERENCES Authors (id),
  CONSTRAINT genre_fk FOREIGN KEY (genre_id) REFERENCES Genres (id)
);


-- Create table Books
CREATE TABLE Book(
  id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  publisher VARCHAR(255),
  cover_state VARCHAR(255),
  item_id INT NOT NULL,
  CONSTRAINT item_fk FOREIGN KEY (item_id) REFERENCES Items (id)
)

-- Create table Label
CREATE TABLE Labels(
  id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  title VARCHAR(255),
  color VARCHAR(255)
)

-- Create table Music_Album
CREATE TABLE music_album(
  ID SERIAL PRIMARY KEY,
  publish_date DATE NOT NULL,
  on_spotify BOOLEAN NOT NULL,
  archived BOOLEAN NOT NULL,
  label_ID INT REFERENCES label(ID),
  author_ID INT REFERENCES author(ID),
  genre_ID INT REFERENCES genre(ID)
);

-- Create table genre 
CREATE TABLE genre(
  ID SERIAL PRIMARY KEY,
  name VARCHAR(30)
);

-- Create table Game
CREATE TABLE game (
id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
publish_date DATE NOT NULL,
multiplayer BOOLEAN NOT NULL,
last_palyed_at DATE NOT NULL,
item_id INT NOT NULL,
CONSTRAINT item_fk FOREIGN KEY (item_id) REFERENCES Items (id) 
);

-- create author table

CREATE TABLE author (
id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
);