package com.klef.jfsd.springboot.service;

import com.klef.jfsd.springboot.model.Post;

import java.util.List;
import java.util.Optional;

public interface PostService {

    List<Post> getAllPosts();

    Post createPost(Post post);

    Optional<Post> getPostById(Long id);

    void updatePost(Long id, String content);

    void deletePostById(Long id);
    Optional<Post> findPostById(Long id);

	//void updatePost(Post post); 
}
