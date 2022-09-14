<%-- 
    Document   : UserPage
    Created on : Jul 7, 2022, 10:18:23 PM
    Author     : Ho Hieu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manga Shop</title>
        <link href="assets/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/style.css"/>

    </head>
    <body>
        <jsp:include page="headerForUser.jsp"/>
        <!--#fdccbc-->
        <section class="" style="background-color: #a5c9ea; padding:30px 0;">
            <div class="container h-100" style="">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <form action="CheckOut" method="GET">
                        <div class="col">
                            <p><span class="h2" >Shopping Cart </span><span class="h4">(${numberProduct} item in your cart)</span></p>
                            <!--sort by price and name-->
                            <c:if test="${empty Listbook}">
                                <div class="card mb-5">
                                    <div class="card-body p-4">
                                        <div class="float-sm-start">
                                            <h3>Giỏ hàng của bạn hiện không có gì</h3>                                         
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${ not empty Listbook}">
                                <c:forEach var="i" begin="0" step="1" end="${numberProduct -1}">
                                    <div class="card mb-4">
                                        <div class="card-body p-4">
                                            <div class="row align-items-center">
                                                <div class="col-md-2">
                                                    <img src="${Listbook.get(i).getImgUrl()}"
                                                         class="img-fluid" style="width: 150px;" alt="Generic placeholder image">
                                                </div>
                                                <div class="col-md-2 d-flex justify-content-center">
                                                    <div>
                                                        <p class="small text-muted mb-4 pb-2">Name</p>
                                                        <p class="lead fw-normal mb-0">${Listbook.get(i).getTitle()}</p>
                                                    </div>
                                                </div>                                      
                                                <div class="col-md-2 d-flex justify-content-center">
                                                    <div>
                                                        <p class="small text-muted mb-4 pb-2">Quantity</p>
                                                        <p class="lead fw-normal mb-0">${listCart.get(i).getNum()}</p>
                                                    </div>
                                                </div>
                                                <div class="col-md-2 d-flex justify-content-center">
                                                    <div>
                                                        <p class="small text-muted mb-4 pb-2">Price</p>
                                                        <p class="lead fw-normal mb-0">${Listbook.get(i).getPrice()} đ</p>
                                                    </div>
                                                </div>
                                                <div class="col-md-2 d-flex justify-content-center">
                                                    <div>
                                                        <p class="small text-muted mb-4 pb-2">Total</p>
                                                        <p class="lead fw-normal mb-0">${Listbook.get(i).getPrice() *listCart.get(i).getNum()} đ</p>
                                                    </div>
                                                </div>
                                                <div class="col-md-2 d-flex justify-content-center">
                                                    <div>
                                                        <p class="small text-muted mb-4 pb-2 text-center">action</p>
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    <div class="form-check" style="padding-right: 10px">
                                                                        <input class="form-check-input" type="checkbox" name="bookCheckOut" value="${listCart.get(i).getCartid()}">Buy
                                                                        <!--                                                                    <label class="form-check-label" for="flexCheckDefault">
                                                                                                                                                Buy
                                                                                                                                            </label>-->
                                                                    </div>
                                                                </td>
                                                                <td><a class="" href="DeleteCart?cartId=${listCart.get(i).getCartid()}" style="color: #a5c9ea;"><svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                                                                        <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                                                        <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                                                                        </svg>
                                                                    </a> </td>
                                                            </tr>
                                                        </table>


                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </c:forEach>
                                 <div class="card mb-5">
                                    <div class="card-body p-4">
                                        <div class="float-end">
                                            <c:if test="${not empty error}">
                                                <h6 class="small me-2 float-end text-danger" >${error}</h6>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                                <div class="card mb-5">
                                    <div class="card-body p-4">
                                        <div class="float-end">
                                        
                                            <span class="small text-muted me-2">Địa Chỉ:</span>
                                            <input type="text" name="address" style="width: 85vh;" required lang="vi"><br>
                                            <span class="small me-2 float-end text-danger">Vui lòng điền đúng số nhà/cơ quan,tên đường, thành phố, tĩnh thành để shop có thể giao hàng đến nơi.</span>
                                        </div>
                                    </div>
                                </div>
                            </c:if>


                            <!--                            <div class="card mb-5">
                                                            <div class="card-body p-4">
                            
                                                                <div class="float-end">
                                                                    <p class="mb-0 me-5 d-flex align-items-center">
                                                                        <span class="small text-muted me-2">Order total:</span> <span
                                                                            class="lead fw-normal">${totalPrice} đ</span>
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </div>-->

                            <div class="d-flex justify-content-end">                           
                                <button type="button" class="btn btn-light btn-lg me-2"><a class="linkDeco" href="CountCart?PageNumber=1">Continue shopping</a></button>
                                <!--<button type="button" class="btn btn-danger btn-lg"><a class="linkDeco" href="CheckOut">Check Out</a></button>-->
                                <input type="submit" name="submit" style="padding:0 2%; border: none; background-color: blue; color: white; font-weight: bold; border-radius: 6px" 
                                       value="Check Out">
                            </div>

                        </div>
                    </form>
                </div>
            </div>
        </section>
    </body>
</html>
