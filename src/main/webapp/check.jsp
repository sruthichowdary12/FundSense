<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Admin Dashboard</title>
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
        .action-links {
            display: flex;
            gap: 10px; /* Space between buttons */
        }
        .btn {
            text-decoration: none;
            color: white;
            padding: 8px 12px;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        .view-btn { background-color: #007bff; } /* Blue */
        .update-btn { background-color: #28a745; } /* Green */
        .delete-btn { background-color: #dc3545; } /* Red */
        .add-btn { background-color: #007bff; } /* Blue */
        .btn:hover {
            opacity: 0.8; /* Slightly fade on hover */
        }
    </style>
</head>
<body>

<h1>Admin Dashboard</h1>

<h2>Manage Financial Advisors</h2>
<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Contact No</th>
            <th>Experience Years</th>
            <th>Specialization</th>
            <th>Rating</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <!-- Loop through the advisors list and display each advisor -->
        <c:forEach var="advisor" items="${advisors}">
            <tr>
                <td>${advisor.id}</td>
                <td>${advisor.name}</td>
                <td>${advisor.email}</td>
                <td>${advisor.contactNo}</td>
                <td>${advisor.experienceYears}</td>
                <td>${advisor.specialization}</td>
                <td>${advisor.rating}</td>
                <td class="action-links">
                    <!-- View, Update, and Delete buttons for each advisor -->
                    <a href="viewFinancialAdvisor?id=${advisor.id}" class="btn view-btn">View</a>
                    <a href="updateFinancialAdvisor?id=${advisor.id}" class="btn update-btn">Update</a>
                    <a href="deleteFinancialAdvisor?id=${advisor.id}" class="btn delete-btn"
                       onclick="return confirm('Are you sure you want to delete this advisor?');">Delete</a>
                </td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="8" class="action-links">
                <!-- Add Financial Advisor button -->
                <a href="addFinancialAdvisor" class="btn add-btn">Add Financial Advisor</a>
            </td>
        </tr>
    </tbody>
</table>

</body>
</html>
