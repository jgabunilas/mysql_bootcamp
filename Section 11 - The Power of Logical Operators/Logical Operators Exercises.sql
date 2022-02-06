## Exercises for Logical Operators
# Code written by Jason Gabunilas, which may or may not be similar to instructor's code

## Evaluate the following

SELECT 10 != 10; ## evaluates to False (0)

SELECT 15 > 14 && 99 - 5 <= 94; ## evaluates to True (1)

SELECT 1 IN (5, 3) || 9 BETWEEN 8 AND 10; ## evaluates to True

## Select all books written before 1980 (non-inclusive)

SELECT * FROM books WHERE released_year < 1980;

## Select all books written by Eggers or Chabon

SELECT * FROM books WHERE author_lname IN ('Eggers', 'Chabon');

## Select all books written by Lahiri that were published after the year 200

SELECT
  *
FROM books
WHERE author_lname = 'Lahiri'
AND released_year > 2000;

## Select all books with page counts between 100 and 200 pages

SELECT
  *
FROM books
WHERE pages BETWEEN 100 AND 200;

## Select all books where author_lname starts with a "C" or an "S"

SELECT
  *
FROM books
WHERE author_lname LIKE 'C%'
OR author_lname LIKE 'S%';

## Make a selection where:
## - If the title contains 'stories', it is labeled as "Short Stories"
## - If the title os "Just Kids" or "A Heartbreaking Work of Staggering Genius", it is labeled as "Memoir"
## - Label everything else as "Novel"

SELECT
  title, author_lname,
  CASE
    WHEN title LIKE '%stories%' THEN 'Short Stories'
    WHEN title IN ("Just Kids", "A Heartbreaking Work of Staggering Genius") THEN 'Memoir'
    ELSE 'Novel'
  END AS TYPE
FROM books;

## BONUS challenge:
## Select the author_lname from the books table and add a column called "COUNT" that indicates the number of books in the table written by that author. The count should be properly pluralized based the number of books written by that author (requires CASE statement)

SELECT author_fname, author_lname, 
CASE
    WHEN COUNT(*) = 1 THEN CONCAT(COUNT(*), ' book')
    ELSE CONCAT(COUNT(*), ' books')
END AS COUNT
FROM books
GROUP BY author_lname, author_fname;