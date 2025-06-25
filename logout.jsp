<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Logged Out - Event Management System</title>
    <style>
        :root {
            --primary-green: #2e7d32;
            --medium-green: #4caf50;
            --dark-green: #1b5e20;
            --light-green: #e8f5e9;
            --white: #ffffff;
            --black: #333333;
            --gray-light: #f5f5f5;
            --gray-medium: #e0e0e0;
            --gray-dark: #757575;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            background-color: var(--primary-green);
            background-image: linear-gradient(135deg, var(--dark-green) 0%, var(--primary-green) 100%);
        }
        
        .logout-container {
            background-color: var(--white);
            padding: 2.5rem 3rem;
            border-radius: 8px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 420px;
            text-align: center;
            position: relative;
            overflow: hidden;
        }
        
        .logout-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 4px;
            background: linear-gradient(90deg, var(--primary-green), var(--medium-green));
        }
        
        .logo {
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.75rem;
        }
        
        .logo i {
            color: var(--primary-green);
            font-size: 1.75rem;
        }
        
        .logo-text {
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--black);
        }
        
        h2 {
            color: var(--black);
            margin-bottom: 2rem;
            font-weight: 600;
            font-size: 1.5rem;
        }
        
        .success-icon {
            color: var(--primary-green);
            font-size: 3rem;
            margin-bottom: 1.5rem;
        }
        
        .login-link {
            display: inline-block;
            width: 100%;
            padding: 0.9rem;
            background-color: var(--primary-green);
            color: var(--white);
            text-decoration: none;
            border-radius: 4px;
            font-weight: 500;
            transition: all 0.3s ease;
            margin-top: 1rem;
            border: none;
            font-size: 1rem;
            cursor: pointer;
        }
        
        .login-link:hover {
            background-color: var(--dark-green);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        }
        
        .footer {
            margin-top: 2rem;
            color: var(--gray-dark);
            font-size: 0.85rem;
        }
        
        @media (max-width: 480px) {
            .logout-container {
                padding: 1.75rem;
                margin: 1rem;
            }
            
            .logo-text {
                font-size: 1.3rem;
            }
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
    <div class="logout-container">
        <div class="logo">
            <i class="fas fa-calendar-alt"></i>
            <span class="logo-text">Event Management System</span>
        </div>
        <div class="success-icon">
            <i class="fas fa-check-circle"></i>
        </div>
        <h2>You have been successfully logged out</h2>
        <a href="login.jsp" class="login-link">Return to Login</a>
        <div class="footer">
            &copy; 2023 Event Management System
        </div>
    </div>
</body>
</html>
