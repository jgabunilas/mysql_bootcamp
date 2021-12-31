CREATE TABLE employees (
    id INT NOT NULL AUTO_INCREMENT,
    last_name VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    middle_name VARCHAR(255) NULL,
    age INT NOT NULL,
    current_status VARCHAR(100) NOT NULL DEFAULT 'employed',
    PRIMARY KEY (id)
);

# Equivalent code for creating table

# CREATE TABLE employees (
# 	    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
# 	    first_name VARCHAR(255) NOT NULL,
# 	    last_name VARCHAR(255) NOT NULL,
# 	    middle_name VARCHAR(255),
# 	    age INT NOT NULL,
# 	    current_status VARCHAR(255) NOT NULL DEFAULT 'employed'
# );


INSERT INTO employees (last_name, first_name, middle_name, age)
VALUES ('Rutherford','Ernest','Willington',45);

INSERT INTO employees (last_name, first_name, middle_name, age)
VALUES ('Maddox','James','Bradley',37),
        ('Brighton','Rochelle','Marie',38);
        
