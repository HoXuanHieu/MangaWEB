<%-- 
    Document   : LoginPage
    Created on : Jun 19, 2022, 9:10:03 PM
    Author     : Ho Hieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
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
        <link rel="stylesheet" href="css/signin.css"/>
    </head>
    <body class="text-center signin-body">
        <main class="form-signin">
            <form action="Login" method="POST">
                <a href="DataController?PageNumber=1">        
                    <img class="mb-4" src="images/205-2054919_manga-logo-final-recovered-1-manga-entertainment-logo.png" alt="" width="60" height="60">
                </a>
                <h1 class="h3 mb-3 fw-normal">Please sign in</h1>

                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput" name="userName" name="userName" placeholder="User name Error" lang="vi">
                    <label for="floatingInput">User Name</label>
                </div>
                <div class="form-floating">
                    <input type="password" class="form-control" id="floatingPassword" name="password" name="password" placeholder="Password">
                    <label for="floatingPassword">Password</label>
                </div>
                <p></p>               
                <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>
                <p></p>
                <c:if test="${not empty MessageError}">
                    <h6 style="color: red">${MessageError}</h6>                   
                </c:if>
                <p></p>
                <h6>Don't have account? click <a class='link' href="RegisterPage.jsp">here</a></h6>
            </form>
        </main>

    </body>
</html>
