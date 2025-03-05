<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Analyst</title>
</head>
<body>
    <h1>Delete Analyst</h1>
    
    <c:if test="${not empty message}">
        <p>${message}</p>
    </c:if>
    
    <c:if test="${not empty analyst}">
        <p>Are you sure you want to delete this analyst?</p>
        <p><strong>Email:</strong> ${analyst.email}</p>
        <form action="${pageContext.request.contextPath}/confirmDeleteAnalyst" method="post">
            <input type="hidden" name="email" value="${analyst.email}" />
            <input type="submit" value="Delete Analyst" />
        </form>
    </c:if>
    
    <br>
    <a href="${pageContext.request.contextPath}/viewAllAnalysts">Back to Analyst List</a>
</body>
</html>
