<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Mutual Fund</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Edit Mutual Fund</h2>
        
        <form:form action="/mutualfunds/edit/${mutualFund.fundId}" method="post" 
                   modelAttribute="mutualFund" enctype="multipart/form-data" class="mt-4">
            <form:hidden path="fundId"/>
            
            <div class="mb-3">
                <label class="form-label">Fund Name:</label>
                <form:input path="fundName" class="form-control"/>
            </div>
            
            <div class="mb-3">
                <label class="form-label">NAV:</label>
                <form:input path="nav" type="number" step="0.01" class="form-control"/>
            </div>
            
            <div class="mb-3">
                <label class="form-label">Annual Return (%):</label>
                <form:input path="annualReturn" type="number" step="0.01" class="form-control"/>
            </div>
            
            <div class="mb-3">
                <label class="form-label">Fund Type:</label>
                <form:input path="fundType" class="form-control"/>
            </div>
            
            <div class="mb-3">
                <label class="form-label">Risk Level (1-5):</label>
                <form:input path="riskLevel" type="number" min="1" max="5" class="form-control"/>
            </div>
            
            <div class="mb-3">
                <label class="form-label">Category:</label>
                <form:input path="category" class="form-control"/>
            </div>
            
            <div class="mb-3">
                <label class="form-label">Description:</label>
                <form:textarea path="description" class="form-control"/>
            </div>
            
            <div class="mb-3">
                <label class="form-label">Cost:</label>
                <form:input path="cost" type="number" step="0.01" class="form-control"/>
            </div>
            
            <div class="mb-3">
                <label class="form-label">URL:</label>
                <form:input path="url" class="form-control"/>
            </div>
            
            <div class="mb-3">
                <label class="form-label">Fund Image:</label>
                <input type="file" name="imageFile" class="form-control"/>
            </div>
            
            <button type="submit" class="btn btn-primary">Update Fund</button>
            <a href="/mutualfunds/" class="btn btn-secondary">Cancel</a>
        </form:form>
    </div>
</body>
</html>
