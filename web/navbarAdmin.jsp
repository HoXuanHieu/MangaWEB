<%-- 
    Document   : navbarAdmin
    Created on : Jul 6, 2022, 9:41:10 AM
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
        <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
            <div class="position-sticky pt-3">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="GetProductsForAdmin?PageNumber=1">
                            <span data-feather="home"></span>
                            Sản phẩm
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="getDataUsers">                         
                            Danh sách khách hàng
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="addProductPage.jsp">                            
                            Thêm sản phẩm
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="GetCheckedOutProducts">                         
                            Sản Phẩm đã được mua
                        </a>
                    </li>                  
                </ul>          
            </div>
        </nav>
    </body>
</html>
