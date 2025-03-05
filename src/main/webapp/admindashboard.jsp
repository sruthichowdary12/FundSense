<%@page import="com.klef.jfsd.springboot.model.Admin"%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
Admin admin = (Admin) session.getAttribute("admin");
if(admin == null)
{
	response.sendRedirect("sessionexpiry.jsp");
	return ;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FundSense</title>
    <link rel="stylesheet" href="path/to/your/css/style.css"> <!-- Add your CSS file -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"> <!-- Bootstrap -->
    <style>
        body {
            display: flex;
            font-family: 'Avageri Double Line', sans-serif;
        }
        .sidebar {
            width: 250px;
            background-color: #4B0082;
            color: white;
            height: 100vh;
            position: fixed;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding-top: 20px;
        }
        .sidebar img {
            width: 80px;
            border-radius: 50%;
        }
        .sidebar h5 {
            margin: 10px 0;
        }
        .sidebar a {
            text-decoration: none;
            color: white;
            margin: 10px 0;
        }
        .sidebar a:hover {
            color: #6A5ACD;
        }
        .main-content {
            margin-left: 250px;
            width: calc(100% - 250px);
            padding: 20px;
        }
        .card {
            margin: 10px 0;
        }
        /* Dropdown Menu Styles */
.profile-dropdown {
    position: absolute;
    top: 100%;
    left: 0;
    background-color: white;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 5px;
    width: 200px;
    display: none; /* Hidden by default */
    padding: 10px;
    z-index: 1000;
}

.profile-dropdown .dropdown-item {
    display: flex;
    align-items: center;
    padding: 10px 5px;
    font-size: 14px;
    color: black;
}

.profile-dropdown .dropdown-item .item-icon {
    font-weight: bold;
    margin-right: 10px;
    color: gray;
}

.profile-dropdown .dropdown-item a {
    text-decoration: none;
    color: black;
}

.profile-dropdown .dropdown-item:hover {
    background-color: #f0f0f0;
    border-radius: 5px;
}


        
    </style>
</head>
<body>
    <div class="sidebar">
    <div class="profile-container" style="position: relative;">
        <div class="profile-header" style="display: flex; align-items: center; cursor: pointer;">
            <img src="/images/admin.jpeg" alt="Admin" style="width: 40px; height: 40px; border-radius: 50%;">
            <span style="margin-left: 10px;">Admin</span>
            <span id="dropdown-toggle" style="margin-left: 5px;">&#x25BC;</span> <!-- Down arrow -->
        </div>
        <div class="profile-dropdown">
            <div class="dropdown-item">
                <span class="item-icon">MP</span>
                <a href="${pageContext.request.contextPath}/adminprofile">My Profile</a>
            </div>
            <div class="dropdown-item">
                <span class="item-icon">L</span>
                <a href="${pageContext.request.contextPath}/logout">Logout</a>
            </div>
        </div>
    </div>


        <nav class="nav flex-column">
            <a href="${pageContext.request.contextPath}/addFinancialAdvisor">Add Financial Advisor</a>
            <a href="${pageContext.request.contextPath}/mutualfunds/create">Add Mutual Funds</a>
            <a href="${pageContext.request.contextPath}/admin/addAnalystForm">Add Analyst</a>
            <a href="${pageContext.request.contextPath}/viewAllFinancialAdvisors">Manage Advisors</a>
            <a href="${pageContext.request.contextPath}/viewAllAnalysts">Manage Analysts</a>
            <a href="${pageContext.request.contextPath}/viewAllInvestors">Manage Investors</a>
            <a href="${pageContext.request.contextPath}/mutualfunds">Manage Mutual Funds</a>
        </nav>
    </div>

    <div class="main-content">
        <header class="d-flex justify-content-between align-items-center mb-4">
            <h1>Admin Dashboard</h1>
            <img src="images/logo-black.png" alt="FundSense Logo" height="150" width="180">
        </header>
        
        <div class="row">
            <div class="col-md-4">
                <div class="card text-center">
                    <div class="card-body">
                        <h5 class="card-title">Financial Advisors</h5>
                        <p class="card-text"><strong>${advisorCount}</strong></p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card text-center">
                    <div class="card-body">
                        <h5 class="card-title">Investors</h5>
                        <p class="card-text"><strong>${investorCount}</strong></p>
                    </div>
                </div>
            </div>
            <div class="row">
            <div class="col-md-4">
                <div class="card text-center">
                    <div class="card-body">
                        <h5 class="card-title">Analysts</h5>
                        <p class="card-text"><strong>${analystCount}</strong></p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card text-center">
                    <div class="card-body">
                        <h5 class="card-title">Mutual Funds</h5>
                        <p class="card-text"><strong>${fundCount}</strong></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
    document.addEventListener("DOMContentLoaded", function () {
        const dropdownToggle = document.getElementById("dropdown-toggle");
        const profileDropdown = document.querySelector(".profile-dropdown");

        dropdownToggle.addEventListener("click", function (event) {
            event.stopPropagation(); // Prevent closing when clicking inside
            const isVisible = profileDropdown.style.display === "block";
            profileDropdown.style.display = isVisible ? "none" : "block";
        });

        // Close dropdown when clicking outside
        document.addEventListener("click", function () {
            profileDropdown.style.display = "none";
        });
    });
</script>
    

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> 
    <!-- Bootstrap JS -->
     <div class="mt-3">
            <a href="/report" class="btn btn-success" style="font-weight: bold;">View Reports</a>
        </div>
</body>
</html>
