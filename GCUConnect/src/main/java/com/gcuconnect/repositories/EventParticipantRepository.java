package com.gcuconnect.repositories;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.gcuconnect.models.Event;
import com.gcuconnect.models.EventParticipant;
import com.gcuconnect.models.User;

@Repository
public interface EventParticipantRepository extends JpaRepository<EventParticipant, Long> {
    List<EventParticipant> findByEventId(Event eventId);
    List<EventParticipant> findByUserId(User userId);
}