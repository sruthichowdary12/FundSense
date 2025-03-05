<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Analyst Details</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/styles.css">
</head>
<body>
    <div class="container">
        <h1>Analyst Details</h1>

        <c:if test="${not empty analyst}">
            <p>Email: ${analyst.email}</p>
            <p>Password: ${analyst.password}</p>
            <!-- Add other fields as necessary -->
        </c:if>

        <c:if test="${not empty message}">
            <p>${message}</p>
        </c:if>

        <a href="${pageContext.request.contextPath}/viewAllAnalysts">Back to Analyst List</a>
    </div>
</body>
</html>
