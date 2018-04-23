<%-- 
    Document   : register
    Created on : Apr 16, 2018, 10:15:50 PM
    Author     : Natsu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="index.jsp" %>
        <script>
            $(document).ready(function () {
                $(".close2").click(function () {
                    $("#myModal").remove();
                });
                $(window).click(function () {
                    $("#myModal").remove();
                });
            });

        </script>
    </head>
    <body>
        <!-- The Modal -->
        <c:if test="${requestScope.log != null}">  
        <div id="myModal" class="modal2" style="display: block;">         
            <!-- Modal content -->
            <div class="modal-content2">
                <span class="close2">&times;</span>
                <p><c:out value = "${requestScope.log}"/>...</p>
                <c:remove var = "log"/>
            </div>        
            </c:if>

        </div>
        <form action="RegisterServlet" method="POST">
            username <input type="text" name="username" value="" /> <br>
            password <input type="password" name="password" value="" /> <br>
            first name <input type="text" name="first_name" value="" /> <br>
            last name <input type="text" name="last_name" value="" /> <br>
            phone <input type="text" name="phone" value="" /> <br>
            e-mail <input type="text" name="email" value="" /> <br>
            <input type="submit" value="submit" />
        </form>
    </body>
</html>
