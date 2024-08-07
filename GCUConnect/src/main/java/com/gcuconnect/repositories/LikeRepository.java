package com.gcuconnect.repositories;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.gcuconnect.models.Like;
import com.gcuconnect.models.User;
import com.gcuconnect.models.Post;
import com.gcuconnect.models.Comment;

@Repository
public interface LikeRepository extends JpaRepository<Like, Long> {
    List<Like> findByUserIdAndContentType(User userId, String contentType);
    List<Like> findByContentIdAndContentType(Post postId, String contentType);
    List<Like> findByContentIdAndContentType(Comment commentId, String contentType);
}
