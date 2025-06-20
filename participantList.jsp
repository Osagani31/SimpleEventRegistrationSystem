<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registered Participants</title>
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
            max-width: 800px;
            margin: 40px auto;
            padding: 20px;
        }
        h1 { 
            text-align: center; 
            color: #333;
            margin-bottom: 30px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 1px 3px rgba(0,0,0,0.2);
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #e67e22;
            color: white;
        }
        tr:hover {
            background-color: #ffeacc;
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
        <h1>Registered Participants</h1>
        
        <c:choose>
            <c:when test="${empty participantList}">
                <div class="no-data">
                    <p>No participants registered yet.</p>
                </div>
            </c:when>
            <c:otherwise>
                <table>
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Event</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="participant" items="${participantList}">
                            <tr>
                                <td><c:out value="${participant.name}" /></td>
                                <td><c:out value="${participant.email}" /></td>
                                <td><c:out value="${participant.event}" /></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>