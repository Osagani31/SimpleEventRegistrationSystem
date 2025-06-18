package com.nsbm.controller;

import com.nsbm.dao.ParticipantDAO;
import com.nsbm.model.Participant;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ParticipantServlet", value = "/ParticipantServlet")
public class ParticipantServlet extends HttpServlet {
    private ParticipantDAO participantDAO;
    
    @Override
    public void init() throws ServletException {
        try {
            participantDAO = new ParticipantDAO();
        } catch (Exception e) {
            throw new ServletException("Failed to initialize ParticipantDAO", e);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String event = request.getParameter("event");
            
            Participant newParticipant = new Participant(name, email, event);
            participantDAO.insertParticipant(newParticipant);
            response.sendRedirect("ParticipantServlet");
        } catch (SQLException e) {
            throw new ServletException("Error processing registration", e);
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Participant> participantList = participantDAO.listParticipants();
            request.setAttribute("participantList", participantList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("participantList.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            throw new ServletException("Error retrieving participant list", e);
        }
    }
}
