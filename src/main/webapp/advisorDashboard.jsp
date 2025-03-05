<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Financial Advisor Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 20px;
            background-color: #f4f7fa;
        }
        h3, h4 {
            color: #333;
            margin-bottom: 20px;
        }
        .profile-section, .investors-section {
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .btn {
            display: inline-block;
            text-decoration: none;
            color: white;
            padding: 10px 15px;
            border-radius: 4px;
            transition: background-color 0.3s ease-in-out;
            background-color: #007bff;
            margin: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        #communityButton {
            position: fixed;
            bottom: 20px;
            right: 20px;
            padding: 12px 20px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 50px;
            cursor: pointer;
            font-size: 16px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }
        #communityButton:hover {
            background-color: #218838;
        }
        .content {
            max-width: 1200px;
            margin: auto;
            padding: 20px;
        }
    </style>
    <script>
        function community() {
            window.location.href = 'community';
        }
    </script>
</head>
<body>
    <div class="content">
        <h3>Welcome, ${advisor.name}!</h3>
        <button id="communityButton" onclick="community()">Connect with Like Minded People</button>

        <!-- Profile Section -->
        <div class="profile-section">
            <h4>Your Profile:</h4>
            <p><strong>Name:</strong> ${advisor.name}</p>
            <p><strong>Email:</strong> ${advisor.email}</p>
            <p><strong>Contact Number:</strong> ${advisor.contactNo}</p>
            <p><strong>Specialization:</strong> ${advisor.specialization}</p>
            <p><strong>Experience Years:</strong> ${advisor.experienceYears}</p>
            <p><strong>Rating:</strong> ${advisor.rating}</p>
        </div>

        <!-- Investors Section -->
        <div class="investors-section">
            <h4>Your Mapped Investors:</h4>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Contact No</th>
                        <th>Investment Type</th>
                        <th>Annual Income</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="investor" items="${mappedInvestors}">
                        <tr>
                            <td>${investor.id}</td>
                            <td>${investor.name}</td>
                            <td>${investor.email}</td>
                            <td>${investor.contactNo}</td>
                            <td>${investor.preferredInvestmentType}</td>
                            <td>${investor.annualIncome}</td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty mappedInvestors}">
                        <tr>
                            <td colspan="6" style="text-align:center;">No investors are currently mapped to you.</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>

        <div>
            <a href="${pageContext.request.contextPath}/tutorials/form" class="btn">Add New Tutorial</a>
            <a href="${pageContext.request.contextPath}/tutorials/all" class="btn">View Tutorials</a>
            <a href="/selectrole" class="btn">Logout</a>
        </div>
    </div>
</body>
</html>
