<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Event Status Form</title>
    <style>
        :root {
            --primary-green: #2e7d32;
            --light-green: #e8f5e9;
            --medium-green: #4caf50;
            --dark-green: #1b5e20;
            --white: #ffffff;
            --black: #333333;
            --light-gray: #f5f5f5;
        }
        
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: var(--black);
            background-color: var(--light-green);
            margin: 0;
            padding: 0;
        }
        
        .navbar {
            background-color: var(--primary-green);
            padding: 0.8rem 2rem;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            position: sticky;
            top: 0;
            z-index: 1000;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .nav-brand {
            color: var(--white);
            font-size: 1.5rem;
            font-weight: 600;
            text-decoration: none;
            display: flex;
            align-items: center;
        }
        
        .nav-brand i {
            margin-right: 10px;
        }
        
        .nav-links {
            display: flex;
            align-items: center;
            gap: 1rem;
        }
        
        .nav-link {
            color: var(--white);
            text-decoration: none;
            padding: 0.6rem 1rem;
            border-radius: 4px;
            transition: all 0.3s ease;
            font-size: 0.95rem;
        }
        
        .nav-link:hover {
            background-color: var(--dark-green);
        }
        
        .logout-btn {
            background-color: #d32f2f;
            color: white;
            border: none;
            padding: 0.6rem 1.2rem;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 500;
            transition: all 0.3s ease;
            margin-left: 1rem;
        }
        
        .logout-btn:hover {
            background-color: #b71c1c;
        }
        
        .container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 1.5rem;
            background-color: var(--white);
            border-radius: 8px;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.05);
        }
        
        h1, h2 {
            color: #000000;
            margin-bottom: 1.5rem;
            font-weight: 600;
        }
        
        .form-group {
            margin-bottom: 1.5rem;
        }
        
        label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: var(--black);
        }
        
        input[type="text"],
        input[type="email"],
        input[type="password"],
        input[type="date"],
        input[type="number"],
        select,
        textarea {
            width: 100%;
            padding: 0.8rem;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 1rem;
            transition: border-color 0.3s;
        }
        
        input:focus,
        select:focus,
        textarea:focus {
            border-color: var(--medium-green);
            outline: none;
            box-shadow: 0 0 0 2px rgba(76, 175, 80, 0.2);
        }
        
        .submit-btn {
            background-color: var(--medium-green);
            color: white;
            padding: 0.8rem;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1rem;
            font-weight: 500;
            transition: background-color 0.3s;
            width: 100%;
        }
        
        .submit-btn:hover {
            background-color: var(--dark-green);
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 1.5rem;
            background-color: var(--white);
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }
        
        th, td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid #eee;
        }
        
        th {
            background-color: var(--medium-green);
            color: white;
            font-weight: 500;
        }
        
        tr:hover {
            background-color: #f5f5f5;
        }
        
        .status-success {
            color: var(--primary-green);
            font-weight: 500;
        }
        
        .status-cancelled {
            color: #d32f2f;
            font-weight: 500;
        }
        
        .no-data {
            text-align: center;
            padding: 2rem;
            color: #666;
            font-style: italic;
            background-color: var(--white);
            border-radius: 4px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }
        
        .nav-buttons {
            display: flex;
            gap: 1rem;
            margin-bottom: 1.5rem;
        }
        
        .nav-button {
            display: inline-block;
            padding: 0.7rem 1.2rem;
            background-color: var(--medium-green);
            color: white;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s;
            font-size: 0.9rem;
        }
        
        .nav-button:hover {
            background-color: var(--dark-green);
        }
        
        textarea {
            min-height: 100px;
            resize: vertical;
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
            <button class="logout-btn" onclick="window.location.href='logout'">Logout</button>

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
