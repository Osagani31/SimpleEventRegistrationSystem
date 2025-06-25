<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>
<title>Event Registration</title>
</head>
<body>
    <div class="container">
        <h1>Event Registration Form</h1>
        <form action="ParticipantServlet" method="post">
            <div class="form-group">
                <label for="name">Full Name:</label>
                <input type="text" id="name" name="name" required>
            </div>
            
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            
            <div class="form-group">
                <label for="event">Event Name:</label>
                <input type="text" id="event" name="event" required>
            </div>
            
            <button type="submit" class="submit-btn">Register</button>
        </form>
    </div>
</body>
</html>
