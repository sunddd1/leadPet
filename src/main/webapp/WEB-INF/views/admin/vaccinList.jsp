<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<style>
			#vacc, #vacc td, #vacc th{
				font-size: 10pt;
				border: 1px solid;
				border-collapse: collapse;
				padding: 5px 10px;
			}
		</style>
	</head>
	<body>
		<h3>백신 게시판</h3>
		<table id="vacc">
			<tr>
				<th>이름</th>
				<th>내용</th>
				<th>주기</th>
				<th><button onclick='window.open("./regVaccForm","","")'>등록</button></th>
			</tr>
			<c:forEach items="${list}" var="vacc">
				<tr>
				<td>${vacc.vacc_name }</td>
				<td>${vacc.content }</td>
				<td>${vacc.cycle }</td>
				<td><button>수정</button> <button>삭제</button></td>
				</tr>
			</c:forEach>
		</table>
	</body>
	<script>
	</script>
</html>