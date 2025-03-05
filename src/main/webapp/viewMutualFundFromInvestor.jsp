<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>Mutual Funds List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Mutual Funds List</h2>
        <a href="/investorDashboard" class="btn btn-primary mb-3">Back</a>
        
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Fund Name</th>
                    <th>NAV</th>
                    <th>Annual Return</th>
                    <th>Fund Type</th>
                    <th>Risk Level</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${funds}" var="fund">
                    <tr>
                        <td>${fund.fundName}</td>
                        <td>${fund.nav}</td>
                        <td>${fund.annualReturn}%</td>
                        <td>${fund.fundType}</td>
                        <td>${fund.riskLevel}</td>
                        <td>
                            <a href="/mutualfunds/view/${fund.fundId}" class="btn btn-info btn-sm">View</a>
                           
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
