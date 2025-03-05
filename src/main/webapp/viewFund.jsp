<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Mutual Fund</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Mutual Fund Details</h2>
        
        <div class="card mt-4">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-4">
                        <img src="${pageContext.request.contextPath}/mutualfunds/image/${fund.fundId}" class="img-fluid"/>

                    </div>
                    <div class="col-md-8">
                        <h3>${fund.fundName}</h3>
                        <p><strong>NAV:</strong> ${fund.nav}</p>
                        <p><strong>Annual Return:</strong> ${fund.annualReturn}%</p>
                        <p><strong>Fund Type:</strong> ${fund.fundType}</p>
                        <p><strong>Risk Level:</strong> ${fund.riskLevel}</p>
                        <p><strong>Category:</strong> ${fund.category}</p>
                        <p><strong>Description:</strong> ${fund.description}</p>
                        <p><strong>Cost:</strong> ${fund.cost}</p>
                        <p><strong>More Information:</strong> <a href="${fund.url}" target="_blank">Click here</a></p>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="mt-3">
            <a href="${pageContext.request.contextPath}/mutualfunds" class="btn btn-primary">Back to List</a>
            <a href="${pageContext.request.contextPath}/mutualfunds/edit/${fund.fundId}" class="btn btn-warning">Edit</a>
        </div>
    </div>
</body>
</html>
