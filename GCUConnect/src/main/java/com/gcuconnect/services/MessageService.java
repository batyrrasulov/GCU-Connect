package com.gcuconnect.services;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.gcuconnect.models.Message;
import com.gcuconnect.models.User;
import com.gcuconnect.repositories.MessageRepository;

@Service
public class MessageService {

    @Autowired
    private MessageRepository messageRepository;

    public List<Message> getMessages(User senderId, User receiverId) {
        return messageRepository.findBySenderIdAndReceiverId(senderId, receiverId);
    }

    public Message addMessage(Message message) {
        return messageRepository.save(message);
    }

    public void removeMessage(Long messageId) {
        messageRepository.deleteById(messageId);
    }
    public List<Message> getAllMessages() {
        return messageRepository.findAll();
    }
    public Message updateMessage(Long messageId, Message message) {
        if (!messageRepository.existsById(messageId)) {
            throw new RuntimeException("Message not found");
        }
        message.setMessageId(messageId);
        return messageRepository.save(message);
    }
}
