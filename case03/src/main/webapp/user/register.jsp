<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <!-- Google Fonts ================================================== -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Kalam:wght@700&family=Raleway:wght@400;700&display=swap"
          rel="stylesheet">
</head>
<body>
<div class="sidenav">
    <div class="register-main-text">
        <h2>With You <br> On Every Journey</h2>

    </div>
</div>
<div class="main">
    <div class="col-md-6 col-sm-12">
        <div class="register-form">
            <h1>REGISTER</h1>
            <hr>
            <form autocomplete="off" method="post" action="/user?action=register">
                <div class="form-group">
                    <label>Username</label>
                    <input type="text" class="form-control" name="username" id="username" placeholder="username">
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <input type="password" class="form-control" name="password" id="password" placeholder="********">
                </div>
                <div class="form-group">
                    <label>Email</label>
                    <input type="email" class="form-control" name="email" id="email" placeholder="username@gmail.com">
                </div>
                <div class="form-group">
                    <label>Phone</label>
                    <input type="text" class="form-control" name="phone" id="phone" placeholder="0982314526">
                </div>
<%--                <div class="form-group">--%>
<%--                    <label>Password</label>--%>
<%--                    <input type="password" class="form-control" name="ab" id="ab" placeholder="********">--%>
<%--                </div>--%>
                <input type="submit" class="btn btn-black" value="Register">
<%--                <a href="/users?action=login" class="btn btn-secondary">Login</a>--%>
            </form>
        </div>
        <div>
            <c:if test='${message != null}'>
                <span class="message">${message}</span>
            </c:if>
        </div>
    </div>
</div>
</body>
</html>
<style>
    .message {
        color: green;
    }

    h2{
        color: #222222;
    }

    .sidenav {
        height: 100%;
        background-image: linear-gradient(to bottom, rgba(255, 255, 255, 0.1), rgba(60, 205, 50, 0.1)),
        url("../images/background.jpg");
        background-color: #000;
        overflow-x: hidden;
        padding-top: 20px;
    }

    .main {
        padding: 0px 10px;
    }

    @media screen and (max-height: 450px) {
        .sidenav {
            padding-top: 15px;
        }
    }

    @media screen and (max-width: 450px) {
        .register-form {
            margin-top: 10%;
        }
    }

    @media screen and (min-width: 768px) {
        .main {
            margin-left: 40%;
        }

        .sidenav {
            width: 40%;
            position: fixed;
            z-index: 1;
            top: 0;
            left: 0;
        }

        .register-form {
            margin-top: 20%;
        }
    }


    .register-main-text {
        margin-top: 20%;
        padding: 60px;
        color: #fff;
    }

    .register-main-text h2 {
        font-weight: 300;
    }

    .btn-black {
        background-color: #000 !important;
        color: #fff;
    }
</style>