<%-- 
    Document   : addProductPage
    Created on : Jul 13, 2022, 3:41:39 PM
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
                <div class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                    <h2 class="text-center fw-bold" style="margin: 20px 0">Thêm Sách</h2>
                    <p class="text-center"></p>
                    <form action="AddBook" class="form-horizontal">
                        <div class="col-md-10">
                            <div class="form-group" style="margin: 40px 0 0 0">
                                <label class="control-label col-sm-4 font-monospace fs-5">ID Sách</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="bookId" required pattern="[A-Z]{4}[0-9]{4}">
                                </div>
                            </div>
                            <div class="form-group" style="margin: 10px 0 0 0">
                                <label class="control-label col-sm-4 font-monospace fs-5">Tên Sách</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="title" required>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-10">
                            <div class="form-group" style="margin: 10px 0 0 0">
                                <label class="control-label col-sm-4 font-monospace fs-5" >Tên tác giả</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="author" required>
                                </div>
                            </div>

                            <div class="form-group" style="margin: 10px 0 0 0"  >
                                <label class="col-sm-6 col-form-label font-monospace fs-5">
                                    Danh mục</label>
                                <div class="col-sm-8">
                                    <select class="form-control " name="Gerne" >
                                        <option>manga</option>
                                        <option>Foreign Novel</option>
                                        <option>Domestic book</option>
                                        <option>Light Novel</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-10">
                            <div class="form-group" style="margin: 10px 0 0 0 ">
                                <label class="control-label col-sm-4 font-monospace fs-5">Giá Tiền</label>
                                <div class="col-sm-8">
                                    <input type="number" class="form-control" name="price" required min="0">
                                </div>
                            </div>

                            <div class="form-group" style="margin: 10px 0 0 0">
                                <label class="control-label col-sm-4 font-monospace fs-5">Số lượng</label>
                                <div class="col-sm-8">
                                    <input type="number" class="form-control" name="number" required min="0">
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-md-6 container" style="margin: 20px 0">
                            <c:if test="${not empty error}">
                                <p class="text-small" style="color: red">${error}</p>
                            </c:if>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="Hài hước" name="catetory" id="flexCheckDefault">
                                        <label class="form-check-label" for="flexCheckDefault">
                                            Hài hước                                          
                                        </label>
                                    </div>                              
                                </div>
                                <div class="col-md-6"> 
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="Viễn tưởng" name="catetory" id="flexCheckDefault">
                                        <label class="form-check-label" for="flexCheckDefault">
                                            Viễn tưởng
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="Hành động" name="catetory" id="flexCheckDefault">
                                        <label class="form-check-label" for="flexCheckDefault">
                                            Hành động
                                        </label>
                                    </div>                              
                                </div>
                                <div class="col-md-6"> 
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="Truyên Việt" name="catetory" id="flexCheckDefault">
                                        <label class="form-check-label" for="flexCheckDefault">
                                            Truyên Việt
                                        </label>
                                    </div>
                                </div>
                            </div><div class="row">
                                <div class="col-sm-6">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="Phiêu lưu" name="catetory" id="flexCheckDefault">
                                        <label class="form-check-label" for="flexCheckDefault">
                                            Phiêu lưu
                                        </label>
                                    </div>                              
                                </div>
                                <div class="col-md-6"> 
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="Trinh thám" name="catetory" id="flexCheckDefault">
                                        <label class="form-check-label" for="flexCheckDefault">
                                            Trinh thám
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="Hình sự" name="catetory" id="flexCheckDefault">
                                        <label class="form-check-label" for="flexCheckDefault">
                                            Hình sự
                                        </label>
                                    </div>                              
                                </div>
                                <div class="col-md-6"> 
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="Tâm lý" name="catetory" id="flexCheckDefault">
                                        <label class="form-check-label" for="flexCheckDefault">
                                            Tâm lý
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="Bí ẩn" name="catetory" id="flexCheckDefault">
                                        <label class="form-check-label" for="flexCheckDefault">
                                            Bí ẩn
                                        </label>
                                    </div>                              
                                </div>
                                <div class="col-md-6"> 
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="Tình cảm" name="catetory" id="flexCheckDefault">
                                        <label class="form-check-label" for="flexCheckDefault">
                                            Tình cảm
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" style="margin: 10px 0 0 0 ">
                            <label class="control-label col-sm-4 font-monospace fs-5">File Ảnh</label>
                            <div class="col-sm-6">
                                <input type="file" class="form-control" name="img_url" required>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label class="control-label col-sm-2 font-monospace fs-5">Nội dung</label>
                                <div class="col-sm-10">
                                    <textarea type="text" class="form-control" rows="3" name="description"></textarea>
                                </div>
                            </div>
                        </div>

                        <div class="text-center" style="margin: 10px 0">
                            <input class="btn btn-primary waves-effect waves-light" type="submit" value="add">                 
                        </div>                       
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
