<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<style>
		table,th,td{
			border: 1px solid;
			border-collapse: collapse;
			padding: 5px 10px;
			text-align: center;
		}
		table{
			margin-left: auto; 
			margin-right: auto;
		}
		h3{
			text-align: center;
		}
</style>
<body>
	<div>
			<table>
				<h3>반려동물 상세보기</h3>
				<input type="radio" id="r1" name="radio" value="member" OnClick="window.location.href='detailMember?id=${dto.id}'"/>회원
			    <input type="radio" id="r2" name="radio" value="pet" checked="checked" OnClick="window.location.href='detailPet'"/>반려동물
		<c:forEach items="${petList}" var="pet">
				<tr>
					<td rowspan="4"></td>
					<td>${pet.name}</td>
				</tr>
				<tr>
					<td>${pet.dog_cat}</td>
				</tr>
				<tr>
					<td>${pet.bday}</td>
				</tr>
				<tr>
					<td>${pet.kg}</td>
				</tr>
			</c:forEach>
			</table>
		</div>
</body>
</html>