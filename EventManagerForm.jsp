<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ include file="header.jsp" %>
<title>Event Manager Assignment</title>
</head>
<body>
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
