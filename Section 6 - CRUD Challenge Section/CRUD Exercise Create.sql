## Create a new database called shirts_db

CREATE DATABASE shirts_db;

USE shirts_db;

## Within shirts_db, create a new table called shirts with the following columns and properties:
# shirt_id - cannot be null, primary key
# article - text
# color - text
# shirt_size - text
# last_worn - integer

CREATE TABLE shirts (
    shirt_id INT NOT NULL AUTO_INCREMENT,
    article VARCHAR(50),
    color VARCHAR(50),
    shirt_size VARCHAR(2),
    last_worn INT,
    PRIMARY KEY (shirt_id)
);

## Insert shirt data into the table

INSERT INTO shirts (article, color, shirt_size, last_worn)
VALUES 
('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15);

## Add a purple polo shirt, size M, that was last worn 50 days ago

INSERT INTO shirts (article, color, shirt_size, last_worn)
VALUES ('polo shirt','purple','M',50);
