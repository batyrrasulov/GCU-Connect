CREATE TABLE EventParticipant (
    event_participant_id INT AUTO_INCREMENT PRIMARY KEY,
    event_id INT,
    user_id INT,
    FOREIGN KEY (event_id) REFERENCES Event(event_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);
SELECT `EventParticipant`.`event_participant_id`,
    `EventParticipant`.`event_id`,
    `EventParticipant`.`user_id`
FROM `gcu_connect`.`EventParticipant`;
