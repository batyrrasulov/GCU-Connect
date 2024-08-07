CREATE TABLE `GroupMember` (
   group_member_id INT AUTO_INCREMENT PRIMARY KEY,
   group_id INT,
   user_id INT,
   join_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   FOREIGN KEY (group_id) REFERENCES `Group`(`group_id`),
   FOREIGN KEY (user_id) REFERENCES `User`(`user_id`)
);
SELECT `GroupMember`.`group_member_id`,
    `GroupMember`.`group_id`,
    `GroupMember`.`user_id`,
    `GroupMember`.`join_date`
FROM `gcu_connect`.`GroupMember`;
