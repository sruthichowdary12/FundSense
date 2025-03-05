<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Analyst</title>
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
            max-width: 600px;
            margin: 50px auto;
            background-color: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            animation: slideIn 1.2s ease-out;
        }
        h1 {
            color: #6D5DE7;
            text-align: center;
            margin-bottom: 30px;
            animation: glowText 1.5s infinite alternate;
        }
        label {
            color: #333;
            font-weight: bold;
        }
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            border: 2px solid #6559C1;
            border-radius: 8px;
            margin-bottom: 15px;
            box-sizing: border-box;
            transition: border-color 0.3s;
        }
        input[type="email"]:focus,
        input[type="password"]:focus {
            border-color: #6D5DE7;
        }
        input[type="submit"] {
            background-color: #6D5DE7;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            transition: transform 0.3s;
            margin-right: 10px;
        }
        input[type="submit"]:hover {
            transform: scale(1.05);
        }
        .back-btn {
            background-color: #6559C1;
        }
        .back-btn:hover {
            transform: scale(1.05);
        }
        p {
            text-align: center;
            color: #FF6347;
            font-size: 18px;
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
        <h1 style="color: white; margin: 0; font-size: 24px; animation: fadeIn 1.5s;">Add Analyst</h1>
    </div>
    <div class="container">
        <h1>Add New Analyst</h1>
        <form action="${pageContext.request.contextPath}/admin/addAnalyst" method="post">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required /><br/><br/>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required /><br/><br/>

            <input type="submit" value="Add Analyst" />
            <a href="/admindashboard" class="btn btn-secondary">Back</a>
        </form>

        <c:if test="${not empty message}">
            <p>${message}</p>
        </c:if>
    </div>
</body>
</html>
