<%-- 
    Document   : headerForAdmin
    Created on : Jul 6, 2022, 9:34:39 AM
    Author     : Ho Hieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manga Shop Admin</title>
    </head>
    <body>
        <header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow" style="padding: 15px 0;">
            <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="GetProductsForAdmin?PageNumber=1">Manga Shop Admin</a>
            <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>           
            <div class="navbar-nav">
                <div class="nav-item text-nowrap">
                    <a class="nav-link px-3" href="DataController?PageNumber=1" method="GET">Sign out</a>
                </div>
            </div>
        </header>
    </body>
</html>
