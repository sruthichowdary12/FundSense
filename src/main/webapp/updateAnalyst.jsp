<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Analyst</title>
</head>
<body>
    <h1>Update Analyst</h1>
    
    <c:if test="${not empty message}">
        <p>${message}</p>
    </c:if>
    
    <c:if test="${not empty analyst}">
        <form action="${pageContext.request.contextPath}/saveUpdatedAnalyst" method="post">
            <input type="hidden" name="email" value="${analyst.email}" />
            
            <label for="password">Password:</label>
            <input type="text" id="password" name="password" value="${analyst.password}" required /><br />

            <input type="submit" value="Update Analyst" />
        </form>
    </c:if>
    
    <br>
    <a href="${pageContext.request.contextPath}/viewAllAnalysts">Back to Analyst List</a>
</body>
</html>
