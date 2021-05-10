<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<style>
			#myNavi{
				background-color: lightcoral;
				color: white;
				font-weight: bold;
			}
		</style>
	</head>
	<body>
		<ul id="side_Navi">
			
				<li id="myinfo" onclick="location.href='./member-detail?id=${sessionScope.loginId}'">회원정보</li>

				<li id="draw" onclick="location.href='./withdrawal'">회원탈퇴</li>

				<li id="myinter" onclick="location.href='./interest-list-form'">관심 유저 목록</li>

				<li id="myPet" onclick="location.href='./listPet'">반려동물</li>

				<li id="sendMsg" onclick="location.href='./sendList'">보낸 쪽지함</li>

				<li id="recMsg" onclick="location.href='./noteList'">받은 쪽지함</li>

				<li onclick="location.href='./writeList'">작성한 글</li>

				<li id="calendar" onclick="location.href='./calendar'">달력</li>
				
		</ul>
	</body>
	<script>
	</script>
</html>