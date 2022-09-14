<%-- 
    Document   : Test
    Created on : Jun 23, 2022, 8:40:47 PM
    Author     : Ho Hieu
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/headers/">
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


        <!-- Custom styles for this template -->
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body>  

    <header class="p-3 bg-black text-white">
    <div class="container">
      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
        <a href="DataController?PageNumber=1" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
          <img style="background-color: white; border-radius: 50%" class="img-fluid" width="60px" height="60px" 
                         src="images/205-2054919_manga-logo-final-recovered-1-manga-entertainment-logo.png" alt="">
        </a>

        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
          <li><a href="DataController?PageNumber=1" class="nav-link px-2 text-white">Manga Shop</a></li>
          <li><a href="#" class="nav-link px-2 text-white">Features</a></li>
          <li><a href="#" class="nav-link px-2 text-white">Pricing</a></li>
          <li><a href="#" class="nav-link px-2 text-white">FAQs</a></li>
          <li><a href="#" class="nav-link px-2 text-white">About</a></li>
        </ul>

        <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
          <input type="search" class="form-control form-control-dark" placeholder="Search..." aria-label="Search">
        </form>

        <div class="text-end">
          <button type="button" class="btn btn-outline-light me-2"><a class="linkDeco text-white" href="Logout" >${Name}</a></button>
          <button type="button" class="btn btn-warning"><a class="linkDeco" href="Logout" >LogOut</a></button>
        </div>
      </div>
    </div>
  </header>


    <script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
