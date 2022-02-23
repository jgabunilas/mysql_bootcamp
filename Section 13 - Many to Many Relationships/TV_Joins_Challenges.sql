-- For challenge outputs see notes in Github repository
-- Challenge 1: Ratings and Titles

SELECT title, rating FROM series
JOIN reviews ON series.id = reviews.series_id;


-- Challenge 2: Average Series Ratings

SELECT
  title,
  AVG(rating) AS avg_rating
FROM series
JOIN reviews
  ON series.id = reviews.series_id
GROUP BY title
ORDER BY avg_rating ASC;

-- Challenge 3: Reviewer Names and Ratings

SELECT
  first_name,
  last_name,
  rating
FROM reviewers
JOIN reviews
  ON reviewers.id = reviews.reviewer_id;
  
-- Challenge 4: Identifying the Unreviewed Series
# View all series and ratings
SELECT * FROM series
LEFT JOIN reviews ON series.id = reviews.series_id;


# Select only series whose ratings are NULL (no ratings)
SELECT title
FROM series
LEFT JOIN reviews ON series.id = reviews.series_id
WHERE rating IS NULL;

 # Finally, re-alias the title column to "unreviewed_series"
SELECT
  title AS unreviewed_series
FROM series
LEFT JOIN reviews
  ON series.id = reviews.series_id
WHERE rating IS NULL;

-- Challenge 5: Generate a table that shows the average rating for each genre
# Start by selecting everything and joining the series and reviews tables on the series ID, as those tables contain the data we need. Remember that by performing an inner join, we will eliminate any series that have no ratings
SELECT * FROM series
JOIN reviews ON series.id = reviews.series_id;

# Now select just the genre and ratings
SELECT genre, rating FROM series
JOIN reviews ON series.id = reviews.series_id;

# Now group by the genre and calculate the average rating, providing the final answer
SELECT genre, AVG(rating) AS avg_rating FROM series
JOIN reviews ON series.id = reviews.series_id
GROUP BY genre;

# We can apply the ROUND function here so that we're not looking at lots of extra decimal places
SELECT
  genre,
  ROUND(AVG(rating), 2) AS avg_rating
FROM series
JOIN reviews
  ON series.id = reviews.series_id
GROUP BY genre;

-- Challenge 6: Analytics for reviewers. -	Generate a table that lists the first and last names of each reviewer, the total number of reviews they have written, the minimum and maximum ratings, the average ratings, and the status (Active = has written at least one review, Inactive = written no reviews)

# Start by simply joining the reviewers and reviews tables, joining on the reviewer_id. The series table is not needed here. We will need a LEFT JOIN so that we retain any reviewers who have written any reviews
SELECT * FROM reviewers
LEFT JOIN reviews ON reviewers.id = reviews.reviewer_id;

# Pare down the columns to just the names and ratings
SELECT first_name, last_name, rating FROM reviewers
LEFT JOIN reviews ON reviewers.id = reviews.reviewer_id;

# Perform a GROUP BY on the first and last names, then push out the COUNT, MIN, MAX, and AVG
SELECT first_name, last_name, COUNT(rating) AS 'COUNT', MIN(rating) AS 'MIN', MAX(rating) AS 'MAX', AVG(rating) AS 'AVG' FROM reviewers
LEFT JOIN reviews ON reviewers.id = reviews.reviewer_id
GROUP BY first_name, last_name;

# Add to this a CASE clauses for instances where rating is NULL, so that those values are replaced with 0.0.
SELECT first_name, last_name, COUNT(rating) AS 'COUNT', 
CASE
    WHEN rating IS NULL THEN 0.0
    ELSE MIN(rating)
END AS 'MIN',
CASE
    WHEN rating IS NULL THEN 0.0
    ELSE MAX(rating)
END AS 'MAX',
CASE 
    WHEN rating IS NULL THEN 0.0
    ELSE AVG(rating)
END AS 'AVG', 
CASE
    WHEN rating IS NULL THEN 'INACTIVE'
    ELSE 'ACTIVE'
END AS 'STATUS'
FROM reviewers
LEFT JOIN reviews ON reviewers.id = reviews.reviewer_id
GROUP BY first_name, last_name;

# Finally, sort by STATUS
SELECT
  first_name,
  last_name,
  COUNT(rating) AS 'COUNT',
  CASE
    WHEN rating IS NULL THEN 0.0
    ELSE MIN(rating)
  END AS 'MIN',
  CASE
    WHEN rating IS NULL THEN 0.0
    ELSE MAX(rating)
  END AS 'MAX',
  CASE
    WHEN rating IS NULL THEN 0.0
    ELSE AVG(rating)
  END AS 'AVG',
  CASE
    WHEN rating IS NULL THEN 'INACTIVE'
    ELSE 'ACTIVE'
  END AS 'STATUS'
FROM reviewers
LEFT JOIN reviews
  ON reviewers.id = reviews.reviewer_id
GROUP BY first_name,
         last_name
ORDER BY 'STATUS' DESC;

# An alternative approach to CASE statements is to use the IFNULL function for MIN, MAX, and AVG. You can also use an IF function instead of a CASE statement for STATUS
SELECT
  first_name,
  last_name,
  COUNT(rating) AS 'COUNT',
  IFNULL(MIN(rating), 0.0) AS 'MIN',
  IFNULL(MAX(rating), 0.0) AS 'MAX',
  IFNULL(AVG(rating), 0.0) AS 'AVG',
  IF(COUNT(rating) > 0, 'ACTIVE', 'INACTIVE') AS 'STATUS'
FROM reviewers
LEFT JOIN reviews
  ON reviewers.id = reviews.reviewer_id
GROUP BY first_name,
         last_name
ORDER BY 'STATUS' DESC;

-- Challenge 7: Generate a selection that includes the series titles, all of their individual ratings, and the names of the reviewers who wrote those ratings

# Start by joining the series and reviews tables
SELECT title, rating FROM series
JOIN reviews ON series.id = reviews.series_id;

# Now join this output with the reviewers table. I
SELECT title, rating FROM series
JOIN reviews ON series.id = reviews.series_id
JOIN reviewers ON reviews.reviewer_id = reviewers.id;

# Let's add the reviewers' names. We'll need CONCAT for this
SELECT title, rating, CONCAT(first_name, " ", last_name) AS reviewer FROM series
JOIN reviews ON series.id = reviews.series_id
JOIN reviewers ON reviews.reviewer_id = reviewers.id;

# Finally, sort that baby by title
SELECT
  title,
  rating,
  CONCAT(first_name, " ", last_name) AS reviewer
FROM series
JOIN reviews
  ON series.id = reviews.series_id
JOIN reviewers
  ON reviews.reviewer_id = reviewers.id
ORDER BY title;
