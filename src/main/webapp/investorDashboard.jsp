<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Investor Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f2f5;
            color: #333;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 30px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        h1, h2, h3 {
            color: #007bff;
            margin-bottom: 20px;
        }
        .logout-button {
            margin-top: 20px;
            background-color: #f44336;
            color: white;
            border: none;
            padding: 12px 25px;
            cursor: pointer;
            border-radius: 5px;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }
        .logout-button:hover {
            background-color: #d32f2f;
        }
        .advisor-info, .advisor-message {
            margin-top: 20px;
            padding: 20px;
            background-color: #e9ecef;
            border-radius: 5px;
            border-left: 4px solid #007bff;
        }
        a {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
        }
        a:hover {
            text-decoration: underline;
            color: #0056b3;
        }
        /* Styling for the assistant and community buttons */
        .fixed-button {
            position: fixed;
            right: 20px;
            padding: 12px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 50px;
            cursor: pointer;
            font-size: 16px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: background-color 0.3s ease;
        }
        #assistantButton {
            bottom: 80px;
        }
        #communityButton {
            bottom: 20px;
        }
        .fixed-button:hover {
            background-color: #0056b3;
        }
    </style>
    <script>
        function startAssistantStream() {
            window.location.href = 'Stream.jsp';
        }
        function community() {
            window.location.href = 'community';
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>Welcome, ${investor.name}!</h1>
        <form action="/logout" method="get">
            <button type="submit" class="logout-button">Logout</button>
        </form>

        <c:choose>
            <c:when test="${not empty advisor}">
                <div class="advisor-info">
                    <h2>Your Financial Advisor</h2>
                    <p><strong>Name:</strong> ${advisor.name}</p>
                    <p><strong>Email:</strong> ${advisor.email}</p>
                    <p><strong>Contact:</strong> ${advisor.contactNo}</p>
                </div>
            </c:when>
            <c:otherwise>
                <div class="advisor-message">
                    <p>${advisorMessage}</p>
                </div>
            </c:otherwise>
        </c:choose>

        <h3>I am in the investor dashboard</h3>
        <p><a href="/tutorials/all">View Tutorials</a></p>
        <p><a href="/viewmf">View Mutual Funds</a></p>

    </div>

    <!-- Assistant and Community buttons -->
    <button id="assistantButton" class="fixed-button" onclick="startAssistantStream()">Talk with Our Assistant</button>
    <button id="communityButton" class="fixed-button" onclick="community()">Connect with Like Minded People</button>
</body>
</html>
