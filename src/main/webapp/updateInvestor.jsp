<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>Update Investor</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/styles.css'/>"> <!-- Link to your CSS -->
</head>
<body>

<h2>Update Investor Details</h2>

<c:if test="${not empty message}">
    <div class="alert">
        ${message}
    </div>
</c:if>

<form action="<c:url value='/saveUpdatedInvestor' />" method="post">
    <input type="hidden" name="id" value="${investor.id}">

    <label for="name">Name:</label>
    <input type="text" id="name" name="name" value="${investor.name}" required><br><br>

    <label for="aadharId">Aadhar ID:</label>
    <input type="text" id="aadharId" name="aadharId" value="${investor.aadhar.id}" required><br><br>

    <label for="address">Address:</label>
    <input type="text" id="address" name="address" value="${investor.address}" required><br><br>

    <label for="email">Email:</label>
    <input type="email" id="email" name="email" value="${investor.email}" required><br><br>

    <label for="contactNo">Contact Number:</label>
    <input type="text" id="contactNo" name="contactNo" value="${investor.contactNo}" required><br><br>

    <label for="dob">Date of Birth:</label>
    <input type="date" id="dob" name="dob" value="${fn:substring(investor.dob, 0, 10)}" required><br><br>

    <label for="riskProfile">Risk Profile:</label>
    <input type="text" id="riskProfile" name="riskProfile" value="${investor.riskProfile}" required><br><br>

    <label for="preferredInvestmentType">Preferred Investment Type:</label>
    <input type="text" id="preferredInvestmentType" name="preferredInvestmentType" value="${investor.preferredInvestmentType}" required><br><br>

    <label for="annualIncome">Annual Income:</label>
    <input type="number" step="0.01" id="annualIncome" name="annualIncome" value="${investor.annualIncome}" required><br><br>

    <label for="kycStatus">KYC Status:</label>
    <input type="text" id="kycStatus" name="kycStatus" value="${investor.kycStatus}" required><br><br>

   
    <input type="submit" value="Update Investor">
</form>

<a href="<c:url value='/viewAllInvestors' />">Back to Investor List</a> <!-- Link to navigate back -->

</body>
</html>
