<%@ page import="service.Impl.CarServiceImpl" %>
<%@ page import="entity.Car" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 7/11/2023
  Time: 9:49 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Car Detail</title>
    <!--vendor css ================================================== -->
    <link rel="stylesheet" type="text/css" href="css/vendor.css">

    <!-- Link Swiper's CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />

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
<nav class="navbar navbar-expand-lg  navbar-light container-fluid py-3 position-fixed ">
    <div class="container">
        <a class="navbar-brand" href="index.jsp"><img src="images/logo.png" alt="logo"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
                aria-controls="offcanvasNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasNavbarLabel">Menu</h5>
                <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <ul class="navbar-nav align-items-center justify-content-end flex-grow-1 pe-3">
                    <li class="nav-item">
                        <a class="nav-link active px-3" aria-current="page" href="#">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link px-3" href="#">Booking</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link px-3" href="#">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link px-3" href="#">Cars</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link px-3" href="#services">Services</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link px-3" href="#action">Contact</a>
                    </li>
                </ul>

                <div class="d-flex mt-5 mt-lg-0 ps-lg-5 align-items-center justify-content-center ">
                    <ul class="navbar-nav justify-content-end align-items-center">
                        <li class="nav-item">
                            <a class="nav-link px-3" href="/user?action=login"> Login </a>
                        </li>
                    </ul>
                    <button type="button" class="btn btn-outline-primary nav-button mx-3" onclick="window.location.href = '/user?action=register';"> Sign in </button>
                </div>
            </div>
        </div>
    </div>
</nav>


<!-- Lấy ID xe từ URL -->
<c:set var="carId" value="${param.id}"/>

<!-- Truy vấn dữ liệu xe từ cơ sở dữ liệu dựa trên ID -->
<%-- Thực hiện truy vấn và lấy thông tin chi tiết xe --%>
<%
    int carId = Integer.parseInt(request.getParameter("id"));
    Car car = CarServiceImpl.getInstance().searchCarById(carId);
    if (car != null) {
%>

<h1>Thông tin chi tiết xe</h1>
<p>Brand: <%= car.getBrand() %>
</p>
<p>Model: <%= car.getModel() %>
</p>
<p>Passengers: <%= car.getSeats() %>
</p>
<p>Rental Price: <%= car.getRentPrice() %>
</p>
<!-- Hiển thị các thông tin khác của xe -->
<%
} else {
%>
<p>Không tìm thấy thông tin chi tiết cho xe này</p>
<%
    }
%>


</body>
</html>
