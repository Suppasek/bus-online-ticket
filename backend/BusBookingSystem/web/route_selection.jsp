<%-- 
    Document   : routeselection
    Created on : Apr 17, 2018, 12:02:42 PM
    Author     : Natsu
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="index.jsp" %>
        <form action="RouteSelectionServlet" method="POST">
        <table border="1">
            <thead>
                <tr>
                    <th>departure</th>
                    <th>destination</th>
                    <th>leaving date</th>
                    <th>leaving time</th>
                    <th>bustype</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${tablelist}" var="BusTable"> 
                <tr>                                        
                    <td><c:out value="${BusTable.departures}" /></td>
                    <td><c:out value="${BusTable.destinations}" /></td>
                    <td><c:out value="${BusTable.leavingDate}" /></td>
                    <td><c:out value="${BusTable.leavingTime}" /></td>
                    <td><c:out value="${BusTable.bus.busType.typeName}" />  </td>
                    <td><input type="radio" name="selectedroute" value="<c:out value="${BusTable.routeId}" />" checked="check"/></td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
            <input type="submit" value="ok" />
        </form>

</body>
</html>
