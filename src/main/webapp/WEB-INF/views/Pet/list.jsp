<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>반려동물 목록</title>
<style>
	table, td{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 5px 10px;
	}
	thead{
		font-weight:600;
		text-align: center;
	}
</style>
</head>
<body>

	<b>반려동물 목록</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<button onclick="location.href='writeForm'">반려동물 등록</button>
	<hr/>
	<table>
		<thead>
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회수</td>
				<td>삭제</td>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.idx}</td>
				<td><a href="./detail/${dto.idx}">${dto.subject}</a></td>
				<td>${dto.user_name}</td>
				<td>${dto.reg_date}</td>
				<td>${dto.bHit}</td>
				<td><a href="./delete/${dto.idx}">삭제</a></td>
			</tr>
		</c:forEach>		
		</tbody>
	</table>
</body>
<script></script>
</html>