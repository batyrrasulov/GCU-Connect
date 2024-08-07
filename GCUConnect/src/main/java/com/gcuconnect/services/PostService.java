package com.gcuconnect.services;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.gcuconnect.models.Post;
import com.gcuconnect.repositories.PostRepository;

@Service
public class PostService {

    @Autowired
    private PostRepository postRepository;
    
    public List<Post> getAllPosts() {
        return postRepository.findAll();
    }
    
    public Post getPostById(Long postId) {
        return postRepository.findById(postId).orElse(null);
    }

    public Post createPost(Post post) {
    	try {
            post.setPost_date(new Date());

            return postRepository.save(post);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public Post updatePost(Long postId, Post newPost) {
        Post existingPost = postRepository.findById(postId).orElse(null);
        if (existingPost != null) {
            existingPost.setContent(newPost.getContent());
            return postRepository.save(existingPost);
        }
        return null; 
    }

    public void deletePost(Long postId) {
        postRepository.deleteById(postId);
    }
}
