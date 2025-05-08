<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Hi
  Date: 08/05/2025
  Time: 5:02 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>B2</title>
</head>
<body>
<form  method="post">
    <label for="name">Name</label>
    <input type="text" name="name" id="name">
    <br>
    <label for="password">Password</label>
    <input type="password" name="password" id="password">
    <br>
    <button type="submit">Đăng nhập</button>
</form>

<c:set var="name" value="admin" />
<c:set var="password" value="123456" />
<c:if test="${param.name != null && param.name != 'admin' &&param.password != null && param.password != '123456'}">
    <h2>
        Đăng nhập thất bại
    </h2>
</c:if>
<c:if test="${param.name == 'admin' && param.password == '123456'}">
    <h2>
        Đăng nhập thành công
    </h2>
</c:if>

</body>
</html>