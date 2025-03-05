<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link rel="stylesheet" href="styles.css"> <!-- Add your CSS file for styling -->
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        h3 {
            color: #333;
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
        .btn {
            text-decoration: none;
            color: white;
            padding: 8px 12px;
            border-radius: 4px;
            transition: background-color 0.3s;
            background-color: #007bff; /* Blue */
        }
    </style>
</head>
<body>
<h3>In Financial Dashboard</h3>

<h4>Your Mapped Investors:</h4>

<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Aadhaar ID</th>
            <th>Email</th>
            <th>Contact No</th>
            <th>Date of Birth</th>
            <th>Investment Type</th>
            <th>Annual Income</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="investor" items="${investors}">
            <tr>
                <td>${investor.id}</td>
                <td>${investor.name}</td>
                <td>${investor.aadhar.id}</td> <!-- Assuming Aadhar is an object with a field aadharId -->
                <td>${investor.email}</td>
                <td>${investor.contactNo}</td>
                <td>${investor.dob}</td>
                <td>${investor.preferredInvestmentType}</td>
                <td>${investor.annualIncome}</td>
            </tr>
        </c:forEach>
        <c:if test="${empty investors}">
            <tr>
                <td colspan="8">No investors found for you.</td>
            </tr>
        </c:if>
    </tbody>
</table>

<a href="advisorlogout" class="btn">Logout</a> <!-- Link to log out -->

</body>
</html>
