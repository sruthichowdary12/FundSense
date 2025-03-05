<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>View Financial Analysts</title>
    <link rel="stylesheet" href="styles.css"> <!-- Add your CSS file for styling -->
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
        h1, h2 {
            color: #333;
        }
    </style>
</head>
<body>

<h1>View Financial Analysts</h1>
<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Contact No</th>
            <th>Experience Years</th>
            <th>Specialization</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="analyst" items="${analysts}">
            <tr>
                <td>${analyst.id}</td>
                <td>${analyst.name}</td>
                <td>${analyst.email}</td>
                <td>${analyst.contactNo}</td>
                <td>${analyst.experienceYears}</td>
                <td>${analyst.specialization}</td>
                <td>
                    <a href="/viewAnalyst/${analyst.id}" class="btn">View</a>
                    <a href="/updateAnalyst/${analyst.id}" class="btn">Update</a>
                    <a href="/deleteAnalyst/${analyst.id}" class="btn" 
                       onclick="return confirm('Are you sure you want to delete this analyst?');">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

</body>
</html>
