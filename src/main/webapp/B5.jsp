<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.java_web_04.model.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Product> products = new ArrayList<>();
    products.add(new Product(1, "Iphone 14", "Iphone 14", 2000.0));
    products.add(new Product(2, "Iphone 15", "Iphone 15", 3000.0));
    request.setAttribute("products", products);

    String searchId = request.getParameter("searchId");
    request.setAttribute("searchId", searchId);
%>
<html>
<head>
    <title>B4</title>
</head>
<body>
<h1>Danh Sách Sản Phẩm</h1>

<form method="get" action="">
    <label for="searchId">Tìm kiếm theo ID:</label>
    <input type="text" id="searchId" name="searchId" value="${param.searchId}">
    <input type="submit" value="Tìm kiếm">
</form>

<table border="1">


    <c:choose>
        <c:when test="${empty param.searchId}">
            <tr>Chưa có sản phẩm nào tìm</tr>
        </c:when>

        <c:otherwise>
            <c:set var="productFound" value="false" />

            <c:forEach items="${products}" var="product">
                <c:if test="${product.id == param.searchId}">
                    <tr>
                        <td>ID</td>
                        <td>Tên sản phẩm</td>
                        <td>Giá</td>
                        <td>Mô tả</td>
                    </tr>
                    <tr>
                        <td>${product.id}</td>
                        <td>${product.name}</td>
                        <td>${product.price}</td>
                        <td>${product.description}</td>
                    </tr>
                    <c:set var="productFound" value="true" />
                </c:if>
            </c:forEach>

            <c:if test="${!productFound}">
                <tr>
                    <td colspan="4">Sản phẩm không tìm thấy</td>
                </tr>
            </c:if>
        </c:otherwise>
    </c:choose>
</table>
</body>
</html>