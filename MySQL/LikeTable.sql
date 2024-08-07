CREATE TABLE `Like` (
   like_id INT AUTO_INCREMENT PRIMARY KEY,
   user_id INT,
   content_id INT,
   content_type VARCHAR(255),
   FOREIGN KEY (user_id) REFERENCES User(user_id),
   FOREIGN KEY (content_id) REFERENCES Post(post_id) ON DELETE CASCADE,
   FOREIGN KEY (content_id) REFERENCES Comment(comment_id) ON DELETE CASCADE
);
SELECT `Like`.`like_id`,
    `Like`.`user_id`,
    `Like`.`content_id`,
    `Like`.`content_type`
FROM `gcu_connect`.`Like`;
