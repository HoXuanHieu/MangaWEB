<%-- 
    Document   : HistoryBuyUser
    Created on : Jul 9, 2022, 9:13:46 PM
    Author     : Ho Hieu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="headerForUser.jsp"/>
        <section class="" style="background-color: #a5c9ea; padding:30px 0; height: 100vh">
            <c:if test="${not empty cartHaveCheckedOut}">
                <div class="table-responsive">
                    <table class="table table-striped table-sm table-hover">
                        <thead style="color: #d7363c">
                            <tr>
                                <th scope="col">STT</th>
                                <th scope="col">Tên sản phẩm</th>                              
                                <th class="text-center" scope="col">số sản phẩm</th>
                                <th class="text-center"scope="col">giá tiền</th>
                                <th class="text-center" scope="col">thành tiền</th>
                                <th class="text-center" scope="col">ngày check out</th>
                                <th style="text-align: right; padding-right:5%" scope="col-">địa chỉ nhận hàng</th>
                            </tr>                        
                        </thead>
                        <c:forEach var="i" begin="0" step="1" end="${cartHaveCheckedOut.size()-1}">
                            <tbody>
                                <tr>
                                    <th scope="col">${i+1}</th>
                                    <th scope="col">${bookHistory.get(i).getTitle()}</th>
                                    <th class="text-center" scope="col">${cartHaveCheckedOut.get(i).getNum()}</th>                               
                                    <th class="text-center" scope="col">${bookHistory.get(i).getPrice()} đ</th>
                                    <th class="text-center" scope="col">${bookHistory.get(i).getPrice()* cartHaveCheckedOut.get(i).getNum()} đ</th>
                                    <th class="text-center" scope="col">${cartHaveCheckedOut.get(i).getDateBuy()}</th>
                                    <th style="text-align: right; padding-right:5%">${cartHaveCheckedOut.get(i).getAdress()}</th>
                                </tr>
                            </tbody>
                        </c:forEach>
                    </table>
                </div>
            </c:if>

        </section>
    </body>
</html>
