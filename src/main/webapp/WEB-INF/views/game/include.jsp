<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>IcludePage</title>
		<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
		<style>
			#titleArea{
				width: 100%;
				height: 10%;
				border: 1px solid;
			}
			#naviArea{
				width: 50%;
				border: 1px solid;
				padding: 2%;
			}
			a:link, a:visited, a:active{
				color:darkslategrey;
				text-decoration: none;
				font-size: 20px;
				font-weight: 600;
			}
		</style>
	</head>
	<body>
		<div id="titleArea">Title Area</div>
		<div id="naviArea">
			&nbsp;<a href="./gameMain">게임 메인 페이지 | </a>&nbsp;
			&nbsp;<a href="./nemoLogic">네모로직 페이지 | </a>&nbsp;
			&nbsp;<a href="./gameWeek">게임 회차 페이지 | </a>&nbsp;
			&nbsp;<a href="./gameQueList">문제 리스트 페이지</a>
		</div>
	</body>
	<script>
	
	</script>
</html>	