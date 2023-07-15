<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 7/10/2023
  Time: 8:55 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Add Car</title>
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


<div align="center">
    <form method="post" action="/admin?action=addNewCar">
        <caption>
            <h2 style="padding-top: 100px">Add New Car</h2>
        </caption>
        <table class="table table-hover" border="1" cellpadding="5" style="border-collapse: collapse; margin-top: 16px; width: 60%">

            <tr>
                <th>Car brand:</th>
                <td>
                    <input type="text" name="brand" id="brand" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Car model:</th>
                <td>
                    <input type="text" name="model" id="model" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Numbers of seat:</th>
                <td>
                    <select class="form-select" id="seat" name="seat">
                        <option value="4">4 seats</option>
                        <option value="7">7 seats</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Rental price:</th>
                <td>
                    <input type="text" name="price" id="price" size="45"/>
                    <input type="hidden" value="true" name="available">
                </td>
            </tr>
            <tr>
                <th>Car location:</th>
                <td>
                    <select class="form-select" id="location" name="location">
                        <option value="Ha Noi">Ha Noi</option>
                        <option value="Da Nang">Da Nang</option>
                        <option value="Ho Chi Minh">Ho Chi Minh</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Images URL:</th>
                <td>
                    <input type="text" name="url" id="url" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Images URL2:</th>
                <td>
                    <input type="text" name="url2" id="url2" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Images URL3:</th>
                <td>
                    <input type="text" name="url3" id="url3" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Images URL4:</th>
                <td>
                    <input type="text" name="url4" id="url4" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Describe:</th>
                <td>
                    <textarea name="describe" rows="4" cols="45"></textarea>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <button type="submit" class="btn btn-secondary">Save</button>
                </td>
            </tr>
        </table>
    </form>
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
