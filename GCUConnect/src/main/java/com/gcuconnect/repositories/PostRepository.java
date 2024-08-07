package com.gcuconnect.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.gcuconnect.models.Post;
import com.gcuconnect.models.User;

@Repository
public interface PostRepository extends JpaRepository<Post, Long> {
	
	List<Post> findByUserId(User user);
    List<Post> findByContentContains(String keyword);
}
