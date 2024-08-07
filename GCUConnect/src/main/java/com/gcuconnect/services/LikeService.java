package com.gcuconnect.services;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.gcuconnect.models.User;
import com.gcuconnect.models.Post;
import com.gcuconnect.models.Comment;
import com.gcuconnect.models.Like;
import com.gcuconnect.repositories.LikeRepository;

@Service
public class LikeService {

    @Autowired
    private LikeRepository likeRepository;

    public List<Like> getUserLikes(User userId, String contentType) {
        return likeRepository.findByUserIdAndContentType(userId, contentType);
    }

    public List<Like> getContentLikes(Post postId, String contentType) {
        return likeRepository.findByContentIdAndContentType(postId, contentType);
    }

    public List<Like> getContentLikes(Comment commentId, String contentType) {
        return likeRepository.findByContentIdAndContentType(commentId, contentType);
    }

    public Like addLike(Like like) {
        return likeRepository.save(like);
    }

    public void removeLike(Long likeId) {
        likeRepository.deleteById(likeId);
    }
}
