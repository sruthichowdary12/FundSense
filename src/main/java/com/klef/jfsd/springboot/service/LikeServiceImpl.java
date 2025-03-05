package com.klef.jfsd.springboot.service;

import com.klef.jfsd.springboot.model.Like;
import com.klef.jfsd.springboot.model.Post;
import com.klef.jfsd.springboot.repository.LikeRepository;
import com.klef.jfsd.springboot.repository.PostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class LikeServiceImpl implements LikeService {

    @Autowired
    private LikeRepository likeRepository;

    @Autowired
    private PostRepository postRepository;

    @Override
    public Like createLike(Like like) {
        return likeRepository.save(like);
    }

    @Override
    public void removeLike(Long likeId) {
        likeRepository.deleteById(likeId);
    }

    @Override
    public void removeLikeByUserAndPost(Object user, Long postId) {
        // Implement based on your user system
        // This should find and remove the like based on the user and post
    }

    @Override
    public List<Like> getLikesForPost(Long postId) {
        return likeRepository.findByPostId(postId);
    }

    @Override
    public boolean hasUserLikedPost(Object user, Long postId) {
        // Implement based on your user system
        // This should check if the user has already liked the post
        return false;
    }

  
}
