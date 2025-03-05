<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>View All Financial Advisors</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f6f9;
            color: #333;
            margin: 20px;
        }
        
        .header-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: linear-gradient(90deg, #4B0082, #6A5ACD);
            padding: 20px;
            border-radius: 10px;
            color: white;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .logo {
            display: flex;
            align-items: center;
            font-size: 24px;
            font-weight: bold;
        }

        .logo img {
            width: 150px;
            height: 150px;
            margin-right: 10px;
            margin-bottom:-40px;
            margin-top: -40px;
            transition: transform 0.3s;
        }

        .logo img:hover {
            transform: rotate(360deg);
        }

        h1 {
            font-size: 28px;
        }

        .search-section {
            background-color: #ffffff;
            padding: 15px;
            border-radius: 10px;
            margin: 20px 0;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .search-box {
            padding: 10px;
            width: 300px;
            border: 2px solid #6A5ACD;
            border-radius: 5px;
            transition: border-color 0.3s;
        }

        .search-box:focus {
            border-color: #4B0082;
            outline: none;
        }

        .search-btn {
            padding: 10px 20px;
            background-color: #4B0082;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s;
        }

        .search-btn:hover {
            background-color: #6A5ACD;
            transform: scale(1.05);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #4B0082;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f0f0f8;
            transition: background-color 0.3s;
        }

        .btn {
            text-decoration: none;
            color: white;
            padding: 8px 15px;
            border-radius: 5px;
            font-size: 14px;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }

        .view-btn { background-color: #4B0082; }
        .update-btn { background-color: #28a745; }
        .delete-btn { background-color: #dc3545; }
        .investors-btn { background-color: #17a2b8; }

        .back-button {
            background-color: #6c757d;
        }

        .sort-section {
            display: inline-block;
        }

        .sort-select {
            padding: 10px;
            border-radius: 5px;
            border: 2px solid #6A5ACD;
            transition: border-color 0.3s;
        }

        .sort-select:focus {
            border-color: #4B0082;
            outline: none;
        }

        /* Animation for No Data Message */
        .no-data {
            text-align: center;
            font-size: 18px;
            color: #6c757d;
            animation: fadeIn 1.5s ease-in-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
    </style>
</head>
<body>

<div class="header-section">
    <div class="logo">
        <img src="/images/logo-white.png" alt="Company Logo">
    </div>
    <a href="/admindashboard" class="btn back-button">Back to Dashboard</a>
</div>

<div class="search-section">
    <form action="/searchAdvisors" method="get">
        <input type="text" name="searchName" class="search-box" 
               placeholder="Search by advisor name..." value="${param.searchName}">
        <button type="submit" class="search-btn">Search</button>
    </form>
    <div class="sort-section">
        <form action="/sortAdvisors" method="get">
            <select name="order" class="sort-select" onchange="this.form.submit()">
                <option value="asc" ${param.order == 'asc' ? 'selected' : ''}>ID ↑</option>
                <option value="desc" ${param.order == 'desc' ? 'selected' : ''}>ID ↓</option>
            </select>
        </form>
    </div>
</div>

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
                    <a href="/viewFinancialAdvisor/${advisor.id}" class="btn view-btn">View</a>
                    <a href="/updateFinancialAdvisor/${advisor.id}" class="btn update-btn">Update</a>
                    <a href="/deleteFinancialAdvisor/${advisor.id}" class="btn delete-btn" 
                       onclick="return confirm('Are you sure you want to delete this advisor?');">Delete</a>
                    <a href="/viewInvestors/${advisor.id}" class="btn investors-btn">View Investors</a>
                </td>
            </tr>
        </c:forEach>
        <c:if test="${empty advisors}">
            <tr>
                <td colspan="8" class="no-data">No financial advisors found.</td>
            </tr>
        </c:if>
    </tbody>
</table>

</body>
</html>
