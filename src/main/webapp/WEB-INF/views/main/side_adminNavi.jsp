<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
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
				<th id="vaccinManage" onclick="location.href='./vaccList'">백신리스트</th>
			</tr>
			<tr>
				<th onclick="location.href='./admin'">관리자관리</th>
			</tr>		
			<tr>
				<th onclick="location.href='./memberList'">회원리스트</th>
			</tr>		
			<tr>
				<th onclick="location.href='./reportList'">신고관리</th>
			</tr>		
			<tr>
				<th onclick="location.href='./gameWeek'">게임회차</th>
			</tr>		
			<tr>
				<th onclick="location.href='./gameQueList'">게임관리</th>
			</tr>	
			<tr>
				<th onclick="location.href='./#'">포인트내역</th>
			</tr>					
		</table>
	</body>
	<script>
	</script>
</html>