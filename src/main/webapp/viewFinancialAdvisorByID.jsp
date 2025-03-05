<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>View Financial Advisor</title>
    <link rel="stylesheet" href="styles.css"> <!-- Add your CSS file for styling -->
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        h1 {
            color: #333;
        }
        .advisor-details {
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 5px;
            max-width: 600px;
            margin: auto;
        }
        .back-link {
            margin-top: 20px;
            display: inline-block;
            text-decoration: none;
            background-color: #007bff; /* Blue */
            color: white;
            padding: 8px 12px;
            border-radius: 4px;
        }
    </style>
</head>
<body>

<h1>Financial Advisor Details</h1>

<div class="advisor-details">
    <c:if test="${advisor != null}">
        <p><strong>ID:</strong> ${advisor.id}</p>
        <p><strong>Name:</strong> ${advisor.name}</p>
        <p><strong>Email:</strong> ${advisor.email}</p>
        <p><strong>Contact No:</strong> ${advisor.contactNo}</p>
        <p><strong>Experience Years:</strong> ${advisor.experienceYears}</p>
        <p><strong>Specialization:</strong> ${advisor.specialization}</p>
        <p><strong>Rating:</strong> ${advisor.rating}</p>
    </c:if>
    <c:if test="${advisor == null}">
        <p>No financial advisor found with the given ID.</p>
    </c:if>
</div>

<a href="/admindashboard" class="back-link">Back to Dashboard</a>

</body>
</html>
