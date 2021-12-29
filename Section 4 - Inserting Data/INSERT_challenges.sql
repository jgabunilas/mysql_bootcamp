CREATE TABLE people (
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT
)

INSERT INTO people (first_name, last_name, age)
VALUES ('Tina','Belcher',13);

INSERT INTO people (first_name, last_name, age)
VALUES ('Bob','Belcher',42);


INSERT INTO people (first_name, last_name, age)
VALUES ('Linda', 'Belcher', 45),
        ('Phillip','Frond',38),
        ('Calvin','Fischoder',70);
        
DROP TABLE people;
