<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Event Registration</title>
    <style>
        body { 
            font-family: Arial, sans-serif; 
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
            background: url('images/images.jpeg') no-repeat center center fixed;
                background-size: cover;
                position: relative; 
        }
        .navbar {
            background-color:  #e67e22;
            padding: 15px 0;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            position: sticky;
            top: 0;
            z-index: 1000;
        }
        .nav-container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
        }
        .nav-brand {
            color: white;
            font-size: 24px;
            font-weight: bold;
            text-decoration: none;
        }
        .nav-links {
            display: flex;
            gap: 20px;
        }
        .nav-link {
            color: #ecf0f1;
            text-decoration: none;
            padding: 8px 15px;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        .nav-link:hover {
            background-color:  #d35400;
        }
        .container {
            max-width: 500px;
            margin: 40px auto;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        h1 { 
            text-align: center; 
            color: #333;
            margin-bottom: 30px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #555;
        }
        input[type="text"], input[type="email"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .submit-btn {
            background-color:  #e67e22;
            color: white; 
            padding: 10px 20px;
            border: none; 
            border-radius: 4px;
            cursor: pointer; 
            width: 100%;
            font-size: 16px;
        }
        .submit-btn:hover {
            background-color:#d35400; ;
        }
    </style>
</head>
<body>
    <nav class="navbar">
        <div class="nav-container">
            <a href="eventForm.jsp" class="nav-brand">Event Management System</a>
            <div class="nav-links">
                <a href="eventForm.jsp" class="nav-link">Event Registration</a>
                <a href="ParticipantServlet" class="nav-link">Participants</a>
                <a href="ReservationServlet" class="nav-link">Reservations</a>
                <a href="EventManagerForm.jsp" class="nav-link">Assign Manager</a>
                <a href="EventManagement.jsp" class="nav-link">Event Management</a>
                <a href="StatusForm.jsp" class="nav-link">Event Status Form</a>
                <a href="EventStatus.jsp" class="nav-link">Event Status List</a>
                <a href="logout" class="nav-link">Logout</a>

            </div>
        </div>
    </nav>

    <div class="container">
    <h1>Event Registration Form</h1>
    <form action="ParticipantServlet" method="post">
            <div class="form-group">
        <label for="name">Full Name:</label>
        <input type="text" id="name" name="name" required>
            </div>
            
            <div class="form-group">
        <label for="email">Email:</label>
        <input type="text" id="email" name="email" required>
            </div>
            
            <div class="form-group">
        <label for="event">Event Name:</label>
        <input type="text" id="event" name="event" required>
            </div>
            
            <button type="submit" class="submit-btn">Register</button>
    </form>
    </div>
</body>
</html>
