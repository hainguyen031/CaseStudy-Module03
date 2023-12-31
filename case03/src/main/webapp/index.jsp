<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>GoCar - Car Rental with the Bests Prices</title>
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
<nav class="navbar navbar-expand-lg  navbar-light container-fluid py-3 position-fixed ">
    <div class="container">
        <a class="navbar-brand" href="#"><img src="images/logo.png" alt="logo"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
                aria-controls="offcanvasNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
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
                <h1 class="">Life is <span class="text-primary"> the trip </span></h1>
                <p class="hero-paragraph">Enjoy this trip with GoCar.</p>
            </div>
        </div>
    </div>
</section>

<div class="d-grid gap-2 mt-4">
    <button class="btn btn-primary" onclick="redirectToPage('/user?action=login')">Let's start find your car</button>
</div>

<footer class="d-flex flex-wrap justify-content-between align-items-center border-top"></footer>

<div class="container">
    <footer class="d-flex flex-wrap justify-content-between align-items-center py-2 pt-4">
        <div class="col-md-6 d-flex align-items-center">
            <p>© 2023 GoCar - All rights reserved</p>

        </div>
        <div class="col-md-6 d-flex align-items-center justify-content-end">
            <p class="">© 2023 Designed By:<a href="#" class="website-link"
                                              target="_blank"> <b><u>HaiNguyen</u></b></a></p>
        </div>

    </footer>
</div>
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


<script>
    function redirectToPage(url) {
        window.location.href = url;
    }
</script>
</body>
</html>