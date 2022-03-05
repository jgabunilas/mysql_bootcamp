-- Code written by Jason Gabunilas

-- Challenge 1: Find the 5 oldest users
# List out all users
SELECT * FROM users;

# Now sort users by created_at, ascending order, and limit the output to 5
SELECT * FROM users
ORDER BY created_at ASC
LIMIT 5;

-- Challenge 2: Determine what day of the week most users register on

# Select the created_at column from the users table
SELECT created_at FROM users;

# Apply the DAYNAME() function to created_at
SELECT DAYNAME(created_at) FROM users;

# Group by the dayname
SELECT DAYNAME(created_at) as day_of_wk FROM users
GROUP BY day_of_wk;

# Use the count() function to count the number of times that day of the week registration occurred
SELECT
  DAYNAME(created_at) AS "Day of Week",
  COUNT(*) AS total_registrations
FROM users
GROUP BY DAYNAME(created_at)
ORDER BY total_registrations DESC;

-- Challenge 3: Determine the users who have never posted a photo
# Start with a left join on users and photos
SELECT username, photos.id FROM users
LEFT JOIN photos ON users.id = photos.user_id;

# Remove the photo ids (not needed) and pare down this selection to include only usersnames who have NULL values on the join, indicating that they have no photos in the photos table
SELECT
  username AS "Inactive Users"
FROM users
LEFT JOIN photos
  ON users.id = photos.user_id
WHERE photos.id IS NULL;

-- Challenge 4: The User with the Most-Liked Photo
# Perform a join on the users, photos, and likes tables
SELECT * FROM users
JOIN photos on users.id = photos.user_id
JOIN likes on photos.id = likes.photo_id;

# Narrow down the selection to just usernames and photo_id
SELECT username, photo_id FROM users
JOIN photos on users.id = photos.user_id
JOIN likes on photos.id = likes.photo_id;

# Group by the user and photo_id combo then perform a COUNT() to determine how many times that photo was liked. Order by the count in descending order.
SELECT username, photo_id, COUNT(*) AS num_likes FROM users
JOIN photos on users.id = photos.user_id
JOIN likes on photos.id = likes.photo_id
GROUP BY username, photo_id
ORDER BY num_likes DESC;

# Select just the top person to get our winner!
SELECT
  username,
  photo_id,
  COUNT(*) AS num_likes
FROM users
JOIN photos
  ON users.id = photos.user_id
JOIN likes
  ON photos.id = likes.photo_id
GROUP BY username,
         photo_id
ORDER BY num_likes DESC
LIMIT 1;

-- Challenge 5: Determine how many times the average user posts
# Start by simply counting the total number of users and the total number of photos
SELECT COUNT(*) AS num_users FROM users;
SELECT COUNT(*) AS num_photos FROM photos;

# Now divide the number of photos by the number of users, and you'll get the average number of photos posted per users
SELECT 257 / 100;

# An alternative approach is to use subqueries, where we essentially do exactly as above but use sub-selections
SELECT (SELECT
    COUNT(*)
  FROM photos)
  / (SELECT
    COUNT(*)
  FROM users)
  AS "Average Posts Per User";

-- Challenge 6: Determine the top 5 most commonly used hashtags
# Within photo_tags, GROUP BY tag_id and COUNT the number of times each tag_id appearsALTER
SELECT tag_id, COUNT(tag_id) FROM photo_tags
GROUP BY tag_id;

# Now join this with the tags table, and add a column for the tag_name
SELECT tag_id, tag_name, COUNT(tag_id) AS frequency FROM photo_tags 
JOIN tags ON photo_tags.tag_id = tags.id
GROUP BY tag_id;

# Finally, ORDER BY the frequency in descending order and limit output to the top 5. tag_id can be removed from the selection
SELECT
  tag_name,
  COUNT(tag_id) AS frequency
FROM photo_tags
JOIN tags
  ON photo_tags.tag_id = tags.id
GROUP BY tag_id
ORDER BY frequency DESC
LIMIT 5;


-- Challenge 7: Determine which users are bots - those who have liked every single photo

# Approach 1The brute force approach where we manually have to look for those who make 257 likes.
SELECT user_id, username, COUNT(*) AS num_likes 
FROM likes
JOIN users ON likes.user_id = users.id
GROUP BY user_id
ORDER BY num_likes DESC;

# Approach 2: Using a VIEW to select for users who have made 257 likes
CREATE VIEW total_likes AS
SELECT user_id, username, COUNT(*) AS num_likes 
FROM likes
JOIN users ON likes.user_id = users.id
GROUP BY user_id
ORDER BY num_likes DESC;

SELECT username, num_likes
FROM total_likes
WHERE num_likes = (SELECT COUNT(*) FROM photos);

# Approach 3:
# First find the users who have LIKED at least one photo
SELECT username, user_id FROM users
JOIN likes ON users.id = likes.user_id
GROUP BY likes.user_id;

# Now use COUNT to determine how many times these folks have made "LIKES", and the HAVING statement to determine who has made 257 likes.
SELECT username, COUNT(*) AS num_likes FROM users
JOIN likes ON users.id = likes.user_id
GROUP BY likes.user_id
HAVING num_likes = 257;

# Let's make this dynamic (instead of hard-coding 257) by adding a subquery into the HAVING statement
SELECT username, COUNT(*) AS num_likes FROM users
JOIN likes ON users.id = likes.user_id
GROUP BY likes.user_id
HAVING num_likes = (SELECT COUNT(*) FROM photos);


