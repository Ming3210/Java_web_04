<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.example.java_web_04.model.Student" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Hi
  Date: 09/05/2025
  Time: 12:13 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Student> students = new ArrayList<>();
    students.add(new Student(1, "Nguyễn Văn A", 20, 8.5));
    students.add(new Student(2, "Trần Thị B", 21, 7.2));
    students.add(new Student(3, "Lê Văn C", 19, 6.8));
    students.add(new Student(4, "Phạm Thị D", 22, 9.0));
    students.add(new Student(5, "Hoàng Văn E", 20, 6.5));
    students.add(new Student(6, "Ngô Thị F", 21, 7.8));

    request.setAttribute("students", students);
%>

<html>
<head>
    <title>Danh Sách Sinh Viên</title>

</head>
<body>
<h1>Danh Sách Sinh Viên</h1>

<table border="1">
    <tr>
        <th>ID</th>
        <th>Họ và Tên</th>
        <th>Tuổi</th>
        <th>Điểm Trung Bình</th>
    </tr>

    <c:set var="highScoreCount" value="0" />

    <c:forEach items="${students}" var="student">
        <tr>
            <td>${student.id}</td>
            <td>${student.name}</td>
            <td>${student.age}</td>
            <td class="${student.avgScore > 7.0 ? 'high-score' : ''}">
                    ${student.avgScore}
            </td>
        </tr>

        <c:if test="${student.avgScore > 7.0}">
            <c:set var="highScoreCount" value="${highScoreCount + 1}" />
        </c:if>
    </c:forEach>
</table>

<div class="summary">
    Tổng số sinh viên có điểm trung bình > 7.0: ${highScoreCount} sinh viên
</div>

</body>
</html>
