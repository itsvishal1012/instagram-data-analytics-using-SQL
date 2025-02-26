CREATE DATABASE instagram;
USE instagram;

CREATE TABLE insta_users (
  user_id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT  NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  phone_number VARCHAR(20) UNIQUE
);

CREATE TABLE Posts(
   post_id SERIAL PRIMARY KEY,
   user_id BIGINT UNSIGNED NOT NULL,
   caption TEXT,
   image_url TEXT,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
   FOREIGN KEY (user_id) REFERENCES insta_users(user_id) 
);

CREATE TABLE Comments(
   comment_id SERIAL PRIMARY KEY,
   post_id BIGINT UNSIGNED NOT NULL,
   user_id BIGINT UNSIGNED NOT NULL,
   comment_text TEXT NOT NULL,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
   FOREIGN KEY (post_id) REFERENCES Posts(post_id),
   FOREIGN KEY (user_id) REFERENCES insta_users(user_id) 
);

CREATE TABLE Likes(
   like_id SERIAL PRIMARY KEY,
   post_id BIGINT UNSIGNED NOT NULL,
   user_id BIGINT UNSIGNED NOT NULL,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   FOREIGN KEY (post_id) REFERENCES Posts(post_id),
   FOREIGN KEY (user_id) REFERENCES insta_users(user_id)
);

CREATE TABLE Followers (
    follower_id SERIAL PRIMARY KEY,
    user_id BIGINT UNSIGNED NOT NULL,
    follower_user_id BIGINT UNSIGNED NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES insta_users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (follower_user_id) REFERENCES insta_users(user_id) ON DELETE CASCADE
);

INSERT INTO insta_users (name, email, phone_number) VALUES
('Aarav Sharma', 'aarav.sharma@example.com', '+91 9876543210'),
('Ananya Verma', 'ananya.verma@example.com', '+91 8765432109'),
('Rajesh Kumar', 'rajesh.kumar@example.com', '+91 9988776655'),
('Priya Singh', 'priya.singh@example.com', '+91 9874563210'),
('Vikram Reddy', 'vikram.reddy@example.com', '+91 7896541230'),
('Sanya Malhotra', 'sanya.malhotra@example.com', '+91 9988221133'),
('Rohit Mehta', 'rohit.mehta@example.com', '+91 9123456780'),
('Kavya Iyer', 'kavya.iyer@example.com', '+91 9234567890'),
('Arjun Nair', 'arjun.nair@example.com', '+91 9345678901'),
('Meera Pillai', 'meera.pillai@example.com', '+91 9456789012'),
('Deepak Joshi', 'deepak.joshi@example.com', '+91 9567890123'),
('Pooja Chauhan', 'pooja.chauhan@example.com', '+91 9678901234'),
('Siddharth Mishra', 'siddharth.mishra@example.com', '+91 9789012345'),
('Neha Tiwari', 'neha.tiwari@example.com', '+91 9890123456'),
('Amit Patel', 'amit.patel@example.com', '+91 9901234567'),
('Swati Saxena', 'swati.saxena@example.com', '+91 9812345678'),
('Karan Kapoor', 'karan.kapoor@example.com', '+91 9823456789'),
('Riya Desai', 'riya.desai@example.com', '+91 9734567890'),
('Manoj Agarwal', 'manoj.agarwal@example.com', '+91 9645678901'),
('Divya Bhatia', 'divya.bhatia@example.com', '+91 9556789012');

