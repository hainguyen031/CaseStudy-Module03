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
            <a class="navbar-brand" href="index.html"><img src="images/logo.png" alt="logo"></a>
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
                        <button type="button" class="btn btn-outline-primary nav-button mx-3"
                                onclick="window.location.href = '/user?action=register';"> Sign in
                        </button>
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

<!-- search section start  -->
<section id="search">
    <div class="container search-block p-5">

        <form class="row" method="post" action="/customer?action=searchCar">
            <div class="col-12 col-md-6 col-lg-3 mt-4 mt-lg-0">
                <label for="vehicle" class="label-style text-capitalize form-label">Car type</label>
                <div class="input-group date ">
                    <%--                                        <input type="text" class="form-control p-3 " id="vehicle" placeholder="Select Car Group"/>--%>
                    <%--                                        <span class="search-icon-position position-absolute p-3 ">--%>
                    <%--                                  <iconify-icon class="search-icons" icon="solar:bus-outline"></iconify-icon>--%>
                    <%--                                </span>--%>

                    <select class="form-select" id="vehicle" name="carType">
                        <option value="4">4 seats</option>
                        <option value="7">7 seats</option>
                    </select>
                </div>
            </div>
            <div class="col-12 col-md-6 col-lg-3 mt-4 mt-lg-0">
                <label for="location" class="label-style text-capitalize form-label">Picking up location</label>
                <div class="input-group date">
                    <%--                                        <input type="text" class="form-control p-3 position-relative" id="location"--%>
                    <%--                                               placeholder="Airport or anywhere"/>--%>
                    <%--                                        <span class="search-icon-position position-absolute p-3 ">--%>
                    <%--                                  <iconify-icon class="search-icons" icon="solar:map-arrow-square-outline"></iconify-icon>--%>
                    <%--                                </span>--%>
                    <select class="form-select" id="location" name="carLocation">
                        <option value="Ha Noi">Ha Noi</option>
                        <option value="Da Nang">Da Nang</option>
                        <option value="Ho Chi Minh">Ho Chi Minh</option>
                    </select>

                </div>
            </div>

            <div class="col-12 col-md-6 col-lg-3 mt-4 mt-lg-0">
                <label for="pick-up-date" class="label-style text-capitalize form-label">Picking up date</label>
                <div class="input-group date" id="datepicker1">
                    <input type="text" class="form-control p-3" id="pick-up-date" name="pick-up-date" required/>
                    <span class="input-group-append">
                        <span class="search-icon-position position-absolute p-3">
                        <iconify-icon class="search-icons" icon="solar:calendar-broken"></iconify-icon>
                        </span>
                    </span>
                </div>
            </div>

            <div class="col-12 col-md-6 col-lg-3 mt-4 mt-lg-0">
                <label for="return-date" class="label-style text-capitalize form-label">Returning date</label>
                <div class="input-group date" id="datepicker2">
                    <input type="text" class="form-control p-3" id="return-date" name="return-date" required/>

                    <%--                    <form>--%>
                    <%--                        <div class="row form-group">--%>
                    <%--                            <label for="date" class="col-sm-1 col-form-label">Date</label>--%>
                    <%--                            <div class="col-sm-4">--%>
                    <%--                                <div class="input-group date" id="datepicker">--%>
                    <%--                                    <input type="text" class="form-control">--%>
                    <%--                                    <span class="input-group-append">--%>
                    <%--                            <span class="input-group-text bg-white d-block">--%>
                    <%--                                <i class="fa fa-calendar"></i>--%>
                    <%--                            </span>--%>
                    <%--                        </span>--%>
                    <%--                                </div>--%>
                    <%--                            </div>--%>
                    <%--                        </div>--%>
                    <%--                    </form>--%>

                    <span class="input-group-append">
              <span class="search-icon-position position-absolute p-3">
                <iconify-icon class="search-icons" icon="solar:calendar-broken"></iconify-icon>
              </span>
            </span>

                </div>
            </div>
            <div class="d-grid gap-2 mt-4">
                <button class="btn btn-primary " type="submit">Find your car</button>
            </div>
        </form>

<%--        <div class="d-grid gap-2 mt-4">--%>
<%--            <button class="btn btn-primary " type="submit">Find your car</button>--%>
<%--        </div>--%>
    </div>
