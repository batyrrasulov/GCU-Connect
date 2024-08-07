package com.gcuconnect.services;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.gcuconnect.models.Event;
import com.gcuconnect.models.EventParticipant;
import com.gcuconnect.models.User;
import com.gcuconnect.repositories.EventParticipantRepository;

@Service
public class EventParticipantService {

    @Autowired
    private EventParticipantRepository eventParticipantRepository;

    public List<EventParticipant> getParticipantsByEvent(Event eventId) {
        return eventParticipantRepository.findByEventId(eventId);
    }

    public List<EventParticipant> getEventsAttendedByUser(User userId) {
        return eventParticipantRepository.findByUserId(userId);
    }

    public EventParticipant addParticipant(EventParticipant eventParticipant) {
        return eventParticipantRepository.save(eventParticipant);
    }

    public void removeParticipant(Long eventParticipantId) {
        eventParticipantRepository.deleteById(eventParticipantId);
    }
}