INSERT INTO Posts (user_id, caption, image_url) VALUES
(1, 'Sunset at Marine Drive 🌅', 'https://example.com/marine_drive.jpg'),
(2, 'Chai peene ka maza hi alag hai ☕', 'https://example.com/tea.jpg'),
(3, 'Exploring the streets of Delhi 🏙️', 'https://example.com/delhi_street.jpg'),
(4, 'Taj Mahal - Symbol of Love ❤️', 'https://example.com/taj_mahal.jpg'),
(5, 'Diwali vibes all around! 🪔✨', 'https://example.com/diwali.jpg'),
(6, 'Enjoying pani puri at Chowpatty 😋', 'https://example.com/pani_puri.jpg'),
(7, 'Riding a Royal Enfield in Ladakh 🏍️', 'https://example.com/ladakh.jpg'),
(8, 'Biryani is life! 🍛', 'https://example.com/biryani.jpg'),
(9, 'Gateway of India visit 🇮🇳', 'https://example.com/gateway_of_india.jpg'),
(10, 'Himalayas calling! 🏔️', 'https://example.com/himalayas.jpg'),
(11, 'Bollywood dreams in Mumbai 🎬', 'https://example.com/bollywood.jpg'),
(12, 'Ganga Aarti at Varanasi 🙏', 'https://example.com/ganga_aarti.jpg'),
(13, 'South Indian breakfast - Dosa & Idli 😍', 'https://example.com/dosa.jpg'),
(14, 'Holi colors everywhere! 🎨', 'https://example.com/holi.jpg'),
(15, 'Rajasthan’s royal heritage 🏰', 'https://example.com/rajasthan.jpg'),
(16, 'Visiting Mysore Palace 🏯', 'https://example.com/mysore_palace.jpg'),
(17, 'Street shopping in Sarojini Nagar 🛍️', 'https://example.com/sarojini_nagar.jpg'),
(18, 'Train journey with cutting chai 🚂☕', 'https://example.com/train_journey.jpg'),
(19, 'Watching the sunrise at Kanyakumari 🌅', 'https://example.com/kanyakumari.jpg'),
(20, 'Enjoying monsoon at Lonavala 🌧️', 'https://example.com/lonavala.jpg');

INSERT INTO Comments (post_id, user_id, comment_text) VALUES
(1, 2, 'Amazing picture! 😍'),
(2, 3, 'Looks stunning! ❤️'),
(3, 4, 'Where is this place? 🤩'),
(4, 5, 'Incredible view!'),
(5, 6, 'Happy Diwali! 🪔✨'),
(6, 7, 'Chai peene ka maza hi alag hai ☕'),
(7, 8, 'Ladakh is on my bucket list! 🏍️'),
(8, 9, 'Biryani lovers unite! 🍛'),
(9, 10, 'I love Mumbai! 🇮🇳'),
(10, 1, 'Himalayas calling! 🏔️'),
(11, 2, 'Bollywood dreams! 🎬'),
(12, 3, 'Ganga Aarti is so peaceful. 🙏'),
(13, 4, 'South Indian food is the best! 😍'),
(14, 5, 'Holi celebrations are so colorful! 🎨'),
(15, 6, 'Rajasthan is truly royal! 🏰'),
(16, 7, 'Mysore Palace is amazing! 🏯'),
(17, 8, 'Shopping spree in Sarojini Nagar! 🛍️'),
(18, 9, 'Train journeys in India are special. 🚂'),
(19, 10, 'Kanyakumari sunrise is magical! 🌅'),
(20, 1, 'Monsoon in Lonavala is the best! 🌧️');

INSERT INTO Likes (post_id, user_id) VALUES
(1, 5), (2, 3), (3, 6), (4, 8), (5, 9), 
(6, 2), (7, 10), (8, 1), (9, 7), (10, 4), 
(11, 6), (12, 5), (13, 2), (14, 9), (15, 8), 
(16, 7), (17, 4), (18, 3), (19, 10), (20, 1);

INSERT INTO Followers (user_id, follower_user_id) VALUES
(1, 4), (1, 6), (2, 3), (2, 7), (3, 1), 
(3, 8), (4, 5), (4, 10), (5, 9), (5, 2), 
(6, 1), (6, 4), (7, 3), (7, 9), (8, 2), 
(8, 5), (9, 6), (9, 10), (10, 7), (10, 8);


-- Display all users
SELECT * FROM insta_users;

-- Display all posts
SELECT * FROM Posts;

-- Display all comments
SELECT * FROM Comments;

-- Display all likes
SELECT * FROM Likes;

-- Display all followers
SELECT * FROM Followers;

-- Get the Total Number of Users
SELECT COUNT(*) AS total_users FROM insta_users;

-- Find the Most Liked Post
SELECT p.post_id, p.caption, COUNT(l.like_id) AS like_count
FROM Posts p
JOIN Likes l ON p.post_id = l.post_id
GROUP BY p.post_id
ORDER BY like_count DESC
LIMIT 1;

-- Find the User with the Most Followers
SELECT u.user_id, u.name, COUNT(f.follower_user_id) AS followers_count
FROM insta_users u
JOIN Followers f ON u.user_id = f.user_id
GROUP BY u.user_id
ORDER BY followers_count DESC
LIMIT 1;

-- List All Posts Along with Their Like Counts
SELECT p.post_id, p.caption, COUNT(l.like_id) AS like_count
FROM Posts p
LEFT JOIN Likes l ON p.post_id = l.post_id
GROUP BY p.post_id
ORDER BY like_count DESC;

