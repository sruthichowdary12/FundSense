<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Financial Advisor Quiz</title>
    <link rel="stylesheet" href="<your_css_file_path>"> <!-- Link to your CSS file -->
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            padding: 20px;
            border: 1px solid #ccc;
        }
        h1 {
            text-align: center;
        }
        .question {
            margin: 20px 0;
        }
        .question label {
            display: block;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <h1>Financial Advisor Quiz</h1>
    <form action="/submitQuiz" method="post"> <!-- Action to submit quiz results -->
        <div class="question">
            <label>1. What is the primary goal of financial planning?</label>
            <input type="radio" name="q1" value="C"> C) To achieve a client’s long-term financial goals<br>
            <input type="radio" name="q1" value="A"> A) To maximize short-term gains<br>
            <input type="radio" name="q1" value="B"> B) To minimize tax liabilities<br>
            <input type="radio" name="q1" value="D"> D) To eliminate all types of debt<br>
        </div>

        <div class="question">
            <label>2. Which of the following best describes a diversified portfolio?</label>
            <input type="radio" name="q2" value="B"> B) A balanced mix of various asset classes to reduce risk<br>
            <input type="radio" name="q2" value="A"> A) Investment in a single asset class<br>
            <input type="radio" name="q2" value="C"> C) Investment only in high-risk stocks<br>
            <input type="radio" name="q2" value="D"> D) Holding only government bonds<br>
        </div>

        <div class="question">
            <label>3. What is the purpose of a risk tolerance questionnaire in financial advising?</label>
            <input type="radio" name="q3" value="B"> B) To gauge the client’s comfort level with investment risks<br>
            <input type="radio" name="q3" value="A"> A) To determine the advisor’s willingness to invest<br>
            <input type="radio" name="q3" value="C"> C) To decide on market timing strategies<br>
            <input type="radio" name="q3" value="D"> D) To assess tax planning needs<br>
        </div>

        <div class="question">
            <label>4. What is considered a "safe" asset in a typical investment portfolio?</label>
            <input type="radio" name="q4" value="C"> C) Government bonds<br>
            <input type="radio" name="q4" value="A"> A) High-yield bonds<br>
            <input type="radio" name="q4" value="B"> B) Cryptocurrency<br>
            <input type="radio" name="q4" value="D"> D) Penny stocks<br>
        </div>

        <div class="question">
            <label>5. Which financial instrument is commonly used to hedge against inflation?</label>
            <input type="radio" name="q5" value="D"> D) Treasury Inflation-Protected Securities (TIPS)<br>
            <input type="radio" name="q5" value="A"> A) Stocks<br>
            <input type="radio" name="q5" value="B"> B) Real estate investment trusts (REITs)<br>
            <input type="radio" name="q5" value="C"> C) Cash<br>
        </div>

        <div class="question">
            <button type="submit">Submit Quiz</button>
        </div>
    </form>
</body>
</html>
