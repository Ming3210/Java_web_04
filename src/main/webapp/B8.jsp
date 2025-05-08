<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.example.java_web_04.model.Revenue" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %><%--
  Created by IntelliJ IDEA.
  User: Hi
  Date: 09/05/2025
  Time: 1:09 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  List<Revenue> revenueList = new ArrayList<>();
  revenueList.add(new Revenue("Tháng 1", 1200.0));
  revenueList.add(new Revenue("Tháng 2", 1500.0));
  revenueList.add(new Revenue("Tháng 3", 2000.0));
  revenueList.add(new Revenue("Tháng 4", 1800.0));
  revenueList.add(new Revenue("Tháng 5", 2200.0));
  revenueList.add(new Revenue("Tháng 6", 1900.0));

  request.setAttribute("revenueList", revenueList);

%>

<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Báo Cáo Doanh Thu Theo Tháng</h1>

<table border="1">
  <tr>
    <th>Tháng</th>
    <th>Doanh Thu</th>
  </tr>

  <c:set var="totalRevenue" value="0" />

  <c:forEach items="${revenueList}" var="revenue">
    <tr>
      <td>${revenue.month}</td>
      <td>${ (revenue.revenue)}</td>
    </tr>

    <c:set var="totalRevenue" value="${totalRevenue + revenue.revenue}" />
  </c:forEach>

  <tr class="highlight">
    <td><strong>Tổng cộng</strong></td>
    <td><strong>${ (totalRevenue)}</strong></td>
  </tr>
</table>

<div class="summary">
  <div class="total">Tổng doanh thu: ${ (totalRevenue)}</div>

  <c:choose>
    <c:when test="${totalRevenue > 10000}">
      <div class="success-message">
        Doanh thu đã vượt mục tiêu 10,000
      </div>
    </c:when>
    <c:otherwise>
      <div class="warning-message">
       Doanh thu chưa đạt mục tiêu 10,000
      </div>
    </c:otherwise>
  </c:choose>
</div>
</body>
</html>
