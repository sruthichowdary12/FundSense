<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Investor Details</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/styles.css' />">
</head>
<body>
    <h1>Investor Details</h1>
    
    <c:if test="${not empty investor}">
        <table>
            <tr>
                <th>Investor ID</th>
                <td>${investor.id}</td>
            </tr>
            <tr>
                <th>Name</th>
                <td>${investor.name}</td>
            </tr>
            <tr>
                <th>Aadhar ID</th>
                <td>${investor.aadhar.id}</td> <!-- Ensure this matches your Aadhar model property -->
            </tr>
            <tr>
                <th>Address</th>
                <td>${investor.address}</td>
            </tr>
            <tr>
                <th>Email</th>
                <td>${investor.email}</td>
            </tr>
            <tr>
                <th>Contact Number</th>
                <td>${investor.contactNo}</td>
            </tr>
            <tr>
                <th>Date of Birth</th>
                <td>${investor.dob}</td>
            </tr>
            <tr>
                <th>Risk Profile</th>
                <td>${investor.riskProfile}</td>
            </tr>
            <tr>
                <th>Preferred Investment Type</th>
                <td>${investor.preferredInvestmentType}</td>
            </tr>
            <tr>
                <th>Annual Income</th>
                <td>${investor.annualIncome}</td>
            </tr>
            <tr>
                <th>KYC Status</th>
                <td>${investor.kycStatus}</td>
            </tr>
           
        </table>
    </c:if>

    <c:if test="${empty investor}">
        <p>No investor found with the provided ID.</p>
    </c:if>

    <a href="<c:url value='/viewAllInvestors' />">Back to Investor List</a>
</body>
</html>
