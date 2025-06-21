<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Logged Out</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #fffbe6;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background: url('images/event_night.jpg') no-repeat center center fixed;
                background-size: cover;
                position: relative; 
        }
        .logout-container {
            background-color: #fff4dc;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .logout-container h2 {
            color: #e67e22;
        }
        .logout-container a {
            display: inline-block;
            margin-top: 15px;
            padding: 10px 20px;
            background-color: #e67e22;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        .logout-container a:hover {
            background-color: #d35400;
        }
    </style>
</head>
<body>
    <div class="logout-container">
        <h2>You have been successfully logged out.</h2>
        <a href="login.jsp">Return to Login</a>
    </div>
</body>
</html>
