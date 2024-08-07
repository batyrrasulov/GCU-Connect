CREATE TABLE Event (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    event_name VARCHAR(255) NOT NULL,
    description TEXT,
    event_date DATETIME,
    location VARCHAR(255)
);
SELECT `Event`.`event_id`,
    `Event`.`event_name`,
    `Event`.`description`,
    `Event`.`event_date`,
    `Event`.`location`
FROM `gcu_connect`.`Event`;
