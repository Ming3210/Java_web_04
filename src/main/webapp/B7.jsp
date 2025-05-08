<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.example.java_web_04.model.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Product> products = new ArrayList<>();
    products.add(new Product(1, "Iphone 14", "Iphone 14", 2000.0));
    products.add(new Product(2, "Iphone 15", "Iphone 15", 3000.0));
    request.setAttribute("products", products);

%>
<html>
<head>
    <title>Product Price Filter</title>
</head>
<body>
<form action="" method="get">
    <label for="minPrice">Min Price</label>
    <input type="text" id="minPrice" name="minPrice" value="${param.minPrice}"/>
    <label for="maxPrice">Max Price</label>
    <input type="text" id="maxPrice" name="maxPrice" value="${param.maxPrice}"/>
    <input type="submit" value="Search"/>
</form>
<h3>Danh sách sản phẩm</h3>
<table border="1">
    <tr>
        <th>STT</th>
        <th>Tên sản phẩm</th>
        <th>Giá</th>
        <th>Mô tả</th>
    </tr>
    <c:choose>
        <c:when test="${empty param.minPrice || empty param.maxPrice}">
            <c:forEach items="${products}" var="product">
                <tr>
                    <td>${product.id}</td>
                    <td>${product.name}</td>
                    <td>${product.price}</td>
                    <td>${product.description}</td>
                </tr>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <c:set var="productFound" value="false" />
            <c:forEach items="${products}" var="product">
                <c:if test="${product.price >= param.minPrice && product.price <= param.maxPrice}">
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
                    <td colspan="4">Không có sản phẩm nào trong khoảng giá này</td>
                </tr>
            </c:if>
        </c:otherwise>
    </c:choose>
</table>

</body>
</html>