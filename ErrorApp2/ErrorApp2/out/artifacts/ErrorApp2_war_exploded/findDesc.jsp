<%@ page import="ErrorApp2.DBHandler" %>
<%@ page import="ErrorApp2.OrgEvent" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>FindDesc</title>
</head>
<%
    String desc = request.getParameter("desc");
    List<OrgEvent> orgEvents = new ArrayList<OrgEvent>();
    DBHandler dbHandler;
    try {
        dbHandler = new DBHandler();
        orgEvents = dbHandler.findEventByDesc(desc);
    } catch (SQLException e) {
        e.printStackTrace();
    }
    pageContext.setAttribute("orgEvents", orgEvents);
%>
<table>
    <tr><th>Name</th><th>Date</th><th>Description</th><th>ErrorApp2.EventType ID</th></tr>
    <c:forEach var="orgEvent" items="${orgEvents}">
        <tr><td>${orgEvent.name}</td>
            <td>${orgEvent.date}</td>
            <td>${orgEvent.description}</td>
            <td>${orgEvent.typeID}</td>
        </tr>
    </c:forEach>
</table>
<p><a href="index.jsp">Back</a></p>
</body>
</html>