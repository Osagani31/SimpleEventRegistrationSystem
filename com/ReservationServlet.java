package com;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ReservationServlet", urlPatterns = {"/ReservationServlet"})
public class ReservationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Map<String, String>> reservations = new ArrayList<>();
        
        try {
            // Get database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/eventdb",
                "root",
                ""
            );
            
            // Query to join participant and event information
            String query = "SELECT p.name, p.event, p.email, p.registration_date " +
                          "FROM participants p " +
                          "ORDER BY p.registration_date DESC";
            
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            
            while (rs.next()) {
                Map<String, String> reservation = new HashMap<>();
                reservation.put("name", rs.getString("name"));
                reservation.put("event", rs.getString("event"));
                reservation.put("date", rs.getString("registration_date"));
                reservations.add(reservation);
            }
            
            // Close resources
            rs.close();
            stmt.close();
            conn.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        // Set the reservations list as an attribute
        request.setAttribute("reservations", reservations);
        
        // Forward to the JSP page
        request.getRequestDispatcher("reservationSchedule.jsp").forward(request, response);
    }
} 