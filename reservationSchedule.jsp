<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Reservation Schedule</title>
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
        color: #2e7d32; /* Deep green heading */
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
        <h1>Reservation Schedule</h1>

        <%
            List<Map<String, String>> reservations = (List<Map<String, String>>) request.getAttribute("reservations");
            if (reservations == null || reservations.isEmpty()) {
        %>
            <div class="no-data">
                <p>No reservations found.</p>
            </div>
        <% } else { %>
            <table class="schedule-table">
                <thead>
                    <tr>
                        <th>Client Name</th>
                        <th>Event</th>
                        <th>Reservation Date</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Map<String, String> reservation : reservations) { %>
                        <tr>
                            <td><%= reservation.get("name") %></td>
                            <td><%= reservation.get("event") %></td>
                            <td><%= reservation.get("date") %></td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        <% } %>
    </div>
</body>
</html> 