</section>

<!-- rental section start  -->
<section id="rental" class="position-relative">
    <div class="container my-5 py-5">
        <h2 class=" text-center my-5">cars for <span class="text-primary"> rental </span></h2>

        <div class="swiper-button-next rental-swiper-next  rental-arrow position-absolute"></div>
        <div class="swiper-button-prev rental-swiper-prev rental-arrow position-absolute"></div>

        <div class="swiper rental-swiper mb-5">
            <div class="swiper-wrapper">

                <div class="swiper-slide">
                    <div class="card">
                        <img src="https://n1-pstg.mioto.vn/cho_thue_xe_o_to_tu_lai_thue_xe_du_lich_hochiminh/vinfast_lux_sa_2.0_2019/p/g/2023/06/03/17/6ZB7qKbuqSNhh7NKTY_sRQ.jpg"
                             class="card-img-top" alt="...">
                        <div class="card-body p-4">
                            <h4 class="card-title">BMW x3</h4>
                            <div class="card-text ">
                                <ul class="d-flex list-unstyled">
                                    <li class="rental-list">
                                        <p>Sports</p>
                                    </li>
                                    <li class="rental-list"><img src="images/dot.png" class="px-3" alt=""></li>
                                    <li class="rental-list"> Auto</li>
                                    <li class="rental-list"><img src="images/dot.png" class="px-3" alt=""></li>
                                    <li class="rental-list"> 4 Passengers</li>
                                    <li class="rental-list"><img src="images/dot.png" class="px-3" alt=""></li>
                                    <li class="rental-list"> Diesel</li>
                                </ul>
                            </div>
                            <hr>
                            <div class="d-flex justify-content-between">
                                <h3 class="pt-2">$369 <span class="rental-price">/day</span></h3>
                                <button class="btn btn-primary">rent now</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="card">
                        <img src="https://n1-pstg.mioto.vn/cho_thue_xe_o_to_tu_lai_thue_xe_du_lich_hochiminh/vinfast_lux_sa_2.0_2019/p/g/2023/06/03/17/P4DlLFet3dzgj7Tg2XI4wg.jpg"
                             class="card-img-top" alt="...">
                        <div class="card-body p-4">
                            <h4 class="card-title">BMW M2</h4>
                            <div class="card-text ">
                                <ul class="d-flex list-unstyled">
                                    <li class="rental-list">
                                        <p>Sports</p>
                                    </li>
                                    <li class="rental-list"><img src="images/dot.png" class="px-3" alt=""></li>
                                    <li class="rental-list"> Auto</li>
                                    <li class="rental-list"><img src="images/dot.png" class="px-3" alt=""></li>
                                    <li class="rental-list"> 4 Passengers</li>
                                    <li class="rental-list"><img src="images/dot.png" class="px-3" alt=""></li>
                                    <li class="rental-list"> Diesel</li>
                                </ul>
                            </div>
                            <hr>
                            <div class="d-flex justify-content-between">
                                <h3 class="pt-2">$369 <span class="rental-price">/day</span></h3>
                                <button class="btn btn-primary">rent now</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="card">
                        <img src="https://n1-pstg.mioto.vn/cho_thue_xe_o_to_tu_lai_thue_xe_du_lich_hochiminh/vinfast_lux_sa_2.0_2019/p/g/2023/06/03/17/vNkXmukHLnHhNCkUYwe1cA.jpg"
                             class="card-img-top" alt="...">
                        <div class="card-body p-4">
                            <h4 class="card-title">Ford explorer</h4>
                            <div class="card-text ">
                                <ul class="d-flex list-unstyled">
                                    <li class="rental-list">
                                        <p>Sports</p>
                                    </li>
                                    <li class="rental-list"><img src="images/dot.png" class="px-3" alt=""></li>
                                    <li class="rental-list"> Auto</li>
                                    <li class="rental-list"><img src="images/dot.png" class="px-3" alt=""></li>
                                    <li class="rental-list"> 4 Passengers</li>
                                    <li class="rental-list"><img src="images/dot.png" class="px-3" alt=""></li>
                                    <li class="rental-list"> Diesel</li>
                                </ul>
                            </div>
                            <hr>
                            <div class="d-flex justify-content-between">
                                <h3 class="pt-2">$369 <span class="rental-price">/day</span></h3>
                                <button class="btn btn-primary">rent now</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="card">
                        <img src="https://n1-pstg.mioto.vn/cho_thue_xe_o_to_tu_lai_thue_xe_du_lich_hochiminh/vinfast_lux_sa_2.0_2019/p/g/2023/06/03/17/yC5StV7uF09BMKWoKp6UXA.jpg"
                             class="card-img-top" alt="...">
                        <div class="card-body p-4">
                            <h4 class="card-title">BMW x3</h4>
                            <div class="card-text ">
                                <ul class="d-flex list-unstyled">
                                    <li class="rental-list">
                                        <p>Sports</p>
                                    </li>
                                    <li class="rental-list"><img src="images/dot.png" class="px-3" alt=""></li>
                                    <li class="rental-list"> Auto</li>
                                    <li class="rental-list"><img src="images/dot.png" class="px-3" alt=""></li>
                                    <li class="rental-list"> 4 Passengers</li>
                                    <li class="rental-list"><img src="images/dot.png" class="px-3" alt=""></li>
                                    <li class="rental-list"> Diesel</li>
                                </ul>
                            </div>
                            <hr>
                            <div class="d-flex justify-content-between">
                                <h3 class="pt-2">$369 <span class="rental-price">/day</span></h3>
                                <button class="btn btn-primary">rent now</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="card">
                        <img src="https://n1-pstg.mioto.vn/cho_thue_xe_o_to_tu_lai_thue_xe_du_lich_hochiminh/vinfast_lux_sa_2.0_2019/p/g/2023/06/03/17/vNkXmukHLnHhNCkUYwe1cA.jpg"
                             class="card-img-top" alt="...">
                        <div class="card-body p-4">
                            <h4 class="card-title">BMW M2</h4>
                            <div class="card-text ">
                                <ul class="d-flex list-unstyled">
                                    <li class="rental-list">
                                        <p>Sports</p>
                                    </li>
                                    <li class="rental-list"><img src="images/dot.png" class="px-3" alt=""></li>
                                    <li class="rental-list"> Auto</li>
                                    <li class="rental-list"><img src="images/dot.png" class="px-3" alt=""></li>
                                    <li class="rental-list"> 4 Passengers</li>
                                    <li class="rental-list"><img src="images/dot.png" class="px-3" alt=""></li>
                                    <li class="rental-list"> Diesel</li>
                                </ul>
                            </div>
                            <hr>
                            <div class="d-flex justify-content-between">
                                <h3 class="pt-2">$369 <span class="rental-price">/day</span></h3>
                                <button class="btn btn-primary">rent now</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="card">
                        <img src="https://n1-pstg.mioto.vn/cho_thue_xe_o_to_tu_lai_thue_xe_du_lich_hochiminh/vinfast_lux_sa_2.0_2019/p/g/2023/06/03/17/P4DlLFet3dzgj7Tg2XI4wg.jpg"
                             class="card-img-top" alt="...">
                        <div class="card-body p-4">
                            <h4 class="card-title">Ford explorer</h4>
                            <div class="card-text ">
                                <ul class="d-flex list-unstyled">
                                    <li class="rental-list">
                                        <p>Sports</p>
                                    </li>
                                    <li class="rental-list"><img src="images/dot.png" class="px-3" alt=""></li>
                                    <li class="rental-list"> Auto</li>
                                    <li class="rental-list"><img src="images/dot.png" class="px-3" alt=""></li>
                                    <li class="rental-list"> 4 Passengers</li>
                                    <li class="rental-list"><img src="images/dot.png" class="px-3" alt=""></li>
                                    <li class="rental-list"> Diesel</li>
                                </ul>
                            </div>
                            <hr>
                            <div class="d-flex justify-content-between">
                                <h3 class="pt-2">$369 <span class="rental-price">/day</span></h3>
                                <button class="btn btn-primary">rent now</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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


<script>
    $(document).ready(function () {
        $('#pick-up-date').datepicker1({
            format: 'yyyy-mm-dd',
            autoclose: true,
            todayHighlight: true
        });
    });
</script>
</body>
</html>