<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Mutual Fund</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h2>Update Mutual Fund</h2>
    <form action="${pageContext.request.contextPath}/updateMutualFund" method="post">
        <input type="hidden" name="fundId" value="${mutualFund.fundId}" />

        <label for="fundName">Fund Name:</label>
        <input type="text" id="fundName" name="fundName" value="${mutualFund.fundName}" required /><br/>

        <label for="fundType">Fund Type:</label>
        <input type="text" id="fundType" name="fundType" value="${mutualFund.fundType}" required /><br/>

        <label for="nav">Net Asset Value:</label>
        <input type="text" id="nav" name="nav" value="${mutualFund.nav}" required /><br/>

        <label for="annualReturn">Annual Return (%):</label>
        <input type="text" id="annualReturn" name="annualReturn" value="${mutualFund.annualReturn}" required /><br/>

        <label for="riskLevel">Risk Level:</label>
        <input type="number" id="riskLevel" name="riskLevel" value="${mutualFund.riskLevel}" required /><br/>

        <button type="submit">Update Fund</button>
    </form>
    <br>
    <a href="${pageContext.request.contextPath}/admin/view-mutual-funds">Back to All Mutual Funds</a>
</body>
</html>
