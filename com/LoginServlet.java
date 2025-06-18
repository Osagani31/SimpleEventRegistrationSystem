package com;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        // Check credentials
        if ("admin".equals(username) && "admin123".equals(password)) {
            // Create session and set attribute
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            
            // Redirect to eventForm.jsp
            response.sendRedirect("eventForm.jsp");
        } else {
            // Redirect back to login page with error parameter
            response.sendRedirect("login.jsp?error=true");
        }
    }
} 