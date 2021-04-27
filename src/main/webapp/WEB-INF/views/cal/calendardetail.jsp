<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<style>
			table,td{
				border: 1px solid navy;
				padding: 15px 10px;
			}
			table{
				width: 80%;
				height: 80%;
			}
		</style>
	</head>
	<body>
		<h3>상세보기 폼</h3>
		<table>
			<tr>
				<td colspan="2">${sche.content }</td>
				<th></th>
			</tr>
			<tr>	
				<th>${sche.subject }</th>
				<th><input type="date" value="${sche.d_day}"/></th>
				<th><button>등록</button></th>			
			</tr>
		</table>
	</body>
	<script>
	</script>
</html>