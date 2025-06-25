<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="header.jsp" %>
<title>Registered Participants</title>
</head>
<body>
    <div class="container">
        <h1>Registered Participants</h1>
        
        <c:choose>
            <c:when test="${empty participantList}">
                <div class="no-data">
                    <p>No participants registered yet.</p>
                </div>
            </c:when>
            <c:otherwise>
                <table>
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Event</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="participant" items="${participantList}">
                            <tr>
                                <td><c:out value="${participant.name}" /></td>
                                <td><c:out value="${participant.email}" /></td>
                                <td><c:out value="${participant.event}" /></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>
