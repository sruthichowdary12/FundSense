package com.klef.jfsd.springboot.service;

import com.klef.jfsd.springboot.model.Like;

import java.util.List;

public interface LikeService {
    Like createLike(Like like);
    void removeLike(Long likeId);
    void removeLikeByUserAndPost(Object user, Long postId);
    List<Like> getLikesForPost(Long postId);
    boolean hasUserLikedPost(Object user, Long postId);
}