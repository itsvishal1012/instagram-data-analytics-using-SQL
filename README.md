# instagram-data-analytics-using-SQL
# Instagram Clone Database

This project implements a relational database schema for an Instagram-like social media application using MySQL. The schema includes tables for users, posts, comments, likes, and followers, along with queries to extract useful insights.

## Database Schema

The database consists of the following tables:

1. **users** - Stores user information.
2. **posts** - Contains details about posts made by users.
3. **comments** - Holds comments on posts.
4. **likes** - Tracks likes on posts.
5. **followers** - Manages user follow relationships.

### Table Descriptions

#### Users Table
```sql
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

#### Posts Table
```sql
CREATE TABLE posts (
    post_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    caption TEXT,
    image_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);
```

#### Comments Table
```sql
CREATE TABLE comments (
    comment_id INT PRIMARY KEY AUTO_INCREMENT,
    post_id INT,
    user_id INT,
    comment_text TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES posts(post_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);
```

#### Likes Table
```sql
CREATE TABLE likes (
    like_id INT PRIMARY KEY AUTO_INCREMENT,
    post_id INT,
    user_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES posts(post_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);
```

#### Followers Table
```sql
CREATE TABLE followers (
    follower_id INT,
    following_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (follower_id, following_id),
    FOREIGN KEY (follower_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (following_id) REFERENCES users(user_id) ON DELETE CASCADE
);
```

## Sample Queries

### Retrieve all posts with user details
```sql
SELECT posts.post_id, users.username, posts.caption, posts.image_url, posts.created_at
FROM posts
JOIN users ON posts.user_id = users.user_id;
```

### Count the number of likes per post
```sql
SELECT post_id, COUNT(*) AS like_count
FROM likes
GROUP BY post_id;
```

### Retrieve the most recent comments on a post
```sql
SELECT comments.comment_text, users.username, comments.created_at
FROM comments
JOIN users ON comments.user_id = users.user_id
WHERE comments.post_id = ?
ORDER BY comments.created_at DESC;
```

### Find the most followed users
```sql
SELECT users.username, COUNT(followers.follower_id) AS followers_count
FROM users
JOIN followers ON users.user_id = followers.following_id
GROUP BY users.username
ORDER BY followers_count DESC;
```

## Setup Instructions

1. Install MySQL on your system.
2. Run the provided SQL script to create the database and tables.
3. Insert sample data for testing.
4. Execute queries to retrieve and analyze data.

## Future Enhancements

- Implement indexing for faster queries.
- Add stored procedures for common operations.
- Integrate with a web-based frontend for interaction.

## License
This project is open-source and can be used freely for learning and development purposes.

---

Feel free to modify the schema and queries based on your requirements!

