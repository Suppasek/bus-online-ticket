<%-- 
    Document   : index
    Created on : Apr 13, 2018, 10:56:30 PM
    Author     : Natsu
--%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%-- link css file --%>
        <style><%@include file="/WEB-INF/css/style.css"%></style>
        <%-- load jquery --%>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <%-- jquery script --%>
        <script>
            $(document).ready(function () {
                $("button[name='search']").click(function () {
                    $("#searchroute").toggle();
                });
                $("#snackbar").fadeOut(3000);
                $(".close2").click(function () {
                    $("#myModal").remove();
                });
                $(window).click(function () {
                    $("#myModal").remove();
                });
                <c:if test = "${(log eq 'wrongstatus')}"> 
                    $("#id01").show();
                </c:if>

            });

        </script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <body>
        <%--Check if newcomer, create session --%>
        <c:if test="${sessionScope.status == null}">
            <c:set var="status" value="guest" scope="session" />
            <b>new user</b>
        </c:if> 
            
        <%--Check if select seat but not log in --%>
        <c:if test = "${log eq 'wrongstatus'}">               
            <div id="snackbar">Please Log in</div>
        </c:if>        

        <%-- Check if fill id/password wrong --%>
        <c:if test = "${log eq 'wrongidpass'}">               
            <div id="snackbar">Incorrect username or password</div>
            <c:remove var = "log"/>
        </c:if>
        
        <c:if test = "${sessionScope.status ne 'customer'}">
            <%-- Register button --%>
            <form action="register.jsp">
                <input type="submit" value="register" />
            </form>
        </c:if>

        <%-- Check status guest/user --%>
        <c:choose>
            <%-- guest case --%>
            <c:when test="${sessionScope.status ne 'customer'}">
                <button onclick="document.getElementById('id01').style.display = 'block'" style="width:auto;">Sign in</button>
                <div id="id01" class="modal">
                    <form class="modal-content animate" action="LoginServlet" method="POST">

                        <div class="container">
                            <label for="uname"><b>Username</b></label>
                            <input type="text" placeholder="Enter Username" name="username" required>

                            <label for="psw"><b>Password</b></label>
                            <input type="password" placeholder="Enter Password" name="password" required>

                            <button type="submit">Login</button>
                            <label>
                                <input type="checkbox" checked="checked" name="remember"> Remember me
                            </label>
                        </div>

                        <div class="container" style="background-color:#f1f1f1">
                            <button type="button" onclick="document.getElementById('id01').style.display = 'none'" class="cancelbtn">Cancel</button>
                            <span class="psw">Forgot <a href="#">password?</a></span>
                        </div>
                    </form>
                </div>
            </c:when>
            <%-- user case --%>
            <c:otherwise>
                <form action="Logout" method="POST">
                    <button name="signout" type="submit" style="width:auto;">Sign out</button>
                </form>

            </c:otherwise>
        </c:choose>

        <%-- search route --%>
        <button name="search" style="width:auto;">ค้นหารอบรถ</button>
        <form action="RouteSearchServlet" method="POST">
            <%-- set datasource //dunno how to use listener --%>
            <sql:setDataSource var = "bustable" driver = "com.mysql.jdbc.Driver"
                               url = "jdbc:mysql://localhost:3306/busbooking?zeroDateTimeBehavior=convertToNull"
                               user = "root"  password = ""/>

            <%-- query departures --%>
            <sql:query dataSource = "${bustable}" var = "departures">
                SELECT departures from bus_table
            </sql:query>

            <%-- departures options --%>
            <div id="searchroute">departures <select name="departures">
                    <c:forEach var = "row" items = "${departures.rows}">

                        <option><c:out value = "${row.departures}"/></option>

                    </c:forEach>
                </select>

                <%-- query destinations --%>
                <sql:query dataSource = "${bustable}" var = "destinations">
                    SELECT destinations from bus_table
                </sql:query>

                <%-- destinations options --%>
                destinations <select name="destinations">
                    <c:forEach var = "row" items = "${destinations.rows}">

                        <option><c:out value = "${row.destinations}"/></option>

                    </c:forEach>
                </select>

                <%-- query leaving_date --%>
                <sql:query dataSource = "${bustable}" var = "leaving_date">
                    SELECT leaving_date from bus_table
                </sql:query>

                <%-- leaving date options --%>
                date <select name="date">
                    <c:forEach var = "row" items = "${leaving_date.rows}">

                        <option><c:out value = "${row.leaving_date}"/></option>

                    </c:forEach>
                </select>

                <input type="submit" value="ok" /></div>
        </form>


        <%-- Check if register complete --%>
        <c:if test = "${log eq 'complete'}">               
            <div id="myModal" class="modal2" style="display: block;">         
                <!-- Modal content -->
                <div class="modal-content2">
                    <span class="close2">&times;</span>
                    <p>Register complete, Please sign in again</p>
                    <c:remove var = "log"/>
                </div>       
            </c:if> 

    </body>
</html>
