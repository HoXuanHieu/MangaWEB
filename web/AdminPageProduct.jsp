<%-- 
    Document   : AdminPage
    Created on : Jul 2, 2022, 10:15:24 PM
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
                <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                    <h2 style="margin: 20px 10px 0 10px">All Products: ${totalProducts}</h2>
                    <c:forEach var="i" begin="0" step="1" end="3">
                        <div class="gx-4 gx-lg-5 row-cols-md-3 row-cols-xl-4 container d-flex justify-content-center">
                            <c:forEach var="j" begin="0" step="1" end="2">
                                <c:if test="${3*i+j == maxItems}">
                                    <c:set var="i" value="3"/>
                                    <c:set var="j" value="4"/>
                                </c:if>
                                <c:if test="${3*i+j < maxItems}">
                                    <div class="col" style="margin: 50px 30px 0 0">
                                        <div class="card h-100" shadow p-3 mb-5 bg-body rounded style="width: 18rem;">
                                            <a href="GetBookIdForUpdate?Id=${List.get(3*i+j).getBookId()}&PageNumber=${PageNumber}"><img class="card-img-top" src="${List.get(3*i+j).getImgUrl()}" alt=""/></a>
                                            <div class="card-body">
                                                <h6 class="card-title text-center">
                                                    <a class="linkDeco" href="GetBookIdForUpdate?Id=${List.get(3*i+j).getBookId()}">${List.get(3*i+j).getTitle()}</a>
                                                </h6>                 
                                                    <div>
                                                        <p class="text-center">giá sách: ${List.get(3*i+j).getPrice()} đ</p>
                                                        <p class="text-center">Số lượng: ${List.get(3*i+j).getNumberOfBook()}</p>
                                                    </div>                                              
                                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent row">                        
                                                    <div class="col-md-6 text-center"><a class="btn btn-outline-dark mt-auto" href="GetBookIdForUpdate?Id=${List.get(3*i+j).getBookId()}">update</a></div>
                                                     <div class="col-md-6 text-center"><a class="btn btn-outline-dark mt-auto" href="#">delete</a></div>
                                                     <!--deleteProducts?Id${List.get(3*i+j).getBookId()}..-->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>                 
                            </c:forEach>
                        </div>
                    </c:forEach>
                    <div class="text-center"  style="margin: 50px 0 " >
                        page:                       
                        <c:forEach var="j" begin="1" step="1" end="${TotalPage}">                
                            <a class="linkDeco" href="GetProductsForAdmin?PageNumber=${j}" >${j}  </a>
                        </c:forEach>
                    </div>
                </main>
            </div>
        </div>
    </body>

</html>