-- Find the User Who Has Liked the Most Posts
SELECT u.user_id, u.name, COUNT(l.like_id) AS total_likes_given
FROM insta_users u
JOIN Likes l ON u.user_id = l.user_id
GROUP BY u.user_id
ORDER BY total_likes_given DESC
LIMIT 1;

-- Get All Comments for a Specific Post (e.g., Post ID = 5)
SELECT c.comment_text, u.name, c.created_at
FROM Comments c
JOIN insta_users u ON c.user_id = u.user_id
WHERE c.post_id = 5
ORDER BY c.created_at DESC;

-- Find the Users Who Have Never Posted Anything
SELECT u.user_id, u.name 
FROM insta_users u
LEFT JOIN Posts p ON u.user_id = p.user_id
WHERE p.post_id IS NULL;

-- Find the Most Active Commenter
SELECT u.user_id, u.name, COUNT(c.comment_id) AS comment_count
FROM insta_users u
JOIN Comments c ON u.user_id = c.user_id
GROUP BY u.user_id
ORDER BY comment_count DESC
LIMIT 1;

-- Find Mutual Followers (Users Who Follow Each Other)
SELECT f1.user_id AS user1, f1.follower_user_id AS user2
FROM Followers f1
JOIN Followers f2 ON f1.user_id = f2.follower_user_id AND f1.follower_user_id = f2.user_id;

-- Get All Users Followed by a Specific User (e.g., User ID = 1)
SELECT u.user_id, u.name
FROM insta_users u
JOIN Followers f ON u.user_id = f.user_id
WHERE f.follower_user_id = 1;

-- Updating the caption of post_id 3
UPDATE Posts
SET caption = 'Best pizza ever'
WHERE post_id = 3;

-- Selecting all the posts where user_id is 16
SELECT *
FROM Posts
WHERE user_id = 16;

-- Selecting all the posts and ordering them by created_at in descending order
SELECT *
FROM Posts
ORDER BY created_at DESC;

-- Counting the number of likes for each post and showing only the posts with more than 2 likes
SELECT Posts.post_id, COUNT(Likes.like_id) AS num_likes
FROM Posts
LEFT JOIN Likes ON Posts.post_id = Likes.post_id
GROUP BY Posts.post_id
HAVING COUNT(Likes.like_id) > 2;

-- Finding all the users who have commented on post_id 9
SELECT name
FROM insta_users
WHERE user_id IN (
    SELECT user_id
    FROM Comments
    WHERE post_id = 9
);

-- Ranking the posts based on the number of likes
SELECT post_id, num_likes, RANK() OVER (ORDER BY num_likes DESC) AS 'rank'
FROM (
    SELECT Posts.post_id, COUNT(Likes.like_id) AS num_likes
    FROM Posts
    LEFT JOIN Likes ON Posts.post_id = Likes.post_id
    GROUP BY Posts.post_id
) AS likes_by_post;

-- Finding all the posts and their comments using a Common Table Expression (CTE)
WITH post_comments AS (
    SELECT Posts.post_id, Posts.caption, Comments.comment_text
    FROM Posts
    LEFT JOIN Comments ON Posts.post_id = Comments.post_id
)
SELECT *
FROM post_comments;

-- Categorizing the posts based on the number of likes
SELECT
    post_id,
    CASE
        WHEN num_likes = 0 THEN 'No likes'
        WHEN num_likes = 1 THEN 'Few likes'
        WHEN num_likes = 2 THEN 'Some likes'
        ELSE 'Lots of likes'
    END AS like_category
FROM (
    SELECT Posts.post_id, COUNT(Likes.like_id) AS num_likes
    FROM Posts
    LEFT JOIN Likes ON Posts.post_id = Likes.post_id
    GROUP BY Posts.post_id
) AS likes_by_post;

-- Finding all the posts created in the last month
SELECT * 
FROM Posts 
WHERE created_at >= DATE_FORMAT(NOW() - INTERVAL 1 MONTH, '%Y-%m-01');

-- Updated Query with Dense Rank for Likes
SELECT post_id, num_likes, 
       RANK() OVER (ORDER BY num_likes DESC) AS rank_position,
       DENSE_RANK() OVER (ORDER BY num_likes DESC) AS dense_rank_position
FROM (
    SELECT Posts.post_id, COUNT(Likes.like_id) AS num_likes
    FROM Posts
    LEFT JOIN Likes ON Posts.post_id = Likes.post_id
    GROUP BY Posts.post_id
) AS likes_by_post;

