<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Financial Advisor Signup</title>
    <link rel="stylesheet" href="<your_css_file_path>"> <!-- Link to your CSS file -->
</head>
<body>
    <h1>Financial Advisor Signup</h1>
    
    <c:if test="${not empty message}">
        <p>${message}</p>
    </c:if>
    
    <form action="${pageContext.request.contextPath}/saveFinancialAdvisor" method="post">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required /><br />

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required /><br />

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required /><br />

        <label for="contactNo">Contact Number:</label>
        <input type="text" id="contactNo" name="contactNo" required /><br />

        <label for="experienceYears">Experience (Years):</label>
        <input type="number" id="experienceYears" name="experienceYears" required /><br />

        <label for="specialization">Specialization:</label>
        <input type="text" id="specialization" name="specialization" required /><br />

        <label for="rating">Rating (0-5):</label>
        <input type="number" id="rating" name="rating" step="0.1" min="0" max="5" required /><br />

        <input type="submit" value="Sign Up" />
    </form>
</body>
</html>
