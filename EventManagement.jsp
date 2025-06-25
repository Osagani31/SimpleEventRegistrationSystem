<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ include file="header.jsp" %>
<title>Event Management</title>
</head>
<body>
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
                    <table>
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
