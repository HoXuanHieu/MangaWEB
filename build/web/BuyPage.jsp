<%-- 
    Document   : BuyPage
    Created on : Jun 29, 2022, 9:50:29 AM
    Author     : Ho Hieu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="header.jsp"/>
<html lang="vi">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">    
        <title> Buy Page</title>
        <link rel="stylesheet" href="css/style.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">        
    </head>
    <body>
        <div>
            <section class="py-5">
                <div class="container px-4 px-lg-5 my-5">
                    <div class="row gx-4 gx-lg-5 align-items-center">
                        <div class="col-md-4 "><img class="card-img-top img-fluid mb-5 mb-md-0" src="${Book.getImgUrl()}" alt="..." /></div>
                        <div class="col-md-6">
                            <div class="small mb-1">${Book.getBookId()}</div>
                            <h1 class="display-5 fw-bolder">${Book.getTitle()}</h1>
                            <div class="fs-5 mb-5">                           
                                <span>${Book.getPrice()} đ</span>
                            </div>
                            <p class="lead">${Book.getDescription()}</p>
                            <p>Tác giả: ${Book.getAuthorID()}</p>
                            <p>Danh Mục: <a class="linkDeco" href="SearchForGenre?genre=${Book.getGenre()}">${Book.getGenre()}</a> </p>
                            thể loại:
                            <c:forEach var="i" items="${Book.getCategory()}">
                                <a class="linkDeco" href="SearchForCategory?category=${i}">${i}</a>,
                            </c:forEach>
                            <br>
                            <hr>
                            <c:if test="${Book.getNumberOfBook() > 0}">
                                <c:if test="${not empty Name}">
                                    <div class="d-flex">
                                        <form action="addCart">
                                            <input type="hidden" name="bookId" value="${Book.getBookId()}">                                        
                                            <input type="hidden" name="PageNumber"  value="${param.PageNumber}">
                                            <input class="form-control text-center me-3" id="inputQuantity" type="num" name="amount" value="1" style="max-width: 3rem" />
                                            <input type="submit" class="btn btn-outline-dark flex-shrink-0" value="Add to cart">                                      
                                        </form>
                                    </div>
                                </c:if>
                                <c:if test="${empty Name}">
                                    <div class="d-flex">
                                        <form action="Login">
                                            <input type="hidden" name="bookId" value="${Book.getBookId()}">                                        
                                            <input type="hidden" name="PageNumber"  value="${param.PageNumber}">
                                            <input class="form-control text-center me-3" id="inputQuantity" type="num" name="amount" value="1" style="max-width: 3rem" />
                                            <input type="submit" class="btn btn-outline-dark flex-shrink-0" value="Add to cart">                                      
                                        </form>
                                    </div>
                                </c:if>
                            </c:if> 
                            <c:if test="${Book.getNumberOfBook() == 0}">
                                <h4 style="color: red">Hết hàng</h4>
                            </c:if>
                        </div>
                    </div>
                </div>
            </section> 
        </div>
    </body>
</html>
