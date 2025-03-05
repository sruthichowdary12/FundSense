package com.klef.jfsd.springboot.service;

import com.klef.jfsd.springboot.model.Comment;

import java.util.List;
import java.util.Optional;

public interface CommentService {

    List<Comment> getCommentsForPost(Long postId);

    public void createComment(Comment comment) ;

    Optional<Comment> getCommentById(Long id);

    Comment updateComment(Long id, Comment updatedComment);

    void deleteComment(Long id);
}
