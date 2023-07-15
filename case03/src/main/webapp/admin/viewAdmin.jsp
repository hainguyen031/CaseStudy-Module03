<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 7/13/2023
  Time: 8:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Car Management</title>
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
<style>
    th{
        text-align: center;
       vertical-align: middle;
    }
    td{
        vertical-align: middle;
    }
</style>
<body>

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
                        <a class="nav-link px-3" href="#">Cars</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link px-3" href="#services">Services</a>
                    </li>
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

<div align="center" style="margin-left: 10%; margin-right: 10%">
    <caption><h1 style="padding-top: 100px">Lists of car</h1></caption>
    <table class="table table-hover" border="1" cellpadding="5" style="border-collapse: collapse; margin-top: 16px">

        <tr>
            <th>ID</th>
            <th>Brand</th>
            <th>Model</th>
            <th>Seat</th>
            <th>Rental price</th>
            <th>Car location</th>
            <th>Car available</th>
            <th>Describe</th>
            <th>Images 1</th>
            <th>Images 2</th>
            <th>Images 3</th>
            <th>Images 4</th>
            <th><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-gear-fill" viewBox="0 0 16 16">
                <path d="M9.405 1.05c-.413-1.4-2.397-1.4-2.81 0l-.1.34a1.464 1.464 0 0 1-2.105.872l-.31-.17c-1.283-.698-2.686.705-1.987 1.987l.169.311c.446.82.023 1.841-.872 2.105l-.34.1c-1.4.413-1.4 2.397 0 2.81l.34.1a1.464 1.464 0 0 1 .872 2.105l-.17.31c-.698 1.283.705 2.686 1.987 1.987l.311-.169a1.464 1.464 0 0 1 2.105.872l.1.34c.413 1.4 2.397 1.4 2.81 0l.1-.34a1.464 1.464 0 0 1 2.105-.872l.31.17c1.283.698 2.686-.705 1.987-1.987l-.169-.311a1.464 1.464 0 0 1 .872-2.105l.34-.1c1.4-.413 1.4-2.397 0-2.81l-.34-.1a1.464 1.464 0 0 1-.872-2.105l.17-.31c.698-1.283-.705-2.686-1.987-1.987l-.311.169a1.464 1.464 0 0 1-2.105-.872l-.1-.34zM8 10.93a2.929 2.929 0 1 1 0-5.86 2.929 2.929 0 0 1 0 5.858z"/>
            </svg></th>
        </tr>
        <c:forEach var="car" items="${carList}">
            <tr>
                <td><c:out value="${car.id}"/></td>
                <td><c:out value="${car.brand}"/></td>
                <td><c:out value="${car.model}"/></td>
                <td><c:out value="${car.seats}"/></td>
                <td><c:out value="${car.rentPrice}"/></td>
                <td><c:out value="${car.carLocation}"/></td>
                <td><c:out value="${car.available ? 'Có sẵn' : 'Đã được thuê'}"/></td>
                <td><c:out value="${car.describe}"/></td>
                <td>
                    <img src="<c:out value="${car.url}"/>" width="100px" height="100px" >
                </td>
                <td>
                    <img src="<c:out value="${car.url2}"/>" width="100px" height="100px" >
                </td>
                <td>
                    <img src="<c:out value="${car.url3}"/>" width="100px" height="100px" >
                </td>
                <td>
                    <img src="<c:out value="${car.url4}"/>" width="100px" height="100px" >
                </td>
                <td>
                    <a href="/admin?action=editCar&id=${car.id}">Edit</a>
                    <a href="/admin?action=deleteCar&id=${car.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

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
