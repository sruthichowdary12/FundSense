// CommentRepository.java
package com.klef.jfsd.springboot.repository;

import com.klef.jfsd.springboot.model.Comment;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface CommentRepository extends JpaRepository<Comment, Long> {

	List<Comment> findByPostId(Long postId);
}