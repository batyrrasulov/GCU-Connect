ALTER TABLE Message
ADD FOREIGN KEY (sender_id) REFERENCES User(user_id);

ALTER TABLE Message
ADD FOREIGN KEY (receiver_id) REFERENCES User(user_id);

ALTER TABLE EventParticipant
ADD FOREIGN KEY (event_id) REFERENCES Event(event_id);

ALTER TABLE EventParticipant
ADD FOREIGN KEY (user_id) REFERENCES User(user_id);
