<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Tutorial</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7fa;
            padding: 20px;
        }
        .form-container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 8px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="text"], textarea, select, input[type="file"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .error {
            color: red;
        }
        .submit-btn {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            cursor: pointer;
            font-size: 16px;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }
        .submit-btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Add New Tutorial</h2>
        
        <form:form action="/tutorials/add" method="post" modelAttribute="tutorial" enctype="multipart/form-data">
            <div class="form-group">
                <label for="category">Category:</label>
                <form:select path="category" required="true">
                    <form:option value="" label="Select a Category" />
                    <form:option value="Technology">Technology</form:option>
                    <form:option value="Finance">Finance</form:option>
                    <form:option value="Health">Health</form:option>
                    <form:option value="Education">Education</form:option>
                    <form:option value="Art">Art</form:option>
                </form:select>
            </div>
            
            <div class="form-group">
                <label for="name">Tutorial Name:</label>
                <form:input path="name" required="true"/>
            </div>
            
            <div class="form-group">
                <label for="description">Description:</label>
                <form:textarea path="description" rows="4" required="true"/>
            </div>
            
            <div class="form-group">
                <label for="videoFile">Video File:</label>
                <input type="file" name="videoFile" accept="video/*" required>
            </div>
            
            <div class="form-group">
                <label for="difficultyLevel">Difficulty Level:</label>
                <form:select path="difficultyLevel" required="true">
                    <form:option value="Beginner">Beginner</form:option>
                    <form:option value="Intermediate">Intermediate</form:option>
                    <form:option value="Advanced">Advanced</form:option>
                    <form:option value="Tips">Tips</form:option>
                </form:select>
            </div>
            
            <input type="submit" value="Upload Tutorial" class="submit-btn">
        </form:form>
    </div>
</body>
</html>
