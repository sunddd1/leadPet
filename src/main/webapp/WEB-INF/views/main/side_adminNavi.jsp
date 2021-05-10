<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<style>
			#adNavi{
				background-color: lightcoral;
				color: white;
				font-weight: bold;
			}
		</style>
	</head>
	<body>
			<ul id="side_Navi">
			
				<li  id="vaccinManage" onclick="location.href='./vaccList'">백신리스트</li>

				<li id="adManage" onclick="location.href='./admin'">관리자관리</li>

				<li id="memberManage" onclick="location.href='./memberList'">회원리스트</li>

				<li id="repManage" onclick="location.href='./reportList'">신고관리</li>

				<li id="gameRound" onclick="location.href='./gameWeek'">게임회차</li>

				<li id="gameManage" onclick="location.href='./gameQueList'">게임관리</li>

				<li id="pointDoc" onclick="location.href='./pointList'">포인트내역</li>

				
		</ul>

	</body>
	<script>
	</script>
</html>