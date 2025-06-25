<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ include file="header.jsp" %>
<title>Reservation Schedule</title>
</head>
<body>
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
            <table>
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
