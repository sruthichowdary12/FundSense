<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Analyst Dashboard</title>
    <style>
        /* General Styles */
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            display: flex;
            height: 100vh;
        }

        /* Dashboard Container */
        .dashboard-container {
            display: flex;
            width: 100%;
        }

        /* Sidebar */
        .sidebar {
            background-color: #4B0082;
            color: #fff;
            width: 250px;
            padding: 20px;
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .sidebar h3 {
            margin-bottom: 30px;
            font-size: 1.5em;
            border-bottom: 2px solid #6A5ACD;
            padding-bottom: 10px;
        }

        .sidebar ul {
            list-style: none;
            padding: 0;
        }

        .sidebar ul li {
            margin-bottom: 20px;
        }

        .sidebar ul li a {
            color: #fff;
            text-decoration: none;
            font-size: 1.1em;
            display: block;
            transition: background-color 0.3s;
            padding: 10px;
            border-radius: 5px;
        }

        .sidebar ul li a:hover {
            background-color: #6A5ACD;
        }

        /* Logout Button */
        .logout-btn {
            background-color: #FF6347;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 5px;
            font-size: 1em;
            cursor: pointer;
            width: 100%;
            text-align: center;
            transition: background-color 0.3s;
        }

        .logout-btn:hover {
            background-color: #FF4500;
        }

        /* Main Content */
        .main-content {
            padding: 40px;
            width: 100%;
            background-color: #fff;
            box-shadow: -2px 0 10px rgba(0, 0, 0, 0.1);
            overflow-y: auto;
        }

        .main-content h2 {
            color: #4B0082;
            margin-bottom: 20px;
        }

        .fund-details {
            margin-top: 30px;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #f9f9f9;
        }

        .fund-details h3 {
            color: #4B0082;
            margin-bottom: 10px;
        }

        .fund-details p {
            color: #333;
            font-size: 1.1em;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <nav class="sidebar">
            <h3>Analyst Dashboard</h3>
            <ul>
                <li><a href="report">Reports</a></li>
                <li><a href="#">Profile</a></li>
                <li><a href="/selectrole">Logout</a></li>
            </ul>
        </nav>

        <div class="main-content">
            <h2>Welcome to the Analyst Dashboard</h2>
            <p>Successfully logged in as Analyst.</p>

            <!-- Best Mutual Fund Information -->
            <div class="fund-details">
                <h3>Best Mutual Fund: ${bestFundName}</h3>
                <p><strong>Fund Category:</strong> ${bestFundCategory}</p>
                <p><strong>Net Asset Value (NAV):</strong> ${bestFundNav}</p>
                <p><strong>Annual Return:</strong> ${bestFundAnnualReturn}</p>
                <p><strong>Cost:</strong> ${bestFundCost}</p>
                <p><strong>Description:</strong> ${bestFundDescription}</p>
                <a href="${bestFundUrl}" target="_blank">Visit Fund URL</a>
            </div>
        </div>
    </div>
</body>
</html>
