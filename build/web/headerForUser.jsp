<%-- 
    Document   : headerForUser
    Created on : Jul 7, 2022, 10:09:56 PM
    Author     : Ho Hieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manga Shop</title>
        <link href="assets/dist/css/bootstrap.min.css" rel="stylesheet">

        <style>
            .navbar {
                margin-bottom: 20px;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light rounded" style="background-color: white" aria-label="Twelfth navbar example">
            <div class="container-fluid">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample08" aria-controls="navbarsExample08" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-md-center" id="navbarsExample10">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a href="CountCart?PageNumber=1" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                                <img class="img-fluid" width="40px" height="40px" 
                                     src="images/205-2054919_manga-logo-final-recovered-1-manga-entertainment-logo.png" alt="">
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="CountCart?PageNumber=1" style="margin-left: 10px">Manga Shop</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="HistoryBuyOfUser">History</a>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="dropdown10" data-bs-toggle="dropdown" aria-expanded="false"> ${Name}</a>
                            <ul class="dropdown-menu" aria-labelledby="dropdown10">
                                <!--                                <li><a class="dropdown-item" href="#"></a></li>
                                                                <li><a class="dropdown-item" href="#">Another action</a></li>-->
                                <li><a class="dropdown-item" href="Logout">logout</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <script src="assets/dist/js/bootstrap.bundle.min.js"></script>

    </body>
</html>
