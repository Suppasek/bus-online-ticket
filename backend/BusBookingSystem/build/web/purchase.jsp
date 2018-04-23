<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- 
    Document   : purchase
    Created on : Apr 22, 2018, 3:55:01 PM
    Author     : Natsu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style><%@include file="/WEB-INF/css/payment.css"%></style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="index.jsp" %>
    </head>
    <body>
        <form action="PaymentServlet" method="POST">
            <input type="radio" name="payment_method" value="credit/debit" checked="check"/> credit/debit
            <input type="radio" name="payment_method" value="transfer" /> transfer
            <div class="row">
                <div class="col-75">
                    <div class="container">
                        <div class="row">
                            <div class="col-50">
                                <h3>Billing Address</h3>
                                <label for="fname"><i class="fa fa-user"></i> Full Name</label>
                                <input type="text" id="fname" name="firstname" placeholder="John M. Doe">
                                <label for="email"><i class="fa fa-envelope"></i> Email</label>
                                <input type="text" id="email" name="email" placeholder="john@example.com">
                                <label for="adr"><i class="fa fa-address-card-o"></i> Address</label>
                                <input type="text" id="adr" name="address" placeholder="542 W. 15th Street">
                                <label for="city"><i class="fa fa-institution"></i> City</label>
                                <input type="text" id="city" name="city" placeholder="New York">

                                <div class="row">
                                    <div class="col-50">
                                        <label for="state">State</label>
                                        <input type="text" id="state" name="state" placeholder="NY">
                                    </div>
                                    <div class="col-50">
                                        <label for="zip">Zip</label>
                                        <input type="text" id="zip" name="zip" placeholder="10001">
                                    </div>
                                </div>
                            </div>

                            <div class="col-50">
                                <h3>Payment</h3>
                                <label for="fname">Accepted Cards</label>
                                <div class="icon-container">
                                    <i class="fa fa-cc-visa" style="color:navy;">เอาไอคอนมาใส่ด้วย</i>
                                </div>
                                <label for="cname">Name on Card</label>
                                <input type="text" id="cname" name="cardname" placeholder="John More Doe">
                                <label for="ccnum">Credit card number</label>
                                <input type="text" id="ccnum" name="cardnumber" placeholder="1111-2222-3333-4444">
                                <label for="expmonth">Exp Month</label>
                                <input type="text" id="expmonth" name="expmonth" placeholder="September">

                                <div class="row">
                                    <div class="col-50">
                                        <label for="expyear">Exp Year</label>
                                        <input type="text" id="expyear" name="expyear" placeholder="2018">
                                    </div>
                                    <div class="col-50">
                                        <label for="cvv">CVV</label>
                                        <input type="text" id="cvv" name="cvv" placeholder="352">
                                    </div>
                                </div>
                            </div>

                        </div>
                        <label>
                            <input type="checkbox" checked="checked" name="sameadr"> Shipping address same as billing
                        </label>
                        <input type="submit" value="Continue to checkout" class="btn">
                    </div>
                </div>

                <div class="col-25">
                    <div class="container">
                        <h4>Ticket
                            <span class="price" style="color:black">
                                <i class="fa fa-shopping-cart"></i> 
                                <b>${fn:length(selected_seat)}</b>
                            </span>
                        </h4>
                        <c:forEach var="seat" items="${selected_seat}">
                            seat number <c:out value = "${seat}"/>
                            <c:out value = "${route.leavingDate}"/>
                            <c:out value = "${route.leavingTime}"/>
                            <c:out value = "${route.departures}"/>
                            <c:out value = "${route.destinations}"/>
                            <c:out value = "${route.bus.busType.price}"/> 
                            <br>
                        </c:forEach>
                        <hr>
                        <p>Total <span class="price" style="color:black"><b>${fn:length(selected_seat)*route.bus.busType.price}</b></span></p>
                    </div>
                </div>
            </div>
        </form>

    </body>
</html>
