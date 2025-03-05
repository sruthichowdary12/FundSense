package com.klef.jfsd.springboot.controller;

import com.klef.jfsd.springboot.model.Comment;
import com.klef.jfsd.springboot.model.Like;
import com.klef.jfsd.springboot.model.Post;
import com.klef.jfsd.springboot.repository.PostRepository;
import com.klef.jfsd.springboot.service.CommentService;
import com.klef.jfsd.springboot.service.LikeService;
import com.klef.jfsd.springboot.service.PostService;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;
import io.swagger.v3.oas.annotations.Operation;

@Controller
@RequestMapping("/community")
public class CommunityController {

    @Autowired
    private PostService postService;

    @Autowired
    private CommentService commentService;

    @Autowired
    private LikeService likeService;
    @Autowired
    private PostRepository postRepository;

    // View community
    
    
  @Operation
    @GetMapping("/createPost")
    public String createPost() {
        return "createPost";
    }

  @Operation
    @GetMapping
    public String viewCommunity(Model model) {
        List<Post> posts = postService.getAllPosts();
        model.addAttribute("posts", posts);
        return "community";
    }

  @Operation
    // Create a new post
    @PostMapping("/post")
    public String createPost(@ModelAttribute Post post) {
        postService.createPost(post);
        
        return "redirect:/community"; // Redirect to community view after creating a post
    }
    @GetMapping("/editPost")
    public String editPost(@RequestParam("id") Long id, Model model) {
        Optional<Post> post = postService.findPostById(id);
        if (post.isPresent()) {
            model.addAttribute("post", post.get());
            return "editPost"; // Forward to editPost.jsp with the post data in the model
        } else {
            return "redirect:/community"; // Redirect if the post is not found
        }
    }

@Operation
  @PostMapping("/updatePost")
public String updatePost(@RequestParam("id") Long id, @RequestParam("content") String content) {
    postService.updatePost(id, content);  // Using the existing updatePost method
    return "redirect:/community";
}

@Operation
    @GetMapping("/deletePost")
    public String deletePost(@RequestParam("id") Long id) {
        postService.deletePostById(id);
        return "redirect:/community"; // Redirect back to community page after deletion
    }

@Operation
    // Create a new comment
    @PostMapping("/addComment")
    public String addComment(@RequestParam("postId") Long postId, 
                             @RequestParam("content") String content) {
        // Create a new Comment object
        Comment newComment = new Comment();
        newComment.setContent(content);
        
        // Fetch the Post from the database using the postId
        Post post = postRepository.findById(postId)
                                   .orElseThrow(() -> new RuntimeException("Post not found"));
        
        // Set the Post object in the Comment
        newComment.setPost(post);
        
        // Save the comment using the service
        commentService.createComment(newComment); 

        return "redirect:/community"; // Redirect back to community page
    }
@Operation
    @GetMapping("/deleteComment")
    public String deleteComment(@RequestParam("id") Long commentId, 
                              @RequestParam("postId") Long postId) {
        try {
            // First verify the comment exists and belongs to the specified post
            Optional<Comment> comment = commentService.getCommentById(commentId);
            if (comment.isPresent() && comment.get().getPost().getId().equals(postId)) {
                commentService.deleteComment(commentId);
                return "redirect:/community";
            }
        } catch (Exception e) {
            // Log the error if needed
            e.printStackTrace();
        }
        return "redirect:/community";
    }
    
@Operation
    // Delete a comment
    @PostMapping("/comment/delete/{id}")
    public String deleteComment(@PathVariable Long id) {
        commentService.deleteComment(id); // Ensure you implement this method in CommentService
        return "redirect:/community"; // Redirect to community view after deleting a comment
    }

@Operation
    // Create a new like
    @PostMapping("/like")
    public String createLike(@ModelAttribute Like like) {
        likeService.createLike(like);
        return "redirect:/community"; // Redirect to community view after liking a post
    }
@Operation
    // Remove a like
    @PostMapping("/like/remove/{id}")
    public String removeLike(@PathVariable Long id) {
        likeService.removeLike(id);
        return "redirect:/community"; // Redirect to community view after removing a like
    }
@Operation
    @PostMapping("/toggleLike")
    public String toggleLike(@RequestParam("postId") Long postId, HttpSession session) {
        // Get the current user from session
        // This is a placeholder - implement based on your authentication system
        Object currentUser = session.getAttribute("user");
        
        if (currentUser != null) {
            Post post = postService.findPostById(postId)
                    .orElseThrow(() -> new RuntimeException("Post not found"));
            
            // Check if user has already liked the post
            boolean hasLiked = likeService.hasUserLikedPost(currentUser, postId);
            
            if (hasLiked) {
                // Unlike the post
                likeService.removeLikeByUserAndPost(currentUser, postId);
            } else {
                // Like the post
                Like like = new Like();
                like.setPost(post);
                likeService.createLike(like);
            }
        }
        
        return "redirect:/community";
    }
    
}
