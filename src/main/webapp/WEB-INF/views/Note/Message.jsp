<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<style></style>
	</head>
	<body>
		 <table>
            <tr>
                <th>보낸 닉네임 : </th>
                <th>내용</th>
            </tr>
            <c:forEach items="${review_list}" var="review3">
	            <tr>
	                <td>${review3.idx}</td>
	                <td><a href="../reviewDetail?Idx=${review3.idx}">${review3.subject}</a></td>
	            </tr>
            </c:forEach>
        </table>
	</body>
	<script></script>
</html>