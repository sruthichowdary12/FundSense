package com.klef.jfsd.springboot.service;

import com.klef.jfsd.springboot.model.Comment;
import com.klef.jfsd.springboot.model.Post;
import com.klef.jfsd.springboot.repository.CommentRepository;
import com.klef.jfsd.springboot.repository.PostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentRepository commentRepository;

    @Autowired
    private PostRepository postRepository;

    @Override
    public List<Comment> getCommentsForPost(Long postId) {
        return commentRepository.findByPostId(postId);
    }

    @Override
    public void createComment(Comment comment) {
        if (comment.getPost() == null) {
            throw new RuntimeException("Post cannot be null"); // Handle this case
        }
        
        // The post must be set before saving
        Post post = comment.getPost();
        if (post == null || post.getId() == null) {
            throw new RuntimeException("Comment must be associated with a valid Post");
        }

        commentRepository.save(comment); // Save the comment
    }

    @Override
    public Optional<Comment> getCommentById(Long id) {
        return commentRepository.findById(id);
    }

    @Override
    @Transactional
    public Comment updateComment(Long id, Comment updatedComment) {
        return commentRepository.findById(id).map(comment -> {
            comment.setContent(updatedComment.getContent());
            // Optionally update timestamp
            comment.setCreatedAt(new Date());
            return commentRepository.save(comment);
        }).orElseThrow(() -> new RuntimeException("Comment not found with ID: " + id));
    }

    @Override
    public void deleteComment(Long id) {
        if (commentRepository.existsById(id)) {
            commentRepository.deleteById(id);
        } else {
            throw new RuntimeException("Comment not found with ID: " + id);
        }
    }
}
