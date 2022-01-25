## Print the number of books in the database
## This is accomplished by using COUNT

SELECT COUNT(*) FROM books;

## Print out how many books were released in each year 
## Group by released_year, then use COUNT to determine the number of books released

SELECT
  released_year AS 'year',
  COUNT(*) AS "# of books released"
FROM books
GROUP BY released_year;

## Print out the total number of books in stock. In other words, account for the stock quantity of all books and add them together
SELECT SUM(stock_quantity) FROM books;

## Find the average released_year for each author

SELECT
  CONCAT(author_fname, ' ', author_lname) AS 'author',
  AVG(released_year) AS 'average released year'
FROM books
GROUP BY author_fname, author_lname;

## Find the full name of the author who wrote the longest book

SELECT
  CONCAT(author_fname, ' ', author_lname, ' wrote the longest book at ', pages, ' pages!') AS "Who wrote the longest book?"
FROM books
ORDER BY pages DESC
LIMIT 1;

## Print the released year, total number of books released, and average pages for books released each released_year

SELECT released_year AS "year", COUNT(*) AS "# books", AVG(pages) AS "avg pages" FROM books GROUP BY released_year;