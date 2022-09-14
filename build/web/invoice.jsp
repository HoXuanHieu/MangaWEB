<%-- 
    Document   : invoice
    Created on : Jul 9, 2022, 3:25:02 PM
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

    </head>
    <body>
        <div class="card">
            <div class="card-body mx-4">
                <div class="container">
                    <c:if test="${not empty noCheckOut}">
                        <p class="my-5 mx-5" style="font-size: 30px;">${noCheckOut}</p>
                        <a href="CartController?userId=${userId}">Quay về giỏ hàng</a>
                    </c:if>
                    <c:if test="${empty noCheckOut}">

                        <p class="my-5 mx-5" style="font-size: 30px;">
                            <img src="images/205-2054919_manga-logo-final-recovered-1-manga-entertainment-logo.png" class="img-fluid" width="50px" height="50px"  alt="alt"/> 
                            Cám ơn bạn đã mua hàng
                        </p>
                        <div class="row">
                            <ul class="list-unstyled">
                                <li class="text-black">Tên: ${NameUser}</li>                             
                                <li class="text-black mt-1">Ngày Check Out: ${date}</li>
                                <li class="text-black mt-1">Địa chỉ: ${address}</li>
                            </ul>
                            <h6 style="color: #ef595f">Hóa Đơn</h6>
                        </div>
                        <div class="row">
                            <hr>
                            <div class="col-xl-6">
                                <p>Tên sản phẩm</p>
                            </div>
                            <div class="col-xl-2">
                                <p class="float-end">số lượng
                                </p>
                            </div>
                            <div class="col-xl-2">
                                <p class="float-end">đơn giá
                                </p>
                            </div>
                            <div class="col-xl-2">
                                <p class="float-end">thành tiền
                                </p>
                            </div>
                        </div>

                        <c:forEach var="i" begin="0" step="1" end="${BookCheckOut.size()-1}">
                            <div class="row">
                                <hr>
                                <div class="col-xl-6">
                                    <p>${BookCheckOut.get(i).getTitle()}</p>
                                </div>
                                <div class="col-xl-2">
                                    <p class="float-end">${CartCheckOut.get(i).getNum()}
                                    </p>
                                </div>
                                <div class="col-xl-2">
                                    <p class="float-end">${BookCheckOut.get(i).getPrice()} đ
                                    </p>
                                </div>
                                <div class="col-xl-2">
                                    <p class="float-end">${BookCheckOut.get(i).getPrice() * CartCheckOut.get(i).getNum()} đ
                                    </p>
                                </div>                               
                            </div>
                        </c:forEach>
                        <div class="row text-black">
                            <hr style="border: 2px solid black;">
                            <div class="col-xl-12">
                                <p class="float-end fw-bold" style="color: #ef595f">Total: ${bill}     đ
                                </p>
                            </div>
                            <hr style="border: 2px solid black;">
                        </div>
                        <div class="text-center" style="margin-top: 90px;">                           
                            <a href="CountCart?PageNumber=1"><u class="text-info">Back to home page.</u></a>
                            <p>Mọi sự cố vui lòng liên hệ mail: MangaShop.mail@mail.com.</p>                       
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </body>
</html>
