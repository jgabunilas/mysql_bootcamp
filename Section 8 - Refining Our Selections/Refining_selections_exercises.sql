## Select all Story Collections - that is, all titles that contain "stories"

SELECT
  title
FROM books
WHERE title LIKE '%stories%';

## Find the longest book in the entire books table

SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;

## Print a summary containing the title of the book and the year, separated by a dash. Include on the 3 most recent books

SELECT
  CONCAT(title, ' - ', released_year) AS 'summary'
FROM books
ORDER BY released_year DESC
LIMIT 3;

## Find all books whose author_lname contains a space character

SELECT title, author_lname FROM books WHERE author_lname LIKE '% %';

## Find 3 books with the lowest stock quantities. Select totle, year, and stock

SELECT
  title,
  released_year,
  stock_quantity
FROM books
ORDER BY stock_quantity ASC
LIMIT 3;

## Print the title and author_lname, sorted by author_lname, and then by title

SELECT
  title,
  author_lname
FROM books
ORDER BY author_lname, title;

## Create a selection called "yell" where you say "MY FAVORITE AUTHOR IS "author name" in all caps, sorted by author last name

SELECT
  CONCAT('MY FAVORITE AUTHOR IS', ' ', UPPER(author_fname), ' ', UPPER(author_lname), '!') AS 'yell'
FROM books
ORDER BY author_lname;