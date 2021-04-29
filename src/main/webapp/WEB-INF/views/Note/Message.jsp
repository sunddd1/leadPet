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
                    <th>보낸 사람</th>
                    <th>내용:</th>
                </tr>
		        <c:forEach var = "note" items="${messageList}">
		        <tr>
			        <td>${note.note.id}</td>
			        <td>${note.content}</td>
					<td><a id="reply" href="">답장</a></td>
			    </tr>
			    </c:forEach>
	    </table>
	</body>
	<script></script>
</html>