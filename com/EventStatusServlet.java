package com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/EventStatusServlet")
public class EventStatusServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Get form data
        String eventName = request.getParameter("eventName");
        String clientName = request.getParameter("clientName");
        String status = request.getParameter("status");
        String comments = request.getParameter("comments");
        
        // Database connection parameters
        String url = "jdbc:mysql://localhost:3306/eventdb";
        String username = "root";
        String password = "";
        
        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Create connection
            Connection conn = DriverManager.getConnection(url, username, password);
            
            // Prepare SQL statement
            String sql = "INSERT INTO event_status (event_name, client_name, status, customer_comments) VALUES (?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            
            // Set parameters
            pstmt.setString(1, eventName);
            pstmt.setString(2, clientName);
            pstmt.setString(3, status);
            pstmt.setString(4, comments);
            
            // Execute query
            pstmt.executeUpdate();
            
            // Close resources
            pstmt.close();
            conn.close();
            
            // Redirect to status list page
            response.sendRedirect("EventStatus.jsp");
            
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
} 