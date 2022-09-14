<%-- 
    Document   : RegisterPage
    Created on : Jun 25, 2022, 11:12:50 AM
    Author     : Ho Hieu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sign-in/">
        <link href="assets/dist/css/bootstrap.min.css" rel="stylesheet">

        <style>
            .bd-placeholder-img {
                font-size: 1.125rem;
                text-anchor: middle;
                -webkit-user-select: none;
                -moz-user-select: none;
                user-select: none;
            }

            @media (min-width: 768px) {
                .bd-placeholder-img-lg {
                    font-size: 3.5rem;
                }
            }
        </style>
        <link rel="stylesheet" href="css/register.css"/>
        <link rel="stylesheet" href="css/style.css"/>
    </head>
    <body class="text-center register-body">
        <main class="form-signin">
            <form action="Register" method="POST">
                <img class="mb-4" src="images/205-2054919_manga-logo-final-recovered-1-manga-entertainment-logo.png" alt="" width="60" height="60">
                <h1 class="h3 mb-3 fw-normal">Registration Form</h1>
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput" name="firstName" placeholder="abc" required lang="vi">
                    <label for="floatingInput">First Name</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput" name="lastName" placeholder="abc" required lang="vi">
                    <label for="floatingInput">Last Name</label>
                </div>
                <div class="form-floating">
                    <input type="email" class="form-control" id="floatingInput" name="email" placeholder="name@example.com" required>
                    <label for="floatingInput">Email address</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput" name="phone" pattern="(\+84|0)\d{9,10}" placeholder="abc" required>
                    <label for="floatingInput">Phone Number</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput" name="userName" placeholder="User name Error" required lang="vi">
                    <label for="floatingInput">User Name</label>
                </div>
                <div class="form-floating">
                    <input type="password" class="form-control" id="floatingPassword" name="password" placeholder="Password" required>
                    <label for="floatingPassword">Password</label>
                </div>
                <p></p>               
                <button class="w-100 btn btn-lg btn-primary" type="submit">Sign Up</button>   
                <p></p>
                <c:if test="${not empty message}">
                    <h6>Cám ơn bạn đã đăng ký, click vào <a href="LoginPage.jsp">đây</a> đề đăng nhập</h6>                   
                </c:if>
                 <c:if test="${not empty messageError}">
                    <h6 style="color: red">${messageError}</h6>                   
                </c:if>
            </form>   
        </main>
    </body>
    <!--   dung de hien thi cac thong bao trong input title="Username should only contain lowercase letters. e.g. john">-->
</html>
