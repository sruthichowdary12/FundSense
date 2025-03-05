<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Update Financial Advisor</title>
    <link rel="stylesheet" href="styles.css"> <!-- Add your CSS file for styling -->
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        h1 {
            color: #333;
        }
        .update-form {
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
        .error {
            color: red;
        }
    </style>
</head>
<body>

<h1>Update Financial Advisor</h1>

<div class="update-form">
    <c:if test="${message != null}">
        <p class="error">${message}</p>
    </c:if>
    <c:if test="${advisor != null}">
        <form action="/saveUpdatedFinancialAdvisor" method="post">
            <input type="hidden" name="id" value="${advisor.id}"/>
            <p><strong>Name:</strong> <input type="text" name="name" value="${advisor.name}" required/></p>
            <p><strong>Email:</strong> <input type="email" name="email" value="${advisor.email}" required/></p>
            <p><strong>Contact No:</strong> <input type="text" name="contactNo" value="${advisor.contactNo}" required/></p>
            <p><strong>Experience Years:</strong> <input type="number" name="experienceYears" value="${advisor.experienceYears}" required/></p>
            <p><strong>Specialization:</strong> <input type="text" name="specialization" value="${advisor.specialization}" required/></p>
            <p><strong>Rating:</strong> <input type="number" step="0.1" name="rating" value="${advisor.rating}" required/></p>
            <input type="submit" value="Update Financial Advisor"/>
        </form>
    </c:if>
    <c:if test="${advisor == null}">
        <p>No financial advisor found with the given ID.</p>
    </c:if>
</div>

<a href="/admindashboard" class="back-link">Back to Dashboard</a>

</body>
</html>
