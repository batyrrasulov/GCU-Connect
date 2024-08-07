CREATE TABLE Comment (
    comment_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    post_id INT,
    content TEXT,
    comment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (post_id) REFERENCES Post(post_id)
);
SELECT `Comment`.`comment_id`,
    `Comment`.`user_id`,
    `Comment`.`post_id`,
    `Comment`.`content`,
    `Comment`.`comment_date`
FROM `gcu_connect`.`Comment`;
