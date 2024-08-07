-- CRUD (Create, Read, Update, Delete) methods

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

-- PostTable
-- Create
INSERT INTO Post (user_id, content, likes, comments)
VALUES (1, 'New post content', 0, 0);
-- Read
SELECT * FROM Post;
-- Update
UPDATE Post
SET content = 'Updated post content'
WHERE post_id = 1;
-- Delete
DELETE FROM Post
WHERE post_id = 1;

-- MessageTable
-- Create
INSERT INTO Message (sender_id, receiver_id, content)
VALUES (1, 2, 'New message content');
-- Read
SELECT * FROM Message;
-- Update 
UPDATE Message
SET content = 'Updated message content'
WHERE message_id = 1;
-- Delete
DELETE FROM Message
WHERE message_id = 1;

-- CommentTable
-- Create
INSERT INTO Comment (user_id, post_id, content)
VALUES (1, 2, 'New comment content');
-- Read
SELECT * FROM Comment;
-- Update
UPDATE Comment
SET content = 'Updated comment content'
WHERE comment_id = 1;
-- Delete
DELETE FROM Comment
WHERE comment_id = 1;

-- LikeTable
-- Create
INSERT INTO `Like` (user_id, content_id, content_type)
VALUES (1, 2, 'post');
-- Read
SELECT * FROM `Like`;
-- Update (N/A)
-- Delete 
DELETE FROM `Like`
WHERE like_id = 1;

-- EventTable 
-- Create
INSERT INTO Event (event_name, description, event_date, location)
VALUES ('New Event', 'Description of new event', '2024-02-22 15:00:00', 'New Location');
-- Read
SELECT * FROM Event;
-- Update
UPDATE Event
SET location = 'Updated location'
WHERE event_id = 1;
-- Delete
DELETE FROM Event
WHERE event_id = 1;

-- EventParticipantTable 
-- Create
INSERT INTO EventParticipant (event_id, user_id)
VALUES (1, 1);
-- Read
SELECT * FROM EventParticipant;
-- Update (N/A)
-- Delete
DELETE FROM EventParticipant
WHERE event_participant_id = 1;

-- GroupTable
-- Create
INSERT INTO `Group` (group_name, description)
VALUES ('New Group', 'Description of new group');
-- Read
SELECT * FROM `Group`;
-- Update
UPDATE `Group`
SET description = 'Updated group description'
WHERE group_id = 1;
-- Delete
DELETE FROM `Group`
WHERE group_id = 1;

-- GroupMemberTable 
-- Create
INSERT INTO GroupMember (group_id, user_id)
VALUES (1, 1);
-- Read
SELECT * FROM GroupMember;
-- Update (N/A)
-- Delete 
DELETE FROM GroupMember
WHERE group_member_id = 1;

