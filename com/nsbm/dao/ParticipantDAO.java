package com.nsbm.dao;

import com.nsbm.model.Participant;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ParticipantDAO {
    private final String jdbcURL = "jdbc:mysql://localhost:3306/eventdb";
    private final String jdbcUsername = "root";
    private final String jdbcPassword = "";
    
    private static final String INSERT_PARTICIPANT_SQL = "INSERT INTO participants (name, email, event) VALUES (?, ?, ?)";
    private static final String SELECT_ALL_PARTICIPANTS = "SELECT * FROM participants ORDER BY registration_date DESC";
    
    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }
    
    public void insertParticipant(Participant participant) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PARTICIPANT_SQL)) {
            preparedStatement.setString(1, participant.getName());
            preparedStatement.setString(2, participant.getEmail());
            preparedStatement.setString(3, participant.getEvent());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
            throw e;
        }
    }
    
    public List<Participant> listParticipants() {
        List<Participant> participants = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PARTICIPANTS)) {
            ResultSet rs = preparedStatement.executeQuery();
            
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String event = rs.getString("event");
                participants.add(new Participant(id, name, email, event));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return participants;
    }
    
    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
