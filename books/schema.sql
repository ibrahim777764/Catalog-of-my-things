CREATE DATABASE catalog;

-- Create label table
CREATE TABLE label(
 id INTEGER GENERATED ALWAYS AS IDENTITY,
 title VARCHAR(20),
 color VARCHAR(20),
 PRIMARY KEY(id)
);

-- Create book table  
CREATE TABLE book(
  id INT GENERATED ALWAYS AS IDENTITY,
  publisher VARCHAR(50),
  cover_state VARCHAR(10),
  publish_date DATE,
  archived BOOLEAN,
  label_id  INT,
  CONSTRAINT fk_book FOREIGN KEY (label_id) REFERENCES label (id) ON DELETE CASCADE,
  PRIMARY KEY(id)