<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Investor</title>
    <style>
        /* General reset and body styling */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7fc;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            height: 100vh;
            padding: 0 20px;
            overflow: hidden; /* Prevents the page from scrolling */
        }

        h2 {
            color: #6D5DE7;
            text-align: center;
            font-size: 2.5em;
            margin-bottom: 30px;
            margin-top: 20px; /* Adds space at the top */
        }

        form {
            background-color: #fff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
            animation: fadeIn 1s ease-in-out;
            overflow-y: auto; /* Allows form scrolling if content overflows */
        }

        /* Form field labels */
        form label {
            font-weight: 600;
            margin: 10px 0 5px;
            display: block;
            font-size: 1.1em;
            color: #6559C1;
        }

        /* Input and select styling */
        form input, form select {
            width: 100%;
            padding: 12px;
            margin: 8px 0 20px 0;
            border-radius: 5px;
            border: 1px solid #ddd;
            font-size: 1em;
            transition: all 0.3s ease-in-out;
            background-color: #f9f9f9;
        }

        form input:focus, form select:focus {
            border-color: #6D5DE7;
            box-shadow: 0 0 5px rgba(109, 93, 231, 0.5);
            background-color: #fff;
        }

        /* Submit button styling */
        form input[type="submit"] {
            background-color: #6D5DE7;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 1.1em;
            padding: 12px;
            border-radius: 5px;
            transition: background-color 0.3s ease-in-out;
        }

        form input[type="submit"]:hover {
            background-color: #6559C1;
        }

        /* Message styles */
        p {
            color: #ff6347;
            text-align: center;
            font-size: 1.1em;
            margin: 20px 0;
        }

        /* Link to login */
        a {
            display: block;
            text-align: center;
            color: #6D5DE7;
            font-weight: 600;
            text-decoration: none;
            margin-top: 20px;
            font-size: 1.1em;
            transition: color 0.3s;
        }

        a:hover {
            color: #6559C1;
        }

        /* Fade in animation for form */
        @keyframes fadeIn {
            0% {
                opacity: 0;
                transform: translateY(20px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Mobile responsiveness */
        @media (max-width: 768px) {
            body {
                padding: 10px;
            }

            h2 {
                font-size: 2em;
            }

            form {
                width: 100%;
                padding: 30px;
            }
        }
    </style>
</head>
<body>
    <h2>Register as an Investor</h2>

    <c:if test="${not empty message}">
        <p>${message}</p>
    </c:if>

    <form action="${pageContext.request.contextPath}/register" method="post">
        <label for="name">Name:</label>
        <input type="text" name="name" required>

        <label for="aadhaarId">Aadhaar ID:</label>
        <input type="text" name="aadhaarId" required>

        <label for="address">Address:</label>
        <input type="text" name="address" required>

        <label for="email">Email:</label>
        <input type="email" name="email" required>

        <label for="password">Password:</label>
        <input type="password" name="password" required>

        <label for="contactNo">Contact No:</label>
        <input type="text" name="contactNo" required>

        <label for="dob">Date of Birth:</label>
        <input type="date" name="dob" required>

        <label for="riskProfile">Risk Profile:</label>
        <select name="riskProfile">
            <option value="Low">Low</option>
            <option value="Medium">Medium</option>
            <option value="High">High</option>
        </select>

        <label for="preferredInvestmentType">Preferred Investment Type:</label>
        <select name="preferredInvestmentType">
            <option value="Equity">Equity</option>
            <option value="Debt">Debt</option>
            <option value="Mutual Fund">Mutual Fund</option>
        </select>

        <label for="annualIncome">Annual Income:</label>
        <input type="number" name="annualIncome">

        <label for="kycStatus">KYC Status:</label>
        <select name="kycStatus">
            <option value="Completed">Completed</option>
            <option value="Pending">Pending</option>
        </select>

        <!-- Financial Advisor Dropdown -->
        <label for="advisor">Select Financial Advisor:</label>
        <select name="advisorId" id="advisor" required>
            <c:forEach items="${advisors}" var="advisor">
                <option value="${advisor.id}">${advisor.name} - ${advisor.specialization}</option>
            </c:forEach>
        </select>

        <input type="submit" value="Register">
    </form>

    <a href="${pageContext.request.contextPath}/investorlogin">Already have an account? Login here</a>
</body>
</html>
