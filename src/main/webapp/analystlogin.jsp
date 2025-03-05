<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Analyst Login</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/style.css' />">
    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Body Styling */
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #6D5DE7, #6559C1);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            overflow: hidden;
            color: #fff;
        }

        .login-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 380px;
            animation: slideInUp 1s ease-out forwards;
        }

        .login-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #6559C1;
            font-size: 1.8rem;
            animation: fadeIn 1s ease-out;
        }

        /* Input Fields */
        label {
            font-size: 1.1rem;
            color: #6559C1;
        }

        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border-radius: 8px;
            border: 1px solid #ddd;
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        input[type="email"]:focus,
        input[type="password"]:focus {
            border-color: #6D5DE7;
            box-shadow: 0 0 5px rgba(109, 93, 231, 0.5);
            background-color: #f9f9f9;
        }

        button[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #6D5DE7;
            color: #fff;
            font-size: 1.2rem;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button[type="submit"]:hover {
            background-color: #6559C1;
        }

        /* Alert Styling */
        .alert {
            padding: 10px;
            background-color: #f44336;
            color: white;
            margin-bottom: 20px;
            border-radius: 5px;
            text-align: center;
        }

        .text-center {
            text-align: center;
            font-size: 1rem;
        }

        .text-center a {
            color: #6559C1;
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s ease;
        }

        .text-center a:hover {
            color: #6D5DE7;
        }

        /* Animation Keyframes */
        @keyframes fadeIn {
            0% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }

        @keyframes slideInUp {
            0% {
                opacity: 0;
                transform: translateY(50px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Mobile Responsiveness */
        @media (max-width: 768px) {
            .login-container {
                padding: 20px;
            }
            .login-container h2 {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Analyst Login</h2>

        <c:if test="${not empty message}">
            <div class="alert">${message}</div>
        </c:if>

        <form action="${pageContext.request.contextPath}/checkanalystlogin" method="post">
            <label for="email">Email:</label><br>
            <input type="email" id="email" name="email" required><br>

            <label for="password">Password:</label><br>
            <input type="password" id="password" name="password" required><br>

            <button type="submit">Login</button>
        </form>

        <div class="text-center">
            <p>Don't have an account? <a href="${pageContext.request.contextPath}/register">Register here</a>.</p>
        </div>
    </div>
</body>
</html>
