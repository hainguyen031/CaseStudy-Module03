<!DOCTYPE html>
<html lang="en">

<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<style>
  .mySlides3 {display:none; width:80%; margin: auto; border-radius: 5%;}
  .display-container{position:relative}

  /*---Css Nút qua lại---*/
  .button-left{left:10%; font-size:20px}
  .button-right{right:10%; font-size:20px }
  .image-button{border:none;display:inline-block;padding:10px;height:50px;vertical-align:middle;overflow:hidden; color:#fff;background:#000;position:absolute;top:calc(50% - 25px); opacity:0.5;}
  .image-button:hover{color:#000;background:#ccc;}

  /*---Css Chấm tròn---*/
  .badge {text-align:center; margin-bottom:16px; margin-left: 10% ;font-size:20px;position:absolute;bottom:0;}
  .badge-white{color:#000!important;background-color:#fff!important}
  .image-badge {display:inline-block;border-radius:50%;height:14px;width:14px; border:1px solid #ccc;}
  .image-badge:hover{background:#fff;}

</style>
<body>

<a href="#" data-bs-toggle="modal" data-bs-target="#carDetailModal">
  CARRRR
</a>

<!-- Modal -->
<div class="modal fade" id="carDetailModal" tabindex="-1"
     aria-labelledby="carDetailModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-fullscreen modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="carDetailModalLabel" style="margin-left: 10%;">
          CAR DETAILS
        </h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <!-- Ảnh xe -->
        <div class="display-container">

          <img class="mySlides3" src="https://canxem.com/img/1.jpg">
          <img class="mySlides3" src="https://canxem.com/img/2.jpg">
          <img class="mySlides3" src="https://canxem.com/img/3.jpg">
          <img class="mySlides3" src="https://canxem.com/img/2.jpg">

          <button class="image-button button-left" onclick="plusDivs(-1)">&#10094;</button>
          <button class="image-button button-right" onclick="plusDivs(1)">&#10095;</button>

          <div class="badge" style="width:80%">

            <span class="image-badge" onclick="currentDiv(1)"></span>
            <span class="image-badge" onclick="currentDiv(2)"></span>
            <span class="image-badge" onclick="currentDiv(3)"></span>
            <span class="image-badge" onclick="currentDiv(4)"></span>
          </div>
        </div>
        <!-- Nội dung chi tiết xe -->



        <div class="container mt-3" style="margin-left: 10%; margin-right: 10%;">
          <div class="row">
            <div class="col-sm-8">
              <div class="main-content">
                <h2>POSCHER PANAMERA</h2>
                <hr>
                <h4>Characteristic</h4>
                <div class="row">
                  <div class="col-3">
                    <p style="text-align: center;">
                      <svg width="32" height="32" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M10.914 23.3289C10.9148 23.3284 10.9156 23.3279 10.9163 23.3274C10.9155 23.3279 10.9148 23.3284 10.914 23.3289ZM10.914 23.3289C10.914 23.3289 10.914 23.3289 10.914 23.3289L11.3128 23.9114M10.914 23.3289L11.3128 23.9114M11.3128 23.9114L10.9807 23.2882L20.6697 23.9458C20.6682 23.9484 20.6656 23.9496 20.6631 23.9479C20.655 23.9424 20.6343 23.9284 20.6014 23.9074C20.6014 23.9073 20.6014 23.9073 20.6013 23.9073C20.5141 23.8516 20.3413 23.7468 20.0921 23.6208C20.0919 23.6207 20.0918 23.6206 20.0917 23.6206C19.3397 23.2404 17.8926 22.6674 16.0003 22.6674C14.1715 22.6674 12.7584 23.2026 11.9869 23.5817L11.9929 23.5929M11.3128 23.9114L11.331 23.9456C11.3324 23.9483 11.3352 23.9495 11.3377 23.9478C11.3444 23.9432 11.3592 23.9332 11.3821 23.9184L11.9929 23.5929L11.9929 23.5929M11.9929 23.5929C11.9909 23.5892 11.9889 23.5855 11.9868 23.5818C11.6767 23.7342 11.4702 23.8614 11.3821 23.9184L11.9929 23.5929ZM10.6691 24.2983L10.6691 24.2983C10.7406 24.4324 10.8728 24.5792 11.0793 24.6538C11.3072 24.7361 11.5609 24.7039 11.7614 24.5667L11.7614 24.5667C11.7978 24.5418 13.4597 23.4174 16.0003 23.4174C18.5426 23.4174 20.205 24.5432 20.2393 24.5667L20.2393 24.5667C20.4389 24.7034 20.6938 24.7372 20.9245 24.6528C21.1293 24.5779 21.2557 24.4338 21.3233 24.3136L22.4886 22.2427L24.3242 23.0447L21.6934 28.584H9.99882L7.65051 23.0635L9.57427 22.2435L10.6691 24.2983ZM24.4348 22.8117L24.4345 22.8124L24.4348 22.8117Z" stroke="#5FCF86" stroke-width="1.5"></path><path d="M12.75 4.66675C12.75 3.97639 13.3096 3.41675 14 3.41675H18C18.6904 3.41675 19.25 3.97639 19.25 4.66675V7.00008C19.25 7.13815 19.1381 7.25008 19 7.25008H13C12.8619 7.25008 12.75 7.13815 12.75 7.00008V4.66675Z" stroke="#5FCF86" stroke-width="1.5"></path><path d="M9.33398 22.6668L9.90564 11.2336C9.95887 10.1692 10.8374 9.3335 11.9031 9.3335H20.0982C21.1639 9.3335 22.0424 10.1692 22.0957 11.2336L22.6673 22.6668" stroke="#5FCF86" stroke-width="1.5"></path><path d="M14.667 7.35815V9.8901" stroke="#5FCF86" stroke-width="1.5"></path><path d="M17.334 7.35815V9.8901" stroke="#5FCF86" stroke-width="1.5"></path></svg>
                      Number of seats
                    </p>
                    <p style="text-align: center;">4 seats</p>
                  </div>
                  <div class="col-3">
                    <p style="text-align: center;">
                      <svg width="32" height="32" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M25.9163 7.99992C25.9163 9.05846 25.0582 9.91659 23.9997 9.91659C22.9411 9.91659 22.083 9.05846 22.083 7.99992C22.083 6.94137 22.9411 6.08325 23.9997 6.08325C25.0582 6.08325 25.9163 6.94137 25.9163 7.99992Z" stroke="#5FCF86" stroke-width="1.5"></path><circle cx="23.9997" cy="23.9999" r="1.91667" stroke="#5FCF86" stroke-width="1.5"></circle><path d="M17.9163 7.99992C17.9163 9.05846 17.0582 9.91659 15.9997 9.91659C14.9411 9.91659 14.083 9.05846 14.083 7.99992C14.083 6.94137 14.9411 6.08325 15.9997 6.08325C17.0582 6.08325 17.9163 6.94137 17.9163 7.99992Z" stroke="#5FCF86" stroke-width="1.5"></path><path d="M17.9163 23.9999C17.9163 25.0585 17.0582 25.9166 15.9997 25.9166C14.9411 25.9166 14.083 25.0585 14.083 23.9999C14.083 22.9414 14.9411 22.0833 15.9997 22.0833C17.0582 22.0833 17.9163 22.9414 17.9163 23.9999Z" stroke="#5FCF86" stroke-width="1.5"></path><circle cx="7.99967" cy="7.99992" r="1.91667" stroke="#5FCF86" stroke-width="1.5"></circle><path d="M10.1025 26.6666V21.3333H7.99837C7.59559 21.3333 7.25184 21.4053 6.96712 21.5494C6.68066 21.6918 6.46278 21.894 6.31348 22.1562C6.16244 22.4166 6.08691 22.723 6.08691 23.0754C6.08691 23.4296 6.1633 23.7343 6.31608 23.9895C6.46886 24.243 6.69021 24.4374 6.98014 24.5728C7.26834 24.7083 7.6173 24.776 8.02702 24.776H9.43587V23.8697H8.20931C7.99403 23.8697 7.81521 23.8402 7.67285 23.7812C7.53049 23.7221 7.42459 23.6336 7.35514 23.5155C7.28396 23.3975 7.24837 23.2508 7.24837 23.0754C7.24837 22.8984 7.28396 22.7491 7.35514 22.6275C7.42459 22.506 7.53136 22.414 7.67546 22.3515C7.81782 22.2872 7.9975 22.2551 8.21452 22.2551H8.97493V26.6666H10.1025ZM7.22233 24.2395L5.89681 26.6666H7.1416L8.43848 24.2395H7.22233Z" fill="#5FCF86"></path><path d="M24 10.6665V15.9998M24 21.3332V15.9998M16 10.6665V21.3332M8 10.6665V15.4998C8 15.776 8.22386 15.9998 8.5 15.9998H24" stroke="#5FCF86" stroke-width="1.5" stroke-linecap="round"></path></svg>
                      Transmission
                    </p>
                    <p style="text-align: center;">Auto</p>
                  </div>
                  <div class="col-3">
                    <p style="text-align: center;">
                      <svg width="32" height="32" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M24.3337 27.2499H7.66699C7.52892 27.2499 7.41699 27.138 7.41699 26.9999V12.4599C7.41699 12.3869 7.44888 12.3175 7.5043 12.27L14.652 6.14344L14.1639 5.574L14.652 6.14344C14.6973 6.1046 14.755 6.08325 14.8147 6.08325H24.3337C24.4717 6.08325 24.5837 6.19518 24.5837 6.33325V26.9999C24.5837 27.138 24.4717 27.2499 24.3337 27.2499Z" stroke="#5FCF86" stroke-width="1.5" stroke-linecap="round"></path><path d="M12.0001 5.33325L7.42285 9.46712" stroke="#5FCF86" stroke-width="1.5" stroke-linecap="round"></path><path d="M17.888 19.5212L16.7708 15.93C16.5378 15.1812 15.4785 15.1798 15.2436 15.928L14.1172 19.5164C13.7178 20.7889 14.6682 22.0833 16.0019 22.0833C17.3335 22.0833 18.2836 20.7927 17.888 19.5212Z" stroke="#5FCF86" stroke-width="1.5" stroke-linecap="round"></path><path d="M23.2503 3.66675V5.66675C23.2503 5.80482 23.1384 5.91675 23.0003 5.91675H14.667C14.5827 5.91675 14.5365 5.8916 14.5072 5.86702C14.4721 5.83755 14.44 5.78953 14.4245 5.72738C14.4089 5.66524 14.4147 5.60775 14.4318 5.56523C14.4461 5.52975 14.4749 5.48584 14.5493 5.44616L18.2993 3.44616C18.3356 3.42685 18.376 3.41675 18.417 3.41675H23.0003C23.1384 3.41675 23.2503 3.52868 23.2503 3.66675Z" stroke="#5FCF86" stroke-width="1.5" stroke-linecap="round"></path></svg>
                      Fuel
                    </p>
                    <p style="text-align: center;">Gasoline</p>
                  </div>
                  <div class="col-3">
                    <p style="text-align: center;">
                      <svg width="32" height="32" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M7.41667 24V23.25H6.66667H4.75V18.0833H6.66667H7.41667V17.3333V15.4167H9.33333H9.64399L9.86366 15.197L12.3107 12.75H24.5833V23.25H22.6667H22.356L22.1363 23.4697L19.6893 25.9167H7.41667V24Z" stroke="#5FCF86" stroke-width="1.5" stroke-linecap="round"></path><path d="M24 21.3333H28" stroke="#5FCF86" stroke-width="1.5"></path><path d="M24 18.6665H28" stroke="#5FCF86" stroke-width="1.5"></path><path d="M15.417 7.33325C15.417 6.6429 15.9766 6.08325 16.667 6.08325H20.667C21.3573 6.08325 21.917 6.6429 21.917 7.33325V8.58325H15.417V7.33325Z" stroke="#5FCF86" stroke-width="1.5"></path><path d="M17.333 9.33325V11.9999M19.9997 9.33325V11.9999" stroke="#5FCF86" stroke-width="1.5"></path><path d="M4.66699 26.01L4.66699 15.3308" stroke="#5FCF86" stroke-width="1.5" stroke-linecap="round"></path><path d="M27.3291 23.3384L27.3291 16.6704" stroke="#5FCF86" stroke-width="1.5" stroke-linecap="round"></path></svg>
                      Fuel consumption
                    </p>
                    <p style="text-align: center;">8 liters/100km</p>
                  </div>
                </div>

                <hr>
                <h4>Describe</h4>
                <p>Xe dep</p>
                <hr>

                <h4>Car rental documents</h4>
                <p><img src="https://n1-cstg.mioto.vn/v4/p/m/icons/papers/cmnd.png" alt="cccd" style="height: 24px; width: 24px;"> Citizen identification</p>
                <p><img src="https://n1-cstg.mioto.vn/v4/p/m/icons/papers/cmnd.png" alt="gplx" style="height: 24px; width: 24px;"> Driving license</p>

                <hr>
                <h4>Collateral</h4>
                <p>15 million (cash/transfer to the car owner when receiving the car) or Motorcycle (with original tie) worth 15 million</p>

                <hr>
                <h4>Rules</h4>
                <p>Other rule:</p>
                <p>◦ Use the vehicle for the right purpose.</p>
                <p>◦ Do not use the rental car for illegal or illegal purposes.</p>
                <p>◦ Do not use rental cars for pledge or mortgage.</p>
                <p>◦ No smoking, chewing gum, or littering in the vehicle.</p>
                <p>◦ Do not carry flammable and explosive national goods.</p>
                <p>◦ Do not carry fruit or food with strong odors in the vehicle.</p>
                <p>◦ When returning the car, if the car is dirty or has an odor in the car, please clean the car or send a surcharge for car cleaning.</p>
                <p>Thank you very much, wish you have a great trip!</p>

              </div>

            </div>
            <div class="col-sm-4">
              <!--Nested rows within a column-->
              <div class="row" style="margin-left: 5%; margin-top: 10%; margin-right: 10%;">
                <div class="col-12">
                  <div class="sidebar-content">
                    <h1>Rental Price</h1>
                    <h4>10TR VND/Day</h4>
                  </div>
                  <hr>
                  <p></p>
                  <div>
                    <p><b style="color: rgb(255, 134, 47);">Additional fees may apply</b></p>
                    <div class="row">
                      <div class="col-6"><b>Fee over limit</b></div>
                      <div class="col-6">5 000đ/km</div>
                    </div>
                    <p style="text-align: justify;">Surcharge is incurred if the travel route exceeds 300km when renting a car for 1 day</p>

                    <div class="row">
                      <div class="col-6"><b>Overtime fee</b></div>
                      <div class="col-6">100 000đ/km</div>
                    </div>
                    <p style="text-align: justify;">A surcharge will be incurred if the vehicle is returned late. In case you are more than 3 hours late, there will be an additional fee for 1 day of rental</p>

                    <div class="row">
                      <div class="col-6"><b>Cleaning fee</b></div>
                      <div class="col-6">100 000đ</div>
                    </div>
                    <p style="text-align: justify;">An additional fee is incurred when the returned vehicle is not hygienic (many stains, mud, mud, etc.)</p>

                    <div class="row">
                      <div class="col-6"><b>Deodorization fee</b></div>
                      <div class="col-6">200 000đ</div>
                    </div>
                    <p style="text-align: justify;">An additional surcharge will be incurred when the returned vehicle has an unpleasant odor (smells of tobacco, strong food odors, etc.)</p>

                  </div>
                </div>
              </div>


            </div>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
          Close
        </button>
      </div>
    </div>
  </div>
</div>

<script>
  var slideIndex = 1;
  showDivs(slideIndex);

  function plusDivs(n) {
    showDivs(slideIndex += n);
  }

  function currentDiv(n) {
    showDivs(slideIndex = n);
  }

  function showDivs(n) {
    var i;
    var x = document.getElementsByClassName("mySlides3");
    var dots = document.getElementsByClassName("image-badge");
    if (n > x.length) {slideIndex = 1}
    if (n < 1) {slideIndex = x.length}
    for (i = 0; i < x.length; i++) {
      x[i].style.display = "none";
    }
    for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" badge-white", "");
    }
    x[slideIndex-1].style.display = "block";
    dots[slideIndex-1].className += " badge-white";
  }
</script>
</body>

</html>