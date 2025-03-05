<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Post</title>
    <style>
        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 5px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        textarea {
            width: 100%;
            min-height: 150px;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            resize: vertical;
        }
        .btn {
            padding: 10px 20px;
            margin-right: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn-primary {
            background-color: #007bff;
            color: white;
        }
        .btn-secondary {
            background-color: #6c757d;
            color: white;
            text-decoration: none;
            display: inline-block;
        }
        .btn:hover {
            opacity: 0.9;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Edit Post</h2>
        <form action="${pageContext.request.contextPath}/community/updatePost?id=${param.id}" method="post">
            <div class="form-group">            <input type="hidden" name="id" value="${post.id}">
            
            <div class="form-group">
                <label for="content">Content:</label>
                <textarea id="content" name="content" required>${post.content}</textarea>
            </div>
            
            <button type="submit" class="btn btn-primary">Update Post</button>
            <a href="${pageContext.request.contextPath}/community" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
</body>
</html>