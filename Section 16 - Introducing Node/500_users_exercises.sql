-- Code written by Jason Gabunilas

-- Exercise 1: Find the earliest date that a user joined in the form MonthName Day_suffixed Year4digit

SELECT
  DATE_FORMAT(created_at, '%M %D %Y') AS earliest_date
FROM users
ORDER BY created_at ASC
LIMIT 1;

-- Exercise 2: Find the Email of the First User Who Registered
# The easiest way
SELECT
  email,
  created_at
FROM users
ORDER BY created_at ASC
LIMIT 1;

# Here's another way using MAX() and a subquery
SELECT
  email,
  created_at
FROM users
WHERE created_at = (SELECT
  MIN(created_at)
FROM users);
    
-- Exercise 3: Create a table where you count the number of users that joined in a given month. It doesn't matter if the months are in different years - we just want to know the most popular month to join

SELECT
  MONTHNAME(created_at) AS month,
  COUNT(*) AS 'count'
FROM users
GROUP BY month
ORDER BY count DESC;

-- Exercise 4: Count the number of users with yahoo.com email addresses
SELECT
  COUNT(*) AS yahoo_users
FROM users
WHERE email LIKE '%yahoo.com';

-- Exercise 5: Calculate the total number of users for each email host
SELECT
  CASE
    WHEN email LIKE '%gmail.com' THEN 'gmail'
    WHEN email LIKE '%yahoo.com' THEN 'yahoo'
    WHEN email LIKE '%hotmail.com' THEN 'hotmail'
    ELSE 'other'
  END AS provider,
  COUNT(*) AS total_users
FROM users
GROUP BY provider
ORDER BY total_users DESC;






