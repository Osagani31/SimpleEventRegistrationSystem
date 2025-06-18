<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Event Manager Assignment</title>
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
            background-color: #e67e22;
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
            background-color: #d35400;
        }
        .container {
            max-width: 600px;
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
        input[type="text"], input[type="email"], select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        select {
            background-color: white;
        }
        .submit-btn {
            background-color:#e67e22;
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
        <h1>Event Manager Assignment</h1>
        
        <form action="EventManagerServlet" method="POST">
            <div class="form-group">
                <label for="clientName">Client Name:</label>
                <input type="text" id="clientName" name="clientName" required>
            </div>
            
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            
            <div class="form-group">
                <label for="eventName">Event Name:</label>
                <input type="text" id="eventName" name="eventName" required>
            </div>
            
            <div class="form-group">
                <label for="eventManager">Event Manager:</label>
                <select id="eventManager" name="eventManager" required>
                    <option value="">Select Event Manager</option>
                    <%
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection conn = DriverManager.getConnection(
                                "jdbc:mysql://localhost:3306/eventdb",
                                "root",
                                ""
                            );
                            
                            String query = "SELECT id, name FROM event_managers";
                            Statement stmt = conn.createStatement();
                            ResultSet rs = stmt.executeQuery(query);
                            
                            while (rs.next()) {
                    %>
                                <option value="<%= rs.getInt("id") %>"><%= rs.getString("name") %></option>
                    <%
                            }
                            
                            rs.close();
                            stmt.close();
                            conn.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                </select>
            </div>
            
            <div class="form-group">
                <label for="hall">Hall:</label>
                <select id="hall" name="hall" required>
                    <option value="">Select Hall</option>
                    <%
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection conn = DriverManager.getConnection(
                                "jdbc:mysql://localhost:3306/eventdb",
                                "root",
                                ""
                            );
                            
                            String query = "SELECT id, name, capacity FROM halls";
                            Statement stmt = conn.createStatement();
                            ResultSet rs = stmt.executeQuery(query);
                            
                            while (rs.next()) {
                    %>
                                <option value="<%= rs.getInt("id") %>">
                                    <%= rs.getString("name") %> (Capacity: <%= rs.getInt("capacity") %>)
                                </option>
                    <%
                            }
                            
                            rs.close();
                            stmt.close();
                            conn.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                </select>
            </div>
            
            <button type="submit" class="submit-btn">Assign Event Manager</button>
        </form>
    </div>
</body>
</html> 
