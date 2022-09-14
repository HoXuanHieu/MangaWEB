<%-- 
    Document   : ProductsCheckedOut
    Created on : Jul 14, 2022, 9:33:07 PM
    Author     : Ho Hieu
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manga Shop Admin</title>
        <link rel="stylesheet" href="css/dashboard.css"/>
        <link href="assets/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/style.css"/>
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
        <jsp:include page="headerForAdmin.jsp"/>
        <div class="container-fluid">
            <div class="row">
                <jsp:include page="navbarAdmin.jsp"/>
                <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4" style="background-color: white; padding:30px 0;">
                    <!--e7717d-->
                    <div class="row">
                        <div class="float-end">  

                            <a class="dropdown-toggle linkDeco" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Sắp sếp theo:</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">                               
                                <li><a class="dropdown-item" href="GetCheckedOutProducts?sortBy=num">Số lượng</a></li>
                                <li><a class="dropdown-item" href="GetCheckedOutProducts?sortBy=date">Ngày mua</a></li>  
                                <li><a class="dropdown-item" href="GetCheckedOutProducts?sortBy=bookId">Mã sách</a></li>     
                                <li><a class="dropdown-item" href="GetCheckedOutProducts?sortBy=UserId">Mã Khách hàng</a></li>     

                            </ul>                          
                        </div>
                    </div>
                    <div class="wrap-table100">
                        <div class="table-responsive">
                            <table class="table table-striped table-sm">
                                <thead>
                                    <tr>
                                        <th scope="col" class="text-center">Mã sách</th>
                                        <th scope="col">Tên Sách</th>
                                        <th scope="col" class="text-center">Mã khách hàng</th>
                                        <th scope="col" class="text-center">Số Lượng</th>
                                        <th scope="col">Ngày Mua</th>
                                        <th scope="col">Thành tiền</th>
                                        <th scope="col">địa chỉ</th>                                
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="i" begin="0" step="1" end="${ListCart.size()-1}">
                                        <tr>
                                            <td scope="col" class="text-center">${ListBook.get(i).getBookId()}</td>
                                            <td scope="col">${ListBook.get(i).getTitle()}</td>
                                            <td scope="col" class="text-center">${ListCart.get(i).getUserId()}</td>
                                            <td scope="col" class="text-center">${ListCart.get(i).getNum()}</td>
                                            <td scope="col">${ListCart.get(i).getDateBuy()}</td> 
                                            <td scope="col">${ListCart.get(i).getNum()*ListBook.get(i).getPrice()} đ</td> 
                                            <td scope="col">${ListCart.get(i).getAdress()}</td>
                                        </tr>
                                    </c:forEach>                        
                                </tbody>
                            </table>
                        </div>    
                    </div>
                </main>
            </div>
        </div>
        <script src="assets/dist/js/bootstrap.bundle.min.js"></script>

    </body>
</html>
