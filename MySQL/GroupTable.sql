CREATE TABLE `Group` (
   group_id INT AUTO_INCREMENT PRIMARY KEY,
   group_name VARCHAR(255) NOT NULL,
   description TEXT,
   creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
SELECT `Group`.`group_id`,
    `Group`.`group_name`,
    `Group`.`description`,
    `Group`.`creation_date`
FROM `gcu_connect`.`Group`;
