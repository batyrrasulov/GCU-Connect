package com.gcuconnect.controllers;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import com.gcuconnect.models.Message;
import com.gcuconnect.models.User;
import com.gcuconnect.services.MessageService;

@RestController
@RequestMapping("/messages")
public class MessageController {

    @Autowired
    private MessageService messageService;

    @GetMapping("/{senderId}/{receiverId}")
    public ResponseEntity<List<Message>> getMessages(@PathVariable Long senderId, @PathVariable Long receiverId) {
        User sender = new User();
        sender.setUserId(senderId); 
        User receiver = new User();
        receiver.setUserId(receiverId); 
        List<Message> messages = messageService.getMessages(sender, receiver);
        return ResponseEntity.ok(messages);
    }

    @PostMapping
    public ResponseEntity<Message> addMessage(@RequestBody Message message) {
        Message addedMessage = messageService.addMessage(message);
        return ResponseEntity.status(HttpStatus.CREATED).body(addedMessage);
    }

    @DeleteMapping("/{messageId}")
    public ResponseEntity<Void> removeMessage(@PathVariable Long messageId) {
        messageService.removeMessage(messageId);
        return ResponseEntity.noContent().build();
    }
    @PutMapping("/{messageId}")
    public ResponseEntity<Message> updateMessage(@PathVariable Long messageId, @RequestBody Message message) {
        Message updatedMessage = messageService.updateMessage(messageId, message);
        return ResponseEntity.ok(updatedMessage);
    }
    @GetMapping("/all")
    public ResponseEntity<List<Message>> getAllMessages() {
        List<Message> messages = messageService.getAllMessages();
        return ResponseEntity.ok(messages);
    }
}
