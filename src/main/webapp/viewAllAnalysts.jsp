<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Analysts List</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css">
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
            margin: 20px 0;
            color: #4B0082;
            font-size: 2em;
        }

        p {
            text-align: center;
            background-color: #e0ffe0;
            padding: 10px;
            border: 1px solid #b2d8b2;
            border-radius: 5px;
            width: 50%;
            margin: 20px auto;
        }

        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #6A5ACD;
            color: white;
            font-size: 1.1em;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f5ff;
        }

        a {
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
            transition: color 0.3s;
        }

        a:hover {
            color: #0056b3;
        }

        .actions a {
            margin: 0 5px;
            padding: 8px 12px;
            border-radius: 5px;
            background-color: #007bff;
            color: white;
            transition: background-color 0.3s;
        }

        .actions a:hover {
            background-color: #0056b3;
        }

        .actions a.update {
            background-color: #28a745;
        }

        .actions a.update:hover {
            background-color: #218838;
        }

        .actions a.delete {
            background-color: #dc3545;
        }

        .actions a.delete:hover {
            background-color: #c82333;
        }

        .dashboard-link {
            display: block;
            width: 200px;
            margin: 30px auto;
            text-align: center;
            padding: 10px 15px;
            background-color: #6c757d;
            color: white;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .dashboard-link:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>

    <h1>Analysts List</h1>
    
    <c:if test="${not empty message}">
        <p>${message}</p>
    </c:if>

    <table>
        <tr>
            <th>Email</th>
            <th>Password</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="analyst" items="${analysts}">
            <tr>
                <td>${analyst.email}</td>
                <td>${analyst.password}</td>
                <td class="actions">
                    <a href="${pageContext.request.contextPath}/viewAnalystByID/${analyst.email}">View</a>
                    <a href="${pageContext.request.contextPath}/updateAnalyst/${analyst.email}" class="update">Update</a>
                    <a href="${pageContext.request.contextPath}/deleteAnalyst/${analyst.email}" class="delete">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>

    <a href="${pageContext.request.contextPath}/admindashboard" class="dashboard-link">Back to Dashboard</a>

</body>
</html>
