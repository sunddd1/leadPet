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
			#side_Navi{
				position: absolute;
				top: 30%;
			}
		</style>
	</head>
	<body>
		<table id="side_Navi">
			<tr>
				<th onclick="location.href='./vaccList'">회원정보</th>
			</tr>
			<tr>
				<th onclick="location.href='./withdrawal?id=${sessionScope.loginId}'">회원탈퇴</th>
			</tr>		
			<tr>
				<th onclick="location.href='./#'">관심 유저 목록</th>
			</tr>		
			<tr>
				<th onclick="location.href='./listPet?id=${sessionScope.loginId}'">반려동물</th>
			</tr>		
			<tr>
				<th onclick="location.href='./sendList?id=${sessionScope.loginId}'">보낸 쪽지함</th>
			</tr>		
			<tr>
				<th onclick="location.href='./noteList?id=${sessionScope.loginId}'">받은 쪽지함</th>
			</tr>	
			<tr>
				<th onclick="location.href='./writeList?id=${sessionScope.loginId}'">작성한 글</th>
			</tr>	
			<tr>
				<th id="calendar" onclick="location.href='./calendar'">달력</th>
			</tr>					
		</table>
	</body>
	<script>
	</script>
</html>