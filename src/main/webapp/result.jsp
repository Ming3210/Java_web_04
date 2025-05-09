<%--
  Created by IntelliJ IDEA.
  User: Hi
  Date: 09/05/2025
  Time: 10:28 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <title>Kết quả thanh toán</title>

</head>
<body>
<div class="result">
    <h2>🎉 Thanh toán thành công!</h2>

    <div class="seat-list">
        <%
            String[] seats = request.getParameterValues("seats");
            if (seats != null && seats.length > 0) {
        %>
        <p>Bạn đã chọn các ghế:</p>
        <%
            for (String seat : seats) {
        %>
        <span><%= seat %></span>
        <%
            }
        %>
        <%
        } else {
        %>
        <p style="color:red;">Bạn chưa chọn ghế nào!</p>
        <%
            }
        %>
    </div>

    <a href="index.jsp"> Quay lại chọn ghế</a>
</div>
</body>
</html>
