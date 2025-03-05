<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Fundsense</title>
</head>
<body style="font-family: Arial, sans-serif; margin: 0; padding: 0; background-color: #F9F9FF; color: #333;">
    <!-- Header -->
    <div style="background-color: #6D5DE7; padding: 15px 20px; display: flex; align-items: center; justify-content: space-between; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
        <img src="/images/logo-white.png" alt="Fundsense Logo" style="max-height: 200px; width: 200px; margin-top: -80px; margin-bottom: -50px;"> <!-- Adjust path -->
        <h1 style="color: white; margin: 0; font-size: 24px; animation: fadeIn 1.5s;">Add Financial Advisor</h1>
    </div>

    <!-- Main Content -->
    <div style="max-width: 800px; margin: 30px auto; background-color: white; padding: 25px 35px; border-radius: 15px; box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2); animation: slideIn 1.2s ease-out;">
        <h2 style="color: #6D5DE7; text-align: center; margin-bottom: 30px; animation: glowText 1.5s infinite alternate;">Admin Dashboard</h2>

        <!-- Add Financial Advisor Form -->
        <h3 style="color: #6559C1;">Add Financial Advisor</h3>
        <form action="saveFinancialAdvisor" method="POST" style="display: flex; flex-direction: column; gap: 15px;">
            <label for="name" style="color: #333;">Name:</label>
            <input type="text" name="name" required style="padding: 12px; border: 2px solid #6559C1; border-radius: 8px; transition: border-color 0.3s; box-shadow: inset 0 2px 5px rgba(0, 0, 0, 0.1);"
                   onfocus="this.style.borderColor='#6D5DE7';" onblur="this.style.borderColor='#6559C1';">

            <label for="email" style="color: #333;">Email:</label>
            <input type="email" name="email" required style="padding: 12px; border: 2px solid #6559C1; border-radius: 8px; transition: border-color 0.3s; box-shadow: inset 0 2px 5px rgba(0, 0, 0, 0.1);"
                   onfocus="this.style.borderColor='#6D5DE7';" onblur="this.style.borderColor='#6559C1';">

            <label for="password" style="color: #333;">Password:</label>
            <input type="password" name="password" required style="padding: 12px; border: 2px solid #6559C1; border-radius: 8px; transition: border-color 0.3s; box-shadow: inset 0 2px 5px rgba(0, 0, 0, 0.1);"
                   onfocus="this.style.borderColor='#6D5DE7';" onblur="this.style.borderColor='#6559C1';">

            <label for="contactNo" style="color: #333;">Contact Number:</label>
            <input type="text" name="contactNo" required style="padding: 12px; border: 2px solid #6559C1; border-radius: 8px; transition: border-color 0.3s; box-shadow: inset 0 2px 5px rgba(0, 0, 0, 0.1);"
                   onfocus="this.style.borderColor='#6D5DE7';" onblur="this.style.borderColor='#6559C1';">

            <label for="experienceYears" style="color: #333;">Experience Years:</label>
            <input type="number" name="experienceYears" required style="padding: 12px; border: 2px solid #6559C1; border-radius: 8px; transition: border-color 0.3s; box-shadow: inset 0 2px 5px rgba(0, 0, 0, 0.1);"
                   onfocus="this.style.borderColor='#6D5DE7';" onblur="this.style.borderColor='#6559C1';">

            <label for="specialization" style="color: #333;">Specialization:</label>
            <input type="text" name="specialization" required style="padding: 12px; border: 2px solid #6559C1; border-radius: 8px; transition: border-color 0.3s; box-shadow: inset 0 2px 5px rgba(0, 0, 0, 0.1);"
                   onfocus="this.style.borderColor='#6D5DE7';" onblur="this.style.borderColor='#6559C1';">

            <label for="rating" style="color: #333;">Rating:</label>
            <input type="number" name="rating" step="0.1" min="0" max="5" required style="padding: 12px; border: 2px solid #6559C1; border-radius: 8px; transition: border-color 0.3s; box-shadow: inset 0 2px 5px rgba(0, 0, 0, 0.1);"
                   onfocus="this.style.borderColor='#6D5DE7';" onblur="this.style.borderColor='#6559C1';">

            <input type="submit" value="Add Financial Advisor" style="background-color: #6D5DE7; color: white; padding: 12px; border: none; border-radius: 8px; cursor: pointer; font-size: 16px; transition: transform 0.3s;"
                   onmouseover="this.style.transform='scale(1.05)';" onmouseout="this.style.transform='scale(1)';">
        </form>

        <!-- Upload CSV -->
        <h3 style="color: #6559C1; margin-top: 30px;">Upload Financial Advisors via CSV</h3>
        <form action="/uploadFinancialAdvisorscsv" method="post" enctype="multipart/form-data" style="display: flex; flex-direction: column; gap: 15px;">
            <label for="file" style="color: #333;">Upload CSV file:</label>
            <input type="file" name="file" id="file" required style="padding: 12px; border: 2px solid #6559C1; border-radius: 8px;">
            <button type="submit" style="background-color: #6559C1; color: white; padding: 12px; border: none; border-radius: 8px; cursor: pointer; font-size: 16px; transition: transform 0.3s;"
                    onmouseover="this.style.transform='scale(1.05)';" onmouseout="this.style.transform='scale(1)';">Upload</button>
        </form>

        <!-- Message -->
        <c:if test="${not empty message}">
            <p style="color: green; margin-top: 20px; animation: fadeIn 2s;">${message}</p>
        </c:if>

        <!-- Logout -->
        <a href="admindashboard" style="display: inline-block; margin-top: 20px; color: #6D5DE7; text-decoration: none; font-weight: bold; animation: fadeIn 2s;">Back</a>
    </div>

    <!-- Animations -->
    <style>
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        @keyframes slideIn {
            from { transform: translateY(-50px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
        @keyframes glowText {
            from { color: #6559C1; }
            to { color: #6D5DE7; text-shadow: 0 0 10px #6D5DE7; }
        }
    </style>
</body>
</html>
