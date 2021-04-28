<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>쪽지함</title>
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<style></style>
	</head>
	<body>
		<h3>야호</h3>
		<c:forEach var = "note" items="${messageList}">
	    쪽지번호 : ${note.note_idx } <br>
	    보낸사람 : ${note.id } <br>
	    내용 : ${note.content} <br>
	    보낸 날짜 : ${note.reg_date} 
	    </c:forEach>
	</body>
	<script></script>
</html>