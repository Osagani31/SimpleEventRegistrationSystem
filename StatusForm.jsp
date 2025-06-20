<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Event Status Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            background: url('images/images.jpeg') no-repeat center center fixed;
            background-size: cover;
            position: relative;
        }
        .navbar {
    background-color: #e67e22;
    padding: 15px 30px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    position: sticky;
    top: 0;
    z-index: 1000;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.nav-brand {
    color: white;
    text-decoration: none;
    font-size: 24px;
    font-weight: bold;
}

.nav-links {
    display: flex;
    gap: 10px;
}

.nav-link {
    color: white;
    text-decoration: none;
    padding: 10px 15px;
    border-radius: 4px;
    transition: background-color 0.3s;
}

.nav-link:hover {
    background-color: #d35400;
}

        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }
        input[type="text"],
        select,
        textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        textarea {
            height: 100px;
            resize: vertical;
        }
        .submit-btn {
            background-color: #e67e22;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }
        .submit-btn:hover {
            background-color: #d35400;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <a href="eventForm.jsp" class="nav-brand">Event Management System</a>
        <div class="nav-links">
            <a href="eventForm.jsp" class="nav-link">Event Registration</a>
            <a href="participantList.jsp" class="nav-link">Participants</a>
            <a href="reservationSchedule.jsp" class="nav-link">Reservations</a>
            <a href="EventManagerForm.jsp" class="nav-link">Assign Manager</a>
            <a href="EventManagement.jsp" class="nav-link">Event Management</a>
            <a href="StatusForm.jsp" class="nav-link">Event Status Form</a>
            <a href="EventStatus.jsp" class="nav-link">Event Status List</a>
            <a href="logout" class="nav-link">Logout</a>
        </div>
    </div>

    <div class="container">
        <h2>Update Event Status</h2>
        <form action="EventStatusServlet" method="post">
            <div class="form-group">
                <label for="eventName">Event Name:</label>
                <input type="text" id="eventName" name="eventName" required>
            </div>
            
            <div class="form-group">
                <label for="clientName">Client Name:</label>
                <input type="text" id="clientName" name="clientName" required>
            </div>
            
            <div class="form-group">
                <label for="status">Status:</label>
                <select id="status" name="status" required>
                    <option value="">Select Status</option>
                    <option value="Success">Success</option>
                    <option value="Cancelled">Cancelled</option>
                </select>
            </div>
            
            <div class="form-group">
                <label for="comments">Customer Comments:</label>
                <textarea id="comments" name="comments" required></textarea>
            </div>
            
            <button type="submit" class="submit-btn">Submit Status</button>
        </form>
    </div>
</body>
</html> 