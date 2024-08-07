CREATE TABLE Post (
    post_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    content TEXT,
    post_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    likes INT,
    comments INT,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);
SELECT `Post`.`post_id`,
    `Post`.`user_id`,
    `Post`.`content`,
    `Post`.`post_date`,
    `Post`.`likes`,
    `Post`.`comments`
FROM `gcu_connect`.`Post`;
