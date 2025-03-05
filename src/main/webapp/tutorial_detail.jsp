<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${tutorial.name}</title>
    <style>
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }
        .video-container {
            margin: 20px 0;
            width: 100%;
        }
        video {
            width: 100%;
            max-width: 800px;
        }
        .tutorial-info {
            margin: 20px 0;
        }
        .back-btn {
            background-color: #2196F3;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            display: inline-block;
            margin-top: 20px;
            border-radius: 3px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>${tutorial.name}</h2>
        
        <div class="tutorial-info">
            <p><strong>Category:</strong> ${tutorial.category}</p>
            <p><strong>Difficulty Level:</strong> ${tutorial.difficultyLevel}</p>
            <p><strong>Description:</strong></p>
            <p>${tutorial.description}</p>
        </div>
        
        <div class="video-container">
            <video controls>
                <source src="/tutorials/video/${tutorial.id}" type="video/mp4">
                Your browser does not support the video tag.
            </video>
        </div>
        
        <a href="/tutorials/all" class="back-btn">Back to Tutorials</a>
    </div>
</body>
</html>
