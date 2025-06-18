package com;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "EventManagerServlet", urlPatterns = {"/EventManagerServlet"})
public class EventManagerServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String clientName = request.getParameter("clientName");
        String email = request.getParameter("email");
        String eventName = request.getParameter("eventName");
        String managerId = request.getParameter("eventManager");
        String hallId = request.getParameter("hall");
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/eventdb",
                "root",
                ""
            );
            
            String query = "INSERT INTO event_assignments (client_name, email, event_name, manager_id, hall_id) " +
                          "VALUES (?, ?, ?, ?, ?)";
            
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, clientName);
            pstmt.setString(2, email);
            pstmt.setString(3, eventName);
            pstmt.setInt(4, Integer.parseInt(managerId));
            pstmt.setInt(5, Integer.parseInt(hallId));
            
            pstmt.executeUpdate();
            
            pstmt.close();
            conn.close();
            
            // Redirect to the event management page
            response.sendRedirect("EventManagement.jsp");
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("EventManagerForm.jsp?error=true");
        }
    }
} 