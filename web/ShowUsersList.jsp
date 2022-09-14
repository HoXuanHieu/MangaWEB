<%-- 
    Document   : ShowUsersList
    Created on : Jul 6, 2022, 11:45:05 AM
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
                    <div class="table-responsive">
                        <table class="table table-striped table-sm">
                            <thead>
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">UserName</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">First Name</th>
                                    <th scope="col">Last Name</th>
                                    <th scope="col">Phone</th>
                                    <th scope="col">action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="i" items="${ListUser}">
                                    <c:if test="${i.getTypeUser() eq 'user' }">  
                                        <tr>
                                            <td>${i.getUserId()}</td>
                                            <td>${i.getUserName()}</td>
                                            <td>${i.getEmail()}</td>
                                            <td>${i.getFirstName()}</td>
                                            <td>${i.getLastName()}</td> 
                                            <td>${i.getPhone()}</td> 
                                            <td><a class ="linkDeco" href="">update</a> | <a class ="linkDeco"  href="">delete</a></td>
                                        </tr>
                                    </c:if>                                       
                                </c:forEach>                        
                            </tbody>
                        </table>
                    </div>
                </main>
            </div>
        </div>
    </body>
</html>
