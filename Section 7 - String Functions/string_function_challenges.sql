## Reverse and Uppercase the following sentence:
## "Why does my cat look at my with such hatred?"

SELECT UPPER(REVERSE("Why does my cat look at my with such hatred?"));

## Determine what this returns:
## Answer: 'I-like-cats'

SELECT
  REPLACE
  (
  CONCAT('I', ' ', 'like', ' ', 'cats'),
  ' ',
  '-'
  );

## Replace all spaces in all book titles with '->'

SELECT
  REPLACE(title, ' ', '->') AS 'title'
FROM books;

## Print out the authors' last names forwards and backwards in two different columns

SELECT
  author_lname AS 'forwards',
  REVERSE(author_lname) AS 'backwards'
FROM books;

## Print out the full authors' names in all caps in one column under the header "full name in caps"ALTER

SELECT
  UPPER (CONCAT (author_fname, ' ', author_lname)) AS 'full name in caps'
FROM books;

## Create a 'blurb' for the books, which states the title and when it was released in a single phraseALTER

SELECT
  CONCAT(title, ' was released in ', released_year) AS 'blurb'
FROM books;

## Print the book titles (as 'title') and length of each title (as 'character count') in two separate columns

SELECT
  title AS 'title',
  CHAR_LENGTH(title) AS 'character count'
FROM books;

## Finally, create a column of truncated titles to 10 characters with '...' appended to them as 'short title', a column with the authors' names as last,first as 'author', and the quantity in stock (e.g. 12 in stock) as 'quantity'

SELECT
  CONCAT(SUBSTRING(title, 1, 10), '...') AS short_title,
  CONCAT(author_lname, ',', author_fname) AS 'author',
  CONCAT(stock_quantity, ' in stock') AS 'quantity'
FROM books;
