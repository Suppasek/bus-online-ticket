<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- 
    Document   : seat_selection
    Created on : Apr 18, 2018, 10:24:22 AM
    Author     : Natsu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style><%@include file="/css/seat.css"%></style>
        <%@include file="index.jsp" %>
        <script>
            $(document).ready(function () {
                $("input[name='selected_seat']").change(function () {
                    var maxAllowed = 6;
                    var cnt = $("input[name='selected_seat']:checked").length;
                    if (cnt > maxAllowed) {
                        $(this).prop("checked", "");
                        alert('You can select maximum 6 seats');
                    }
                });
            });
        </script>
    </head>
    <body>
        <div class="bus">
            <ol class="cabin fuselage">
                <form action="SeatSelectionServlet" method="POST">
                    <fmt:parseNumber var="num" type="number" value="${route.seatAvailable}" />
                    <c:forEach var="i" begin="1" end="${num}" step="4">
                        <ol class="seats">
                            <li class="seat">
                                <input type="checkbox" name="selected_seat" id= <c:out value = "${i}"/> value = ${i} />
                                <label for = <c:out value = "${i}"/>><c:out value = "${i}"/></label>
                            </li>
                            <li class="seat">
                                <input type="checkbox" name="selected_seat" id= <c:out value = "${i+1}"/> value = ${i+1} />
                                <label for = <c:out value = "${i+1}"/>><c:out value = "${i+1}"/></label>
                            </li>
                            <li class="seat">
                                <input type="checkbox" name="selected_seat" id= <c:out value = "${i+2}"/> value = ${i+2} />
                                <label for = <c:out value = "${i+2}"/>><c:out value = "${i+2}"/></label>
                            </li>
                            <li class="seat">
                                <input type="checkbox" name="selected_seat" id= <c:out value = "${i+3}"/> value = ${i+3} />
                                <label for = <c:out value = "${i+3}"/>><c:out value = "${i+3}"/></label>
                            </li>
                        </ol>
                    </c:forEach>
                    <input type="submit" value="submit" />
                </form>
            </ol>
        </div>
    </body>
</html>
