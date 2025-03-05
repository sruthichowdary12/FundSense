<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            background: #fff;
            width: 400px;
            border-radius: 12px;
            box-shadow: 0px 8px 30px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            text-align: center;
            animation: fadeIn 1s ease-out;
        }

        .header {
            background: linear-gradient(135deg, #2575fc 0%, #6a11cb 100%);
            color: white;
            padding: 40px 20px;
        }

        .header h1 {
            font-size: 28px;
            font-weight: 600;
        }

        .header p {
            font-size: 14px;
            margin-top: 10px;
        }

        .form-container {
            padding: 20px 30px;
        }

        .form-container label {
            font-weight: 600;
            font-size: 14px;
            display: block;
            margin: 15px 0 5px;
            text-align: left;
        }

        .form-container input {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border-radius: 5px;
            border: 1px solid #ddd;
            margin-bottom: 20px;
            transition: all 0.3s ease;
        }

        .form-container input:focus {
            border-color: #6a11cb;
            outline: none;
            box-shadow: 0px 0px 5px rgba(106, 17, 203, 0.5);
        }

        .form-container input[type="submit"] {
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            color: white;
            border: none;
            cursor: pointer;
            font-weight: 600;
            transition: background 0.3s ease;
        }

        .form-container input[type="submit"]:hover {
            background: linear-gradient(135deg, #2575fc 0%, #6a11cb 100%);
        }

        .footer {
            background: #f1f1f1;
            padding: 10px 0;
            font-size: 12px;
            color: #555;
        }

        .footer a {
            color: #2575fc;
            text-decoration: none;
        }

        .footer a:hover {
            text-decoration: underline;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                width: 90%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Welcome Admin</h1>
            <p>Please log in to access the dashboard</p>
        </div>
        <div class="form-container">
            <form action="checkadminlogin" method="post">
                <label for="username">Username:</label>
                <input type="text" id="username" name="auname" placeholder="Enter your username" required>
                <label for="password">Password:</label>
                <input type="password" id="password" name="apwd" placeholder="Enter your password" required>
                <input type="submit" value="Login">
            </form>
        </div>
        <div class="footer">
            <p>Forgot your password? <a href="#">Reset it here</a>.</p>
        </div>
    </div>
</body>
</html>
