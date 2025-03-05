<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>View All Investors</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7fc;
            color: #333;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            color: #4B0082;
            margin: 40px 0;
            font-size: 2.5em;
        }

        table {
            width: 95%;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 12px 20px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #6A5ACD;
            color: white;
            font-size: 1.1em;
            letter-spacing: 1px;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f5ff;
        }

        td a {
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
            padding: 5px 10px;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s;
        }

        td a:hover {
            background-color: #0056b3;
            color: white;
        }

        td a.update {
            background-color: #28a745;
            padding: 5px 12px;
        }

        td a.update:hover {
            background-color: #218838;
        }

        td a.delete {
            background-color: #dc3545;
            padding: 5px 12px;
        }

        td a.delete:hover {
            background-color: #c82333;
        }

        td a.view {
            background-color: #ffc107;
            padding: 5px 12px;
        }

        td a.view:hover {
            background-color: #e0a800;
        }

        .no-investors {
            text-align: center;
            font-size: 1.2em;
            color: #ff6347;
            margin: 30px auto;
        }

        .back-link {
            display: inline-block;
            width: 200px;
            margin: 30px auto;
            text-align: center;
            padding: 12px;
            background-color: #6c757d;
            color: white;
            font-size: 1.1em;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .back-link:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>
    <h1>List of Investors</h1>
    
    <c:if test="${not empty investors}">
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Aadhar ID</th>
                <th>Address</th>
                <th>Email</th>
                <th>Contact No</th>
                <th>DOB</th>
                <th>Risk Profile</th>
                <th>Preferred Investment Type</th>
                <th>Annual Income</th>
                <th>KYC Status</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="investor" items="${investors}">
                <tr>
                    <td>${investor.id}</td>
                    <td>${investor.name}</td>
                    <td>${investor.aadhar.id}</td> <!-- Assuming you have a getAadhar() method that returns an object with getAadharId() -->
                    <td>${investor.address}</td>
                    <td>${investor.email}</td>
                    <td>${investor.contactNo}</td>
                    <td>${investor.dob}</td>
                    <td>${investor.riskProfile}</td>
                    <td>${investor.preferredInvestmentType}</td>
                    <td>${investor.annualIncome}</td>
                    <td>${investor.kycStatus}</td>
                    <td>
                        <a href="/viewInvestor/${investor.id}" class="view">View</a> |
                        <a href="/updateInvestor/${investor.id}" class="update">Update</a> |
                        <a href="/deleteInvestor/${investor.id}" class="delete">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>

    <c:if test="${empty investors}">
        <p class="no-investors">No investors found.</p>
    </c:if>

    <a href="/admindashboard" class="back-link">Back</a>

</body>
</html>
