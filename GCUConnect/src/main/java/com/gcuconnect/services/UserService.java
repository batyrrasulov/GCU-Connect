package com.gcuconnect.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.gcuconnect.models.User;
import com.gcuconnect.repositories.UserRepository;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public User getUserById(Long userId) {
        return userRepository.findById(userId).orElse(null);
    }

    public User createUser(User user) {
        return userRepository.save(user);
    }

    public User updateUser(Long userId, User newUser) {
        User existingUser = userRepository.findById(userId).orElse(null);
        if (existingUser != null) {
            existingUser.setUsername(newUser.getUsername());
            existingUser.setEmail(newUser.getEmail());
            existingUser.setPassword_hash(newUser.getPassword_hash());
            existingUser.setProfile_picture_url(newUser.getProfile_picture_url());
            existingUser.setBio(newUser.getBio());
            return userRepository.save(existingUser);
        }
        return null; 
    }

    public void deleteUser(Long userId) {
        userRepository.deleteById(userId);
    }
}
