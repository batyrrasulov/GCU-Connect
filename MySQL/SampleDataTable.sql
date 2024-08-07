INSERT INTO User (username, email, password_hash, profile_picture_url, bio)
VALUES
  ('user1', 'user1@example.com', 'hashed_password_1', 'profile_pic_url_1', 'User 1 bio'),
  ('user2', 'user2@example.com', 'hashed_password_2', 'profile_pic_url_2', 'User 2 bio');

INSERT INTO Post (user_id, content, likes, comments)
VALUES
  (1, 'Post 1 content', 10, 5),
  (2, 'Post 2 content', 20, 15);

INSERT INTO Comment (user_id, post_id, content)
VALUES
  (1, 2, 'Comment 1 on Post 2'),
  (2, 1, 'Comment 2 on Post 1');

INSERT INTO Message (sender_id, receiver_id, content)
VALUES
  (1, 2, 'Hello from User 1 to User 2'),
  (2, 1, 'Hi User 1, how are you?');

INSERT INTO Event (event_name, description, event_date, location)
VALUES
  ('Event 1', 'Description of Event 1', '2023-10-31 15:00:00', 'Location 1'),
  ('Event 2', 'Description of Event 2', '2023-11-15 18:30:00', 'Location 2');

INSERT INTO EventParticipant (event_id, user_id)
VALUES
  (1, 1),
  (1, 2),
  (2, 2);

INSERT INTO `Like` (user_id, content_id, content_type)
VALUES
  (1, 1, 'post'),
  (2, 3, 'comment');

INSERT INTO `Group` (group_name, description)
VALUES
  ('Group 1', 'Description of Group 1'),
  ('Group 2', 'Description of Group 2');

INSERT INTO `GroupMember` (group_id, user_id)
VALUES
  (1, 1), 
  (1, 2), 
  (2, 2);
  