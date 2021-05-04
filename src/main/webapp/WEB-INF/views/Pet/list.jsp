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
				<td>품종</td>
				<td>생년월일</td>
				<td>이름</td>
				<td>체중</td>
				<td>수정</td>
				<td>삭제</td>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.kind}</td>
				<td>${dto.bday}</td>
				<td>${dto.pet_name}</td>
				<td>${dto.kg}</td>
				<td><a href="./updatePet/${dto.pet_idx}">수정</a></td>
				<td><a href="./deletePet/${dto.pet_idx}">삭제</a></td>
			</tr>
		</c:forEach>		
		</tbody>
	</table>
</body>
<script></script>
</html>