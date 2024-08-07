CREATE TABLE Message (
    message_id INT AUTO_INCREMENT PRIMARY KEY,
    sender_id INT,
    receiver_id INT,
    content TEXT,
    message_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES User(user_id),
    FOREIGN KEY (receiver_id) REFERENCES User(user_id)
);
SELECT `Message`.`message_id`,
    `Message`.`sender_id`,
    `Message`.`receiver_id`,
    `Message`.`content`,
    `Message`.`message_date`
FROM `gcu_connect`.`Message`;
