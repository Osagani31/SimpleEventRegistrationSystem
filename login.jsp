<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
                background: url('images/event_night.jpg') no-repeat center center fixed;
                background-size: cover;
                position: relative; /* Needed for the overlay */
            }
            body::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.4); /* Dark semi-transparent overlay */
                z-index: 1;
            }
            .login-container {
                background-color: rgba(255, 255, 255, 0.9); /* Slightly transparent white */
                padding: 40px;
                border-radius: 10px;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
                width: 350px;
                z-index: 2; /* Ensure it's above the overlay */
            }
            h2 {
                text-align: center;
                color: #333;
                margin-bottom: 25px;
            }
            .form-group {
                margin-bottom: 20px;
            }
            label {
                display: block;
                margin-bottom: 8px;
                color: #555;
                font-weight: bold;
            }
            input[type="text"], input[type="password"] {
                width: 100%;
                padding: 12px;
                border: 1px solid #ddd;
                border-radius: 5px;
                box-sizing: border-box;
                font-size: 16px;
            }
            button {
                width: 100%;
                padding: 12px;
                background-color: #e67e22; /* Warm orange to match lights */
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 18px;
                font-weight: bold;
                transition: background-color 0.3s ease;
            }
            button:hover {
                background-color: #d35400; /* Darker orange on hover */
            }
            .error-message {
                color: #c0392b; /* Red for errors */
                background-color: #fce4e4;
                border: 1px solid #e74c3c;
                padding: 10px;
                border-radius: 5px;
                margin-bottom: 15px;
                text-align: center;
            }
        </style>
            
    </head>
    <body>
        <div class="login-container">
            <h2 style="text-align: center;">Login</h2>
            <% if (request.getParameter("error") != null) { %>
                <div class="error-message">Incorrect username or password</div>
            <% } %>
            <form action="login" method="POST">
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" required>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <button type="submit">Login</button>
            </form>
        </div>
    </body>
</html> 
