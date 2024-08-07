package com.gcuconnect.controllers;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import com.gcuconnect.models.User;
import com.gcuconnect.models.Post;
import com.gcuconnect.models.Like;
import com.gcuconnect.services.LikeService;

@RestController
@RequestMapping("/likes")
public class LikeController {

    @Autowired
    private LikeService likeService;

    @GetMapping("/user/{userId}/{contentType}")
    public ResponseEntity<List<Like>> getUserLikes(@PathVariable Long userId, @PathVariable String contentType) {
        User user = new User();
        user.setUserId(userId); 
        List<Like> likes = likeService.getUserLikes(user, contentType);
        return ResponseEntity.ok(likes);
    }

    @GetMapping("/content/{postId}/{contentType}")
    public ResponseEntity<List<Like>> getContentLikes(@PathVariable Long postId, @PathVariable String contentType) {
        Post post = new Post();
        post.setPostId(postId); 
        List<Like> likes = likeService.getContentLikes(post, contentType);
        return ResponseEntity.ok(likes);
    }

    @PostMapping
    public ResponseEntity<Like> addLike(@RequestBody Like like) {
        Like addedLike = likeService.addLike(like);
        return ResponseEntity.status(HttpStatus.CREATED).body(addedLike);
    }

    @DeleteMapping("/{likeId}")
    public ResponseEntity<Void> removeLike(@PathVariable Long likeId) {
        likeService.removeLike(likeId);
        return ResponseEntity.noContent().build();
    }
}
