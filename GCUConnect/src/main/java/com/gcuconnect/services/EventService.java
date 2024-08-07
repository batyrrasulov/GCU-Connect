package com.gcuconnect.services;

import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.gcuconnect.models.Event;
import com.gcuconnect.repositories.EventRepository;

@Service
public class EventService {

    @Autowired
    private EventRepository eventRepository;

    public Event getEventById(Long eventId) {
        return eventRepository.findById(eventId).orElse(null);
    }

    public Event createEvent(Event event) {
        return eventRepository.save(event);
    }

    public Event updateEvent(Long eventId, Event newEvent) {
        Event existingEvent = eventRepository.findById(eventId).orElse(null);
        if (existingEvent != null) {
            existingEvent.setEventName(newEvent.getEventName());
            existingEvent.setDescription(newEvent.getDescription());
            existingEvent.setEventDate(newEvent.getEventDate());
            existingEvent.setLocation(newEvent.getLocation());
            return eventRepository.save(existingEvent);
        }
        return null; 
    }

    public void deleteEvent(Long eventId) {
        eventRepository.deleteById(eventId);
    }

    public List<Event> getEventsAfterDate(Date eventDate) {
        return eventRepository.findByEventDateAfter(eventDate);
    }

    public List<Event> getEventsByLocation(String location) {
        return eventRepository.findByLocationContainingIgnoreCase(location);
    }
}