<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ include file="/WEB-INF/views/main/top_Navi.jsp" %>      
<html>
	<head>
		<meta charset="UTF-8">
		<title>QuizResultPage</title>
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<style>
			#conBody{
				margin: 5% 30%;
			}
			h2{
				text-align: center;
			}
			#queDetail{
				padding-top: 3%;
			}
			table{
				border: 3px solid;
				padding: 5% 15%;
				width: 100%;
			}
			th{
				text-align: center;
				padding: 5%;
				font-size: x-large;
			}
			td{
				text-align: left;
				padding: 3% 9%;
				font-size: large;
				font-weight: 600;
			}
		</style>
	</head>
	<body>
		<div id="conBody">
			<div  id="title">
				<h2>상식퀴즈 게임결과</h2>
			</div>
			<div id="result">			
				<table>
					<tr>
						<th>${loginId} 님 상식퀴즈 게임 결과</th>
					</tr>
					<tr>
						<td>점수 : ${score} / 10</td>
					</tr>
					<tr>
						<td>걸린 시간 : ${resultTime}</td>
					</tr>
					<tr>
						<th>
							<button onclick="location.href='./quizRanking'">랭킹보기</button>&nbsp;&nbsp;
							<button onclick="location.href='./gameMain'">목록으로</button>
						</th>	
					</tr>
				</table>
			</div>
		</div>	
	</body>
	<script></script>
</html>