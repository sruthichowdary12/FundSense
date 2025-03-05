package com.klef.jfsd.springboot.service;

import com.klef.jfsd.springboot.model.Post;
import com.klef.jfsd.springboot.repository.PostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class PostServiceImpl implements PostService {

    @Autowired
    private PostRepository postRepository;

    @Override
    public List<Post> getAllPosts() {
        return postRepository.findAllByOrderByCreatedAtDesc();
    }

    @Override
    public Post createPost(Post post) {
        post.setCreatedAt(new Date());
        return postRepository.save(post);
    }

    @Override
    public Optional<Post> getPostById(Long id) {
        return postRepository.findById(id);
    }

    @Override
public void updatePost(Long id, String content) {
    Post post = postRepository.findById(id)
            .orElseThrow(() -> new RuntimeException("Post not found"));
    post.setContent(content);
    postRepository.save(post);
}
    @Override
    public void deletePostById(Long id) {
        postRepository.deleteById(id);
    }

	@Override
	  public Optional<Post> findPostById(Long id) {
        return postRepository.findById(id); // Return post or null if not found
    }

	
}