-- Updated Query with Wide Difference in Ranking
SELECT post_id, num_likes,
       NTILE(5) OVER (ORDER BY num_likes DESC) AS tier_rank,
       CASE 
           WHEN num_likes >= 50 THEN '🔥 Viral Post'
           WHEN num_likes >= 20 THEN '🚀 Trending'
           WHEN num_likes >= 10 THEN '✨ Popular'
           WHEN num_likes >= 5 THEN '👍 Noticed'
           ELSE '😢 Needs More Love'
       END AS popularity_category
FROM (
    SELECT Posts.post_id, COUNT(Likes.like_id) AS num_likes
    FROM Posts
    LEFT JOIN Likes ON Posts.post_id = Likes.post_id
    GROUP BY Posts.post_id
) AS likes_by_post
ORDER BY num_likes DESC;

-- Find the Most Engaging Posts (Likes + Comments)
SELECT p.post_id, p.caption, 
       COUNT(DISTINCT l.like_id) AS like_count, 
       COUNT(DISTINCT c.comment_id) AS comment_count, 
       (COUNT(DISTINCT l.like_id) + COUNT(DISTINCT c.comment_id)) AS engagement_score
FROM Posts p
LEFT JOIN Likes l ON p.post_id = l.post_id
LEFT JOIN Comments c ON p.post_id = c.post_id
GROUP BY p.post_id
ORDER BY engagement_score DESC
LIMIT 5;

-- Find the Most Active Users (Who Like, Comment & Post the Most)
SELECT u.user_id, u.name, 
       COUNT(DISTINCT p.post_id) AS total_posts, 
       COUNT(DISTINCT c.comment_id) AS total_comments, 
       COUNT(DISTINCT l.like_id) AS total_likes_given, 
       (COUNT(DISTINCT p.post_id) + COUNT(DISTINCT c.comment_id) + COUNT(DISTINCT l.like_id)) AS activity_score
FROM insta_users u
LEFT JOIN Posts p ON u.user_id = p.user_id
LEFT JOIN Comments c ON u.user_id = c.user_id
LEFT JOIN Likes l ON u.user_id = l.user_id
GROUP BY u.user_id
ORDER BY activity_score DESC
LIMIT 5;

-- Find Users Who Like Each Other’s Posts (Mutual Likes)
SELECT l1.user_id AS user1, l2.user_id AS user2
FROM Likes l1
JOIN Likes l2 ON l1.user_id = l2.post_id AND l2.user_id = l1.post_id
WHERE l1.user_id < l2.user_id;

-- Find Posts That Have No Likes or Comments
SELECT p.post_id, p.caption 
FROM Posts p
LEFT JOIN Likes l ON p.post_id = l.post_id
LEFT JOIN Comments c ON p.post_id = c.post_id
WHERE l.like_id IS NULL AND c.comment_id IS NULL;

-- Find Users Who Have Never Liked or Commented on Any Post
SELECT u.user_id, u.name
FROM insta_users u
LEFT JOIN Likes l ON u.user_id = l.user_id
LEFT JOIN Comments c ON u.user_id = c.user_id
WHERE l.like_id IS NULL AND c.comment_id IS NULL;

-- Find the Average Number of Likes per Post
SELECT AVG(like_count) AS avg_likes_per_post
FROM (
    SELECT COUNT(l.like_id) AS like_count
    FROM Posts p
    LEFT JOIN Likes l ON p.post_id = l.post_id
    GROUP BY p.post_id
) AS post_likes;

-- Find the Users with the Most One-Sided Followers
SELECT u.user_id, u.name, COUNT(f.follower_user_id) AS total_followers, 
       (COUNT(f.follower_user_id) - COUNT(f2.user_id)) AS one_sided_followers
FROM insta_users u
LEFT JOIN Followers f ON u.user_id = f.user_id
LEFT JOIN Followers f2 ON u.user_id = f2.follower_user_id
GROUP BY u.user_id
ORDER BY one_sided_followers DESC
LIMIT 5;

-- Find the First and Last Post for Each User
SELECT user_id, 
       MIN(created_at) AS first_post_time, 
       MAX(created_at) AS last_post_time
FROM Posts
GROUP BY user_id;

-- Find the Most Liked Comment on Each Post
SELECT c.post_id, c.comment_id, c.comment_text, COUNT(l.like_id) AS likes_on_comment
FROM Comments c
LEFT JOIN Likes l ON c.comment_id = l.post_id
GROUP BY c.post_id, c.comment_id, c.comment_text
ORDER BY likes_on_comment DESC;












