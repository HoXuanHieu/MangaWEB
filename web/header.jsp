<%-- 
    Document   : header
    Created on : Jun 24, 2022, 9:52:19 AM
    Author     : Ho Hieu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manga Shop</title>
        <link href="assets/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/navbar-static/">
        <link href="css/style.css" rel="stylesheet">
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
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #d4d3ce;">
            <div class="container px-4 px-lg-5">
                <c:if test="${not empty Name}">
                    <a href="CountCart?PageNumber=1" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                        <img class="img-fluid" width="50px" height="50px" 
                             src="images/205-2054919_manga-logo-final-recovered-1-manga-entertainment-logo.png" alt="">
                    </a> 
                </c:if>
                <c:if test="${empty Name}">
                    <a href="DataController?PageNumber=1" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                        <img class="img-fluid" width="50px" height="50px" 
                             src="images/205-2054919_manga-logo-final-recovered-1-manga-entertainment-logo.png" alt="">
                    </a> 
                </c:if>
                <c:if  test="${not empty Name}"> 
                    <a class="navbar-brand" href="CountCart?PageNumber=1" style="margin-left: 10px">Manga Shop</a>
                </c:if>
                <c:if  test="${empty Name}"> 
                    <a class="navbar-brand" href="DataController?PageNumber=1" style="margin-left: 10px">Manga Shop</a>
                </c:if>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">

                        <!--                        <li class="nav-item"><a class="nav-link" href="#!">About</a></li>-->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Danh Mục</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">                               
                                <li><a class="dropdown-item" href="SearchForGenre?genre=manga">Manga</a></li>
                                <!--                                <li><hr class="dropdown-divider" /></li>-->
                                <li><a class="dropdown-item" href="SearchForGenre?genre=Light Novel">Light Novel</a></li>
                                <li><a class="dropdown-item" href="SearchForGenre?genre=Foreign Novel">Truyện nước ngoài</a></li>
                                <li><a class="dropdown-item" href="SearchForGenre?genre=Domestic book">Sách trong nước</a></li>      
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Thể Loại</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">                               
                                <li><a class="dropdown-item" href="SearchForCategory?category=Hành động">Hành động</a></li>
                                <!--                                <li><hr class="dropdown-divider" /></li>-->
                                <li><a class="dropdown-item" href="SearchForCategory?category=Hài hước">Hài hước</a></li>
                                <li><a class="dropdown-item" href="SearchForCategory?category=Tình cảm">Tình cảm</a></li>
                                <li><a class="dropdown-item" href="SearchForCategory?category=Truyện Việt">Truyện Việt</a></li>
                                <li><a class="dropdown-item" href="SearchForCategory?category=Viễn tưởng">Viễn tưởng</a></li>      
                                <li><a class="dropdown-item" href="SearchForCategory?category=Tâm lý">Tâm lý</a></li>      
                                <li><a class="dropdown-item" href="SearchForCategory?category=Phiêu lưu">Phiêu lưu</a></li>      
                            </ul>
                        </li>
                    </ul>

                    <c:if test="${not empty Name}">
                        <form class="d-flex" action="CartController?userId=${userId}">
                            <button class="btn btn-outline-dark" type="submit">
                                <i class="bi-cart-fill me-1"></i>
                                ${Name}
                                <span class="badge bg-dark text-white ms-1 rounded-pill">${cartSize}</span>
                            </button>  
                        </form>
                    </c:if>
                    <c:if test="${empty Name}">
                        <form class="d-flex" action="Login">
                            <button class="btn btn-outline-dark" type="submit">
                                <i class="bi-cart-fill me-1"></i>
                                Login
                            
                            </button>  
                        </form>
                    </c:if>
                    
                    <c:if test="${not empty Name}">
                        <form action="Logout" method="GET">
                            <input type="submit" style="margin-left: 10px;" class="btn btn-warning" value="LogOut">
                        </form>
                    </c:if>
                    <c:if test="${ empty Name}">
                        <form action="" method="GET">
                            <input type="submit" style="margin-left: 10px;" class="btn btn-warning" value="LogOut">
                        </form>
                    </c:if>
                    <!--<button style="margin-left: 10px;" type="button" class="btn btn-warning"><a class="linkDeco" href="Logout" >LogOut</a></button>-->
                </div>
            </div>
        </nav>
        <script src="assets/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
