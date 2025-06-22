<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Event Status List</title>
    <style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #e8f5e9; /* Light green background */
        background: url('images/images.jpeg') no-repeat center center fixed, #e8f5e9;
        background-blend-mode: lighten;
        background-size: cover;
        position: relative;
    }

    .navbar {
        background-color: #4caf50; /* Green navbar */
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
        background-color: #388e3c; /* Darker green on hover */
    }

    .container {
        max-width: 1200px;
        margin: 20px auto;
        padding: 20px;
        background-color: white;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }

    h2 {
        color: #000000; /* Deep green heading */
        margin-bottom: 20px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    th, td {
        padding: 12px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    th {
        background-color: #4caf50; /* Green table headers */
        color: white;
    }

    tr:hover {
        background-color: #f1f8e9; /* Light green row hover */
    }

    .status-success {
        color: #2e7d32; /* Success green */
        font-weight: bold;
    }

    .status-cancelled {
        color: #c62828; /* Red for cancelled */
        font-weight: bold;
    }

    .no-data {
        text-align: center;
        padding: 20px;
        color: #666;
        font-style: italic;
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
        <h2>Event Status List</h2>
        <%
        // Database connection parameters
        String url = "jdbc:mysql://localhost:3306/eventdb";
        String username = "root";
        String password = "";

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Create connection
            Connection conn = DriverManager.getConnection(url, username, password);
            
            // Create statement
            Statement stmt = conn.createStatement();
            
            // Execute query
            String sql = "SELECT * FROM event_status ORDER BY created_at DESC";
            ResultSet rs = stmt.executeQuery(sql);
            
            // Check if there are any results
            if (!rs.isBeforeFirst()) {
                %>
                <div class="no-data">
                    <p>No event status records found.</p>
                </div>
                <%
            } else {
                %>
                <table>
                    <thead>
                        <tr>
                            <th>Event Name</th>
                            <th>Client Name</th>
                            <th>Status</th>
                            <th>Customer Comments</th>
                            <th>Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        while (rs.next()) {
                            String statusClass = rs.getString("status").equals("Success") ? "status-success" : "status-cancelled";
                            %>
                            <tr>
                                <td><%= rs.getString("event_name") %></td>
                                <td><%= rs.getString("client_name") %></td>
                                <td class="<%= statusClass %>"><%= rs.getString("status") %></td>
                                <td><%= rs.getString("customer_comments") %></td>
                                <td><%= rs.getTimestamp("created_at") %></td>
                            </tr>
                            <%
                        }
                        %>
                    </tbody>
                </table>
                <%
            }
            
            // Close resources
            rs.close();
            stmt.close();
            conn.close();
            
        } catch (Exception e) {
            %>
            <div class="no-data">
                <p>Error: <%= e.getMessage() %></p>
            </div>
            <%
        }
        %>
    </div>
</body>
</html> 