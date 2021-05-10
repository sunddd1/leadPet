<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>쪽지</title>
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<style>
			#recMsg{
			background-color: lightcoral;
			color: white;
			font-weight: bold;
			}
			#send{
				padding-top : 150px ;
				padding-left : 240px;
			}
			#reply{
				margin-left: 140px;
			}
		</style>
	</head>
	<body>
		<jsp:include page="../main/top_Navi.jsp"/>
	<table>
		<tr>
			<td><jsp:include page="../main/side_myNavi.jsp"/></td>
			<td id="send">
		
		        <h3>쪽지</h3>
				<c:forEach var = "note" items="${detailList}">
			    보낸사람 : ${note.id}<br><br>
			    내용 : ${note.content}<br>
			    <input type="button" id="reply" value="답장" onclick="location.href='./borderlist?receiving_id=${note.id}'"/>
		        </c:forEach>
		        </td>
		</tr>
		
	</table>
	</body>
	<script>
	
	</script>
</html>