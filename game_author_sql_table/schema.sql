-- create game table
CREATE TABLE game (
id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
publish_date DATE NOT NULL,
multiplayer BOOLEAN NOT NULL,
last_palyed_at DATE NOT NULL,
);

-- create author table

CREATE TABLE author (
id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
);