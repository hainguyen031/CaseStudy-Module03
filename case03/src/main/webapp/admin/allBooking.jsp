<%@ page import="entity.Booking" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.temporal.ChronoUnit" %><%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 7/16/2023
  Time: 11:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>All Booking</title>
  <!--vendor css ================================================== -->
  <link rel="stylesheet" type="text/css" href="css/vendor.css">

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


  <!-- script ================================================== -->
  <script src="js/modernizr.js"></script>
</head>
<body>
<%
  List<Booking> bookingList = (List<Booking>) request.getAttribute("bookingList");
%>
<nav class="navbar navbar-expand-lg  navbar-light container-fluid py-3 position-fixed">
  <div class="container">
    <a class="navbar-brand" href="/admin"><img src="images/logo.png" alt="logo"></a>
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
            <a class="nav-link px-3" href="/admin">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link px-3" href="/admin?action=addNewCar">Add Car</a>
          </li>
          <li class="nav-item">
            <a class="nav-link px-3" href="/admin?action=listBooking">List Booking</a>
          </li>
<%--          <li class="nav-item">--%>
<%--            <a class="nav-link px-3" href="#services">Services</a>--%>
<%--          </li>--%>
          <li class="nav-item">
            <%--                        <a class="nav-link px-3" href="/user?action=login">Logout</a>--%>
            <button type="button" class="btn btn-outline-primary nav-button mx-3"
                    onclick="window.location.href = '/user?action=login';"> Logout
            </button>
          </li>
        </ul>


      </div>
    </div>
  </div>
</nav>

<h2 style="padding-top: 100px; text-align: center">Lists of booking car</h2>

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

</body>
</html>
