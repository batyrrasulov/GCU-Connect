-- CRUD (Create, Read, Update, Delete)

-- UserTable
-- Create
INSERT INTO User (username, email, password_hash, profile_picture_url, bio)
VALUES ('new_user', 'new_user@example.com', 'hashed_password', 'profile_pic_url', 'New user bio');
-- Read
SELECT * FROM User;
-- Update
UPDATE User
SET username = 'updated_username'
WHERE user_id = 1;
-- Delete
DELETE FROM User
WHERE user_id = 1;


