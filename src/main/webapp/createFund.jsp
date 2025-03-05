<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
    <title>Create Mutual Fund</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Custom Styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #F9F9FF;
            margin: 0;
            padding: 0;
            color: #333;
        }
        .container {
            max-width: 800px;
            margin: 30px auto;
            background-color: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            animation: slideIn 1.2s ease-out;
        }
        h2 {
            color: #6D5DE7;
            text-align: center;
            margin-bottom: 30px;
            animation: glowText 1.5s infinite alternate;
        }
        .form-label {
            color: #333;
        }
        .form-control {
            padding: 12px;
            border: 2px solid #6559C1;
            border-radius: 8px;
            transition: border-color 0.3s;
            box-shadow: inset 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .form-control:focus {
            border-color: #6D5DE7;
        }
        .btn-primary {
            background-color: #6D5DE7;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            transition: transform 0.3s;
        }
        .btn-primary:hover {
            transform: scale(1.05);
        }
        .btn-secondary {
            background-color: #6559C1;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            transition: transform 0.3s;
        }
        .btn-secondary:hover {
            transform: scale(1.05);
        }
        @keyframes slideIn {
            from {
                transform: translateY(-50px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }
        @keyframes glowText {
            from {
                color: #6559C1;
            }
            to {
                color: #6D5DE7;
                text-shadow: 0 0 10px #6D5DE7;
            }
        }
    </style>
</head>
<body>
<div style="background-color: #6D5DE7; padding: 15px 20px; display: flex; align-items: center; justify-content: space-between; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
        <img src="/images/logo-white.png" alt="Fundsense Logo" style="max-height: 200px; width: 200px; margin-top: -80px; margin-bottom: -50px;"> <!-- Adjust path -->
        <h1 style="color: white; margin: 0; font-size: 24px; animation: fadeIn 1.5s;">Add Mutual Fund</h1>
    </div>
    <div class="container mt-5">
        <h2>Create New Mutual Fund</h2>
        
        <form:form action="/mutualfunds/create" method="post" modelAttribute="mutualFund" 
                   enctype="multipart/form-data" class="mt-4">
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
            
            <button type="submit" class="btn btn-primary">Create Fund</button>
            <a href="/admindashboard" class="btn btn-secondary">Cancel</a>
        </form:form>
    </div>
</body>
</html>
