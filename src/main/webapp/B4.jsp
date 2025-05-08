<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.java_web_04.model.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Product> products = new ArrayList<>();
    products.add(new Product(1, "Iphone 14", "Iphone 14", 2000.0));
    products.add(new Product(2, "Iphone 15", "Iphone 15", 3000.0));
    products.add(new Product(3, "Iphone 16", "Iphone 16"));
    request.setAttribute("products", products);
%>
<html>
<head>
    <title>B4</title>
</head>
<body>
<h1>
    Danh Sách Sản Phẩm
</h1>
<table border="1">
    <tr>
        <td>ID</td>
        <td>Tên sản phẩm</td>
        <td>Giá</td>
        <td>Mô tả</td>
    </tr>
    <c:forEach items="${products}" var="product">
        <tr>
            <td>${product.id}</td>
            <td>${product.name}</td>
            <c:choose>
                <c:when test="${product.price != null}">
                    <td>${product.price}</td>
                </c:when>
                <c:otherwise>
                    <td>Chưa có giá</td>
                </c:otherwise>
            </c:choose>
            <td>${product.description}</td>
        </tr>
    </c:forEach>
</table>

</body>
</html>