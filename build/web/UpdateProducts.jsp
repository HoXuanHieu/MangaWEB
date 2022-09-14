<%-- 
    Document   : UpdateProducts
    Created on : Jul 11, 2022, 2:34:45 PM
    Author     : Ho Hieu
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/style.css"/>
        <link rel="stylesheet" href="css/dashboard.css"/>
        <link href="assets/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">        
    </head>
    <body>
        <jsp:include page="headerForAdmin.jsp"/>
        <div class="container-fluid">
            <div class="row">
                <jsp:include page="navbarAdmin.jsp"/>
                <div class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                    <form action="UpdateProducts">
                        <section class="py-5">
                            <div class="container px-4 px-lg-5 my-5">
                                <div class="row gx-4 gx-lg-5 align-items-center">                                   
                                    <div class="col-md-4 "><img class="card-img-top img-fluid mb-5 mb-md-0" src="${Book.getImgUrl()}" alt="..." /></div>
                                    <div class="col-md-6">
                                        <div class="small mb-1">${Book.getBookId()}</div>
                                        <table border="0" >
                                            <tbody>
                                                <tr>
                                                    <td>Tên Sách: </td>
                                                    <td> <input class="" type="text" value="${Book.getTitle()}" name="name" required> </td>
                                                </tr>
                                            </tbody>
                                            <tbody>
                                                <tr>
                                                    <td> Giá Tiền: </td>
                                                    <td><input type="text" value="${Book.getPrice()}" name="price" required></td>
                                                </tr>
                                            </tbody>
                                            <tbody>
                                                <tr>
                                                    <td> nội dung : </td>
                                                    <td><input type="text" value="${Book.getDescription()}" name="description"></td>
                                                </tr>
                                            </tbody>
                                            <tbody>
                                                <tr>
                                                    <td>Tác giả: </td>
                                                    <td><input type="text" value="${Book.getAuthorID()}" name="author" required></td>
                                                </tr>
                                            </tbody>
                                            <tbody>
                                                <tr>
                                                    <td>Số lượng: </td>
                                                    <td><input type="text" value="${Book.getNumberOfBook()}" name="num" required></td>
                                                </tr>
                                            </tbody>
                                            <tbody>
                                                <tr>
                                                    <td>Danh mục: </td>
                                                    <td><input type="text" value="${Book.getGenre()}" name="genre" required></td>
                                                </tr>
                                            </tbody>
                                            <tbody>
                                                <tr>
                                                    <td>thể loại: </td>
                                                    <td><input type="text" value="${Book.getStringCategory()}" name="category" required></td>
                                                </tr>
                                            </tbody>
                                            <tbody>
                                                <tr>
                                                    <td>File Ảnh </td>
                                                    <td><input type="file" value="${Book.getImgUrl()}" name="img_url" required></td>

                                                </tr>
                                            </tbody>
                                        </table>
                                        <hr>
                                        <div class="d-flex">
                                            <input type="hidden" name="bookId" value="${Book.getBookId()}">
                                            <input type="hidden" name="bookId" value="${Book.getBookId()}">
                                            <input type="hidden" name="PageNumber"  value="${param.PageNumber}">
                                            <input type="submit" class="btn btn-outline-dark flex-shrink-0" value="Update Producs">                                      
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section> 
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
