<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Event Management</title>
    <style>
    body { 
        font-family: Arial, sans-serif; 
        margin: 0;
        padding: 0;
        background-color: #d4f7dc; /* Light green background */
        background-blend-mode: lighten;
        background-size: cover;
        position: relative;
    }

    .navbar {
        background-color: #2e7d32; /* Deep green */
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
        color: #f1f8e9;
        text-decoration: none;
        padding: 8px 15px;
        border-radius: 4px;
        transition: background-color 0.3s;
    }

    .nav-link:hover {
        background-color: #1b5e20; /* Darker green on hover */
    }

    .container {
        max-width: 1000px;
        margin: 40px auto;
        padding: 20px;
    }

    h1 { 
        text-align: center; 
        color: #000000; /* Heading in deep green */
        margin-bottom: 30px;
    }

    .management-table {
        width: 100%;
        border-collapse: collapse;
        background-color: white;
        box-shadow: 0 1px 3px rgba(0,0,0,0.2);
    }

    .management-table th, .management-table td {
        padding: 12px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    .management-table th {
        background-color: #388e3c; /* Green table header */
        color: white;
    }

    .management-table tr:hover {
        background-color: #e8f5e9; /* Light green row hover */
    }

    .nav-buttons {
        margin: 20px 0;
        text-align: center;
    }

    .nav-button {
        display: inline-block;
        padding: 10px 20px;
        margin: 0 10px;
        background-color: #43a047; /* Button green */
        color: white;
        text-decoration: none;
        border-radius: 4px;
        transition: background-color 0.3s;
    }

    .nav-button:hover {
        background-color: #2e7d32; /* Darker green on hover */
    }

    .no-data {
        text-align: center;
        padding: 20px;
        background-color: white;
        border-radius: 4px;
        box-shadow: 0 1px 3px rgba(0,0,0,0.2);
        color: #666;
    }

    .submit-btn {
        background-color: #2e7d32; /* Submit button in green */
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        width: 100%;
        font-size: 16px;
    }

    .submit-btn:hover {
        background-color: #1b5e20; /* Darker green hover */
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
        <h1>Event Management</h1>
        
        <div class="nav-buttons">
            <a href="EventManagerForm.jsp" class="nav-button">Assign Event Manager</a>
            <a href="eventForm.jsp" class="nav-button">Back to Event Form</a>
        </div>

        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/eventdb",
                    "root",
                    ""
                );
                
                String query = "SELECT e.client_name, e.email, e.event_name, " +
                             "em.name as manager_name, h.name as hall_name, h.capacity " +
                             "FROM event_assignments e " +
                             "JOIN event_managers em ON e.manager_id = em.id " +
                             "JOIN halls h ON e.hall_id = h.id " +
                             "ORDER BY e.event_name";
                
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(query);
                
                if (!rs.isBeforeFirst()) {
        %>
                    <div class="no-data">
                        <p>No event assignments found.</p>
                    </div>
        <%
                } else {
        %>
                    <table class="management-table">
                        <thead>
                            <tr>
                                <th>Client Name</th>
                                <th>Email</th>
                                <th>Event Name</th>
                                <th>Event Manager</th>
                                <th>Hall</th>
                                <th>Hall Capacity</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% while (rs.next()) { %>
                                <tr>
                                    <td><%= rs.getString("client_name") %></td>
                                    <td><%= rs.getString("email") %></td>
                                    <td><%= rs.getString("event_name") %></td>
                                    <td><%= rs.getString("manager_name") %></td>
                                    <td><%= rs.getString("hall_name") %></td>
                                    <td><%= rs.getInt("capacity") %></td>
                                </tr>
                            <% } %>
                        </tbody>
                    </table>
        <%
                }
                
                rs.close();
                stmt.close();
                conn.close();
                
            } catch (Exception e) {
                e.printStackTrace();
        %>
                <div class="no-data">
                    <p>Error loading event management data.</p>
                </div>
        <%
            }
        %>
    </div>
</body>
</html> 