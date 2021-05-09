<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>쪽지함</title>
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<style>
		#sendList{
			padding-top : 100px ;
			padding-left : 240px;
		}
		h3{
			  font-family: inherit;
			  font-weight: 500;
			  line-height: 1.1;
			  color: inherit;
		}
		table{
		width : 90%;
		}
		#tr > td {
			padding-top : 10px;
			text-align : center;
		}
		</style>
	</head>
	<body>
	<jsp:include page="../main/top_Navi.jsp"/>
	<table>
		<tr>
			<td><jsp:include page="../main/side_myNavi.jsp"/></td>
			<td id="sendList">
		
			<h3>보낸 쪽지함</h3>
			<hr/>
	            <table>
	                <tr>
	                    <th>번호</th>
	                    <th>내용</th>
	                    <th>닉네임</th>
	                    <th>보낸 날짜</th>
	                </tr>
	                <c:forEach var = "note" items="${sendList}">
	                	<tr id="tr">
	                		<td>${note.note_idx}</td>
	                		<td>${note.content}</td>
	                		<td> ${note.receiving_id}</td>
	                		<td>${note.reg_date}</td>
	                	</tr>
	                </c:forEach>
	            </table>
	         </td>
		</tr>
		
	</table>
	</body>
	<script>
		
	</script>
</html>
