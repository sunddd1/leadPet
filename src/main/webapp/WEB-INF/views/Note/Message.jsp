<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>쪽지</title>
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<style></style>
	</head>
	<body>
        <h3>쪽지</h3>
		<c:forEach var = "note" items="${detailList}">
	    보낸사람 : ${note.id}<br>
	    내용 : ${note.content}<br>
	    <input type="button" id="reply" value="답장" onclick="location.href='./borderlist?receiving_id=${note.id}'"/>
        </c:forEach>
	</body>
	<script>
	
	</script>
</html>