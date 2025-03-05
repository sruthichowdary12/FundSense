<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tutorials List</title>
    <style>
        .container {
            max-width: 1000px;
            margin: 0 auto;
            padding: 20px;
        }
        .tutorial-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }
        .tutorial-card {
            border: 1px solid #ddd;
            padding: 15px;
            border-radius: 5px;
        }
        .actions {
            margin-top: 10px;
        }
        .btn {
            padding: 5px 10px;
            text-decoration: none;
            color: white;
            border-radius: 3px;
            margin-right: 5px;
        }
        .view-btn { background-color: #4CAF50; }
        .delete-btn { background-color: #f44336; }
        .add-btn {
            background-color: #2196F3;
            padding: 10px 20px;
            display: inline-block;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Tutorials List</h2>
        
        
        <div class="tutorial-grid">
            <c:forEach items="${tutorials}" var="tutorial">
                <div class="tutorial-card">
                    <h3>${tutorial.name}</h3>
                    <p><strong>Category:</strong> ${tutorial.category}</p>
                    <p><strong>Difficulty:</strong> ${tutorial.difficultyLevel}</p>
                    <p>${tutorial.description}</p>
                    <div class="actions">
                        <a href="/tutorials/${tutorial.id}" class="btn view-btn">View</a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>
