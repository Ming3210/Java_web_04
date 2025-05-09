<%--
  Created by IntelliJ IDEA.
  User: Hi
  Date: 09/05/2025
  Time: 9:51 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%
    String[] rows = {"A", "B", "C", "D", "E"};
    String[] cols = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10"};
    request.setAttribute("rows", rows);
    request.setAttribute("cols", cols);

    // Ghế đã được đặt trước
    String[] selectedSeats = {"C5", "C6", "C7", "C8"};
    request.setAttribute("selectedSeats", java.util.Arrays.asList(selectedSeats));
%>

<html>
<head>
    <title>Chọn ghế</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f2f2;
            display: flex;
            justify-content: center;
            padding-top: 40px;
        }

        .container {
            text-align: center;
        }

        .screen {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .row {
            display: flex;
            justify-content: center;
            margin-bottom: 8px;
        }

        .seat {
            width: 40px;
            height: 40px;
            margin: 4px;
            border-radius: 6px;
            font-size: 14px;
            border: none;
            background-color: #e0e0e0;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: 0.2s;
        }

        .seat:hover {
            background-color: #bbb;
            transform: scale(1.05);
        }

        .seat input {
            display: none;
        }

        .seat.selected {
            background-color: dodgerblue;
            color: white;
            cursor: not-allowed;
        }

        input[type="submit"] {
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 6px;
            background-color: #28a745;
            color: white;
            border: none;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="screen">Danh sách ghế phòng chiếu số 8</div>

    <form action="result.jsp" method="post">
        <c:forEach var="r" items="${rows}">
            <div class="row">
                <c:forEach var="c" items="${cols}">
                    <c:set var="seatId" value="${r}${c}" />
                    <c:choose>
                        <c:when test="${selectedSeats.contains(seatId)}">
                            <div class="seat selected">${seatId}</div>
                        </c:when>
                        <c:otherwise>
                            <label class="seat">
                                <input type="checkbox" name="seats" value="${seatId}" />
                                    ${seatId}
                            </label>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </div>
        </c:forEach>

        <input type="submit" value="Thanh toán">
    </form>
</div>
</body>
</html>
