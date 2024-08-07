CREATE TABLE `User` (
    `user_id` INT AUTO_INCREMENT PRIMARY KEY,
    `username` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `password_hash` VARCHAR(255) NOT NULL,
    `profile_picture_url` VARCHAR(255),
    `bio` TEXT,
    `registration_date` DATETIME DEFAULT CURRENT_TIMESTAMP
);
SELECT `User`.`user_id`,
    `User`.`username`,
    `User`.`email`,
    `User`.`password_hash`,
    `User`.`profile_picture_url`,
    `User`.`bio`,
    `User`.`registration_date`
FROM `gcu_connect`.`User`;
