<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Event Registration</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        form { max-width: 500px; margin: 0 auto; padding: 20px; border: 1px solid #ddd; border-radius: 5px; }
        h1 { text-align: center; color: #333; }
        label { display: block; margin-top: 15px; }
        input[type="text"] { width: 100%; padding: 8px; margin-top: 5px; }
        input[type="submit"] { 
            background-color: #4CAF50; 
            color: white; 
            padding: 10px 15px; 
            border: none; 
            margin-top: 20px; 
            cursor: pointer; 
            width: 100%;
        }
        input[type="submit"]:hover { background-color: #45a049; }
        .view-link { 
            display: block; 
            text-align: center; 
            margin-top: 20px; 
            color: #333; 
            text-decoration: none;
        }
        .view-link:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <h1>Event Registration Form</h1>
    <form action="ParticipantServlet" method="post">
        <label for="name">Full Name:</label>
        <input type="text" id="name" name="name" required>
        <label for="email">Email:</label>
        <input type="text" id="email" name="email" required>
        <label for="event">Event Name:</label>
        <input type="text" id="event" name="event" required>
        <input type="submit" value="Register">
    </form>
    <a href="ParticipantServlet" class="view-link">View All Participants</a>
</body>
</html>