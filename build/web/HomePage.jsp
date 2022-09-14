<%-- 
    Document   : HomePage
    Created on : Jun 19, 2022, 9:09:37 PM
    Author     : Ho Hieu
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="Entity.Book"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="header.jsp"/>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css"/>
        <style>
            .headerText {
                background-color: rgb(0,0,0);
                background-color: rgba(0,0,0, 0.4);
                color: white;
                font-weight: bold;
                border: 3px solid #f1f1f1;
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                z-index: 2;
                width: 50%;
                padding: 70px 0;
                text-align: center;
            }
        </style>
    </head>
    <body>

        <header class="position-relative" style="margin: 5px 0">
            <div class="headerImg" ></div>
            <div class="headerText flex-column d-flex justify-content-center " style="border: none;">
                <h3 class="display-5 fw-bold position-absolute top-50 start-50 translate-middle">WELCOME TO MANGA SHOP</h3>
                <!--<p class="position-absolute top- start-50 translate-middle">New & Top Series, Boxed Sets & Gifts for Manga & Anime Fans</p>-->
            </div>
        </header>
        <div class="container" >
            <h1 style="font-weight: bold; color: #999896; margin-top: 30px; width: 90%">All Products</h1>
            <hr>
            <c:forEach var="i" begin="0" step="1" end="3">
                <div class="gx-4 gx-lg-5 row-cols-md-3 row-cols-xl-4 container d-flex justify-content-center">
                    <c:forEach var="j" begin="0" step="1" end="2">
                        <c:if test="${3*i+j == maxItems}">
                            <c:set var="i" value="3"/>
                            <c:set var="j" value="2"/>
                        </c:if>
                        <c:if test="${3*i+j < maxItems}">
                            <div class="col" style="margin: 50px 0 0 0">
                                <div class="card h-100" shadow p-3 mb-5 bg-body rounded style="width: 18rem;">
                                    <a href="BuyPage?Id=${List.get(3*i+j).getBookId()}&PageNumber=${PageNumber}"><img class="card-img-top" src="${List.get(3*i+j).getImgUrl()}" alt=""/></a>
                                    <div class="card-body">
                                        <h6 class="card-title text-center">
                                            <a class="linkDeco" href="BuyPage?Id=${List.get(3*i+j).getBookId()}&PageNumber=${PageNumber}">${List.get(3*i+j).getTitle()}</a>
                                        </h6>
                                        <c:if test="${List.get(3*i+j).getNumberOfBook() == 0}">
                                            <div>
                                                <br>                                                
                                                <h5 class="text-center" style="color: red; font-weight: bold">Hết Hàng</h5>
                                            </div>
                                        </c:if>
                                        <c:if test="${List.get(3*i+j).getNumberOfBook()> 0}">
                                            <c:if test="${not empty Name}">
                                                <div>
                                                    <p class="text-center">${List.get(3*i+j).getPrice()} đ</p>
                                                </div>
                                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                                    <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="addCart?bookId=${List.get(3*i+j).getBookId()}&PageNumber=${PageNumber}&amount=1">Add to cart</a></div>
                                                </div>
                                            </c:if>
                                            <c:if test="${empty Name}">
                                                <div>
                                                    <p class="text-center">${List.get(3*i+j).getPrice()} đ</p>
                                                </div>
                                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                                    <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="Login">Add to cart</a></div>
                                                </div>
                                            </c:if>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </c:if>                 
                    </c:forEach>
                </div>
            </c:forEach>
        </div>

        <div class="text-center"  style="margin: 50px 0 " >
            page:                       
            <c:forEach var="j" begin="1" step="1" end="${TotalPage}">                
                <a class="linkDeco" href="DataController?PageNumber=${j}" >${j}  </a>
            </c:forEach>
        </div>

    </body>

</html>
<jsp:include page="footer.jsp"/>