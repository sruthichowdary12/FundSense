<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create Post</title>
</head>
<body>
    <h2>Create a New Post</h2>
    <form action="${pageContext.request.contextPath}/community/post" method="post">
        
        <label for="content">Content:</label>
        <textarea id="content" name="content" required></textarea>
        <br>
        <input type="submit" value="Post">
    </form>
    <a href="${pageContext.request.contextPath}/community">Back to Community</a>
</body>
</html>
