package com.gcuconnect.controllers;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import com.gcuconnect.models.EventParticipant;
import com.gcuconnect.models.Event;
import com.gcuconnect.models.User;
import com.gcuconnect.services.EventParticipantService;

@RestController
@RequestMapping("/eventParticipants")
public class EventParticipantController {

    @Autowired
    private EventParticipantService eventParticipantService;

    @GetMapping("/event/{eventId}")
    public ResponseEntity<List<EventParticipant>> getParticipantsByEvent(@PathVariable Long eventId) {
        Event event = new Event();
        event.setEventId(eventId); 
        List<EventParticipant> participants = eventParticipantService.getParticipantsByEvent(event);
        return ResponseEntity.ok(participants);
    }

    @GetMapping("/user/{userId}")
    public ResponseEntity<List<EventParticipant>> getEventsAttendedByUser(@PathVariable Long userId) {
        User user = new User();
        user.setUserId(userId); 
        List<EventParticipant> eventsAttended = eventParticipantService.getEventsAttendedByUser(user);
        return ResponseEntity.ok(eventsAttended);
    }

    @PostMapping
    public ResponseEntity<EventParticipant> addParticipant(@RequestBody EventParticipant eventParticipant) {
        EventParticipant addedParticipant = eventParticipantService.addParticipant(eventParticipant);
        return ResponseEntity.status(HttpStatus.CREATED).body(addedParticipant);
    }

    @DeleteMapping("/{eventParticipantId}")
    public ResponseEntity<Void> removeParticipant(@PathVariable Long eventParticipantId) {
        eventParticipantService.removeParticipant(eventParticipantId);
        return ResponseEntity.noContent().build();
    }
}