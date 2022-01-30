## Create an inventory table with an appropriate datatype of item_name, price (which is always less than 1,000,000), and quantityALTER

CREATE TABLE inventory (
    item_name VARCHAR(100),
    price DECIMAL (8, 2),
    quantity INT
);

## Print out the current time (but not the date) using MySQL

SELECT CURTIME();

## Print out the current date (but not the time)

SELECT CURDATE();

## Print out the current day of the week (the number)

SELECT DAYOFWEEK(CURDATE());

## Print out the current day of the week (the name of the day)

SELECT DAYNAME(CURDATE());
#Alternatively
SELECT DAYNAME(NOW());

## Print out the current day and time using the format 'mm/dd/yyyy'

SELECT DATE_FORMAT(NOW(),'%m/%d/%Y');

## Print out the current day and time using the format 'January 2nd at 3:15'

SELECT DATE_FORMAT(NOW(),'%M %D at %l:%i');

## Create a tweets table that stores:
## The tweet content
## A username
## The time the tweet was created

CREATE TABLE tweets (
    content VARCHAR(140),
    username VARCHAR(20),
    time_created TIMESTAMP DEFAULT NOW()
);

# Testing out the table

INSERT INTO tweets (content, username) VALUES ('this is my first tweet', 'coltscatBlue');