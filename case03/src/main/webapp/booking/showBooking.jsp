<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="entity.Car" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.User" %>
<%@ page import="entity.Booking" %>
<%@ page import="java.time.temporal.ChronoUnit" %><%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 7/7/2023
  Time: 4:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Car Rental with the Bests Prices</title>
    <!--vendor css ================================================== -->
    <link rel="stylesheet" type="text/css" href="css/vendor.css">
    <link rel="stylesheet" type="text/css" href="css/detailCar.css">

    <!-- Link Swiper's CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>

    <!--Bootstrap ================================================== -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">

    <!-- Style Sheet ================================================== -->
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <!-- Google Fonts ================================================== -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Kalam:wght@700&family=Raleway:wght@400;700&display=swap"
          rel="stylesheet">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<% User user = (User) request.getAttribute("user");
    List<Booking> bookingList = (List<Booking>) request.getAttribute("bookingList");
%>


<nav class="navbar navbar-expand-lg  navbar-light container-fluid py-3 position-fixed ">
    <div class="container">
        <a class="navbar-brand" href="/customer?action=listCars"><img src="images/logo.png" alt="logo"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
                aria-controls="offcanvasNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasNavbarLabel">Menu</h5>
                <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"
                        aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <ul class="navbar-nav align-items-center justify-content-end flex-grow-1 pe-3">
                    <li class="nav-item">
                        <a class="nav-link active px-3" aria-current="page" href="/customer?action=listCars">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link px-3" href="/customer?action=showBooking">MyBooking</a>
                    </li>
<%--                    <li class="nav-item">--%>
<%--                        <a class="nav-link px-3" href="#">About</a>--%>
<%--                    </li>--%>
<%--                    <li class="nav-item">--%>
<%--                        <a class="nav-link px-3" href="#">Cars</a>--%>
<%--                    </li>--%>
<%--                    <li class="nav-item">--%>
<%--                        <a class="nav-link px-3" href="#services">Services</a>--%>
<%--                    </li>--%>
<%--                    <li class="nav-item">--%>
<%--                        <a class="nav-link px-3" href="#action">Contact</a>--%>
<%--                    </li>--%>
                </ul>

                <div class="d-flex mt-5 mt-lg-0 ps-lg-5 align-items-center justify-content-center ">
                    <ul class="navbar-nav justify-content-end align-items-center">
                        <li class="nav-item">
                            <a class="nav-link px-3" href="/user?action=login"> Welcome
                                <b><%= user.getUsername()%>
                                </b>
                            </a>

                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</nav>

<!-- hero section start  -->
<section id="hero" class=" position-relative overflow-hidden">
    <div class="pattern-overlay pattern-right position-absolute">
        <img src="images/hero-pattern-right.png" alt="pattern">
    </div>
    <div class="pattern-overlay pattern-left position-absolute">
        <img src="images/hero-pattern-left.png" alt="pattern">
    </div>
    <div class="hero-content container text-center">
        <div class="row">
            <div class="detail mb-4">
                <h1 class="">Find your <span class="text-primary"> rental car </span></h1>
                <p class="hero-paragraph">We have many best rental car collections.</p>
            </div>
        </div>
    </div>
</section>



<%--<section>--%>
    <% if (bookingList != null && !bookingList.isEmpty()) {
        int count = 0;
        for (Booking booking : bookingList) {
            count++;
            int numberOfDays = (int) ChronoUnit.DAYS.between(booking.getStartDate(), booking.getEndDate()) + 1;
            int rentalPrice = booking.getRentPrice();
            int totalAmount = numberOfDays * rentalPrice;
    %>

<div align="center" style="margin-top: 5%">
        <caption>
            <h4>Booking Information <%= count %></h4>
        </caption>
        <table class="table" border="1" cellpadding="5" style="border-collapse: collapse; width: 60%">
            <tr>
                <th><strong>Username:</strong></th>
                <td>
                    <%= booking.getUsername() %>
                </td>
            </tr>
            <tr>
                <th><strong>Email:</strong></th>
                <td>
                    <%= booking.getEmail() %>
                </td>
            </tr>
            <tr>
                <th><strong>Phone:</strong></th>
                <td>
                    <%= booking.getPhone() %>
                </td>
            </tr>
            <tr>
                <th><strong>CCCD:</strong></th>
                <td>
                    <%= booking.getCccd() %>
                </td>
            </tr>
            <tr>
                <th><strong>GPLX:</strong></th>
                <td>
                    <%= booking.getGplx() %>
                </td>
            </tr>
            <tr>
                <th><strong>Pickup Location:</strong></th>
                <td>
                    <%= booking.getPickupLocation() %>
                </td>
            </tr>
            <tr>
                <th><strong>Car:</strong></th>
                <td>
                    <%=booking.getBrand()%> <%=booking.getModel()%>
                </td>
            </tr>
            <tr>
                <th><strong>Rental Price:</strong></th>
                <td>
                    <%= booking.getRentPrice() %>
                </td>
            </tr>
            <tr>
                <th><strong>Rental Date:</strong></th>
                <td>
                    <%= booking.getStartDate() %>
                </td>
            </tr>
            <tr>
                <th><strong>Return Date:</strong></th>
                <td>
                    <%= booking.getEndDate() %>
                </td>
            </tr>
            <tr>
                <th><strong>Total Rental Date:</strong></th>
                <td>
                    <%= numberOfDays %>
                </td>
            </tr>
            <tr>
                <th><strong>Total pay:</strong></th>
                <td>
                    <%= totalAmount %>
                </td>
            </tr>
        </table>
</div>
    <%
        }
    } else { %>
    <h2>No Booking Information</h2>
    <% } %>


<%--</section>--%>

<!-- Footer Section Starts -->
<section id="footer">
    <footer class="d-flex flex-wrap justify-content-between align-items-center border-top"></footer>

    <div class="container">
        <footer class="d-flex flex-wrap justify-content-between align-items-center py-2 pt-4">
            <div class="col-md-6 d-flex align-items-center">
                <p>© 2023 GoCar - All rights reserved</p>

            </div>
            <div class="col-md-6 d-flex align-items-center justify-content-end">
                <p class="">© 2023 Designed By:<a href="#" class="website-link"
                                                  target="_blank"> <b><u>HaiNguyen-CG</u></b></a></p>
            </div>

        </footer>
    </div>
</section>

<!-- script ================================================== -->
<script src="js/jquery-1.11.0.min.js"></script>
<script src="js/plugins.js"></script>
<script src="js/script.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/iconify-icon@1.0.7/dist/iconify-icon.min.js"></script>
<script src="js/detailCar.js"></script>
</body>
</html>
