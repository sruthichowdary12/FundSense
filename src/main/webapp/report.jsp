<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mutual Fund Report</title>
    <style>
        .container {
            width: 80%;
            margin: 20px auto;
            text-align: center;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            margin: 10px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        .chart-container {
            margin: 20px auto;
            max-width: 800px;
            border: 1px solid #ddd;
            padding: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Mutual Fund Report</h1>
        
        <div class="chart-container">
            <img src="/download-report" alt="Mutual Fund Chart" style="width: 100%; height: auto;"/>
        </div>
        
        <div class="actions">
            <a href="/download-report" class="btn" download="mutual_fund_report.png">Download PNG Report</a>
            <a href="/download-pdf" class="btn" download="mutual_fund_report.pdf">Download PDF Report</a>
        </div>
    </div>
</body>
</html>