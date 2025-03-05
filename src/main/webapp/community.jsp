<%@ page import="java.util.List" %>
<%@ page import="com.klef.jfsd.springboot.model.Post" %>
<%@ page import="com.klef.jfsd.springboot.model.Comment" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Community</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 20px;
        }

        #posts {
            max-width: 800px;
            margin: auto;
            background: white;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        h2 {
            color: #333;
            text-align: center;
        }

        .post {
            border-bottom: 1px solid #e0e0e0;
            padding: 15px 0;
        }
        .post-actions {
            display: flex;
            align-items: center;
            gap: 10px;
            margin: 10px 0;
        }

        .like-section {
            display: flex;
            align-items: center;
        }

        .like-form {
            margin: 0;
        }
        .like-btn {
            background: none;
            border: none;
            cursor: pointer;
            padding: 5px 10px;
            display: flex;
            align-items: center;
            gap: 5px;
            transition: transform 0.2s;
        }

        .like-btn:hover {
            transform: scale(1.1);
        }

        .like-btn i {
            color: #dc3545;
        }
        .like-btn.liked i {
            color: #dc3545;
        }

        .like-btn:not(.liked) i {
            color: #6c757d;
        }

        .like-count {
            font-size: 14px;
            color: #6c757d;
        }

        .post:last-child {
            border-bottom: none;
        }

        .post p {
            font-size: 16px;
            color: #555;
        }

        .comments {
            margin-top: 10px;
            padding-left: 20px;
        }

        h4 {
            font-size: 14px;
            color: #555;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        li {
            background-color: #f1f1f1;
            margin: 5px 0;
            padding: 10px;
            border-radius: 5px;
            position: relative;
            overflow: hidden;
        }

        form {
            margin-top: 10px;
        }

        textarea {
            width: 100%;
            height: 60px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            resize: none;
            font-size: 14px;
            color: #333;
        }

        input[type="submit"] {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 5px;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        a {
            text-decoration: none;
            color: #007BFF;
        }

        a:hover {
            text-decoration: underline;
        }

        .create-post-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            font-size: 16px;
        }

        .edit-btn {
            background-color: #28a745;
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
            text-decoration: none;
            margin-left: 10px;
        }

        .edit-btn:hover {
            background-color: #218838;
            text-decoration: none;
        }

        .delete-btn {
            background-color: #dc3545;
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
            text-decoration: none;
            margin-left: 10px;
        }

        .delete-btn:hover {
            background-color: #c82333;
            text-decoration: none;
        }

        /* Styles for comment delete button */
        li .delete-btn {
            font-size: 12px;
            padding: 3px 8px;
            float: right;
        }
    </style>
</head>
<body>
    <div id="posts">
        <h2>Recent Posts</h2>
        <%
            List<Post> posts = (List<Post>) request.getAttribute("posts");
            if (posts != null && !posts.isEmpty()) {
                for (Post post : posts) {
        %>
                    <div class="post">
                        <p><%= post.getContent() %></p>
                        <div>
                            <a href="editPost.jsp?id=<%= post.getId() %>" class="edit-btn">Edit</a>
                            <a href="/community/deletePost?id=<%= post.getId() %>" class="delete-btn" 
                               onclick="return confirm('Are you sure you want to delete this post?');">Delete</a>
                        </div>
                        <div class="comments">
                            <h4>Comments:</h4>
                            <%
                                List<Comment> comments = post.getComments();
                                if (comments != null && !comments.isEmpty()) {
                                    out.println("<ul>");
                                    for (Comment comment : comments) {
                            %>
                                        <li>
                                            <%= comment.getContent() %>
                                            <a href="/community/deleteComment?id=<%= comment.getId() %>&postId=<%= post.getId() %>" 
                                               class="delete-btn" 
                                               onclick="return confirm('Are you sure you want to delete this comment?');">
                                                Delete
                                            </a>
                                        </li>
                            <%
                                    }
                                    out.println("</ul>");
                                } else {
                                    out.println("<p>No comments yet.</p>");
                                }
                            %>

                            <form action="/community/addComment" method="post">
                                <input type="hidden" name="postId" value="<%= post.getId() %>"/>
                                <textarea name="content" placeholder="Add a comment..." required></textarea>
                                <input type="submit" value="Submit Comment"/>
                            </form>
                        </div>
                    </div>
        <%
                }
            } else {
                out.println("<p>No posts available.</p>");
            }
        %>
    </div>
    <a class="create-post-link" href="/community/createPost">Create Post</a>
    <a class="create-post-link" href="/community">View Posts</a>
</body>
</html>