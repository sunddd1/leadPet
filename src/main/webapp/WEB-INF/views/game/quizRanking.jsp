<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ include file="/WEB-INF/views/main/top_Navi.jsp" %>
<%@ include file="/WEB-INF/views/main/side_adminNavi.jsp" %>    
<html>
	<head>
		<meta charset="UTF-8">
		<title>ThisWeekQuizRankingPage</title>
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<style>
			#side_Navi,#conBody{
				display: inline-block;
			}
			#conBody{
				margin: 5% 25%;
				width: 45%;
			}
			h2{
				text-align: center;
			}
			#rankList{
				padding-top: 3%;
			}
			#rankTable{
				border: 3px solid darkgrey;
				border-collapse: collapse;
				width: 100%;
			}
			#rankTable th, #rankTable td{
				text-align: center;
				border: 1px solid darkgrey;
				border-collapse: collapse;
				padding: 1%;
			}
			#btn{
				float: right;
				padding: 1%;
			}
			#side_Navi th{
				border: 1px solid;
	      	 	padding: 5px 10px;
	       	 	border-collapse: collapse;
			}
			#side_Navi{
				white-space: nowrap;
				border: 1px solid;
				border-collapse: collapse;
				padding: 0;
			}
			span{
				color: red;
				font-size: 14px;
				font-weight: 600;
			}
		</style>
	</head>
	<body>
		<div id="conBody">
			<div  id="title">
				<h2>상식퀴즈 랭킹</h2>
			</div>
			<div id="btn">
				<button onclick="location.href='./gameMain'">목록으로</button>				
			</div>
			<div id="rankList">			
				<table id="rankTable">
					<tr>
						<th>랭킹</th><th>아이디</th><th>점수</th><th>걸린시간</th><th>날짜</th>			
					</tr>
					<c:forEach items="${quizRanking}" var="ranking" begin="0" end="9">
						<c:if test="${ranking.id != loginId}">
							<tr>
								<td>${ranking.ROWNUM}</td><td>${ranking.id}</td><td>${ranking.quiz_score}/10</td>
								<td>${Math.round(ranking.quiz_timer/6000)}:${Math.round(ranking.quiz_timer%6000/100)}:${ranking.quiz_timer%6000%100}</td>
								<td>${ranking.quiz_success_date}</td>	
							</tr>							
						</c:if>
						<c:if test="${ranking.id == loginId && ranking.ROWNUM<=10}">
							<tr style="border: 3px solid">
								<td>${ranking.ROWNUM}</td><td style="color: red">${ranking.id}</td><td>${ranking.quiz_score}/10</td>
								<td>${Math.round(ranking.quiz_timer/6000)}:${Math.round(ranking.quiz_timer%6000/100)}:${ranking.quiz_timer%6000%100}</td>
								<td>${ranking.quiz_success_date}</td>							
							</tr>
						</c:if>	
					</c:forEach>
					<c:forEach items="${quizRanking}" var="ranking">
						<c:if test="${ranking.id == loginId && ranking.ROWNUM>10}">
							<tr><td colspan="5">●</td></tr>
							<tr><td colspan="5">●</td></tr>
							<tr><td colspan="5">●</td></tr>
							<tr style="border: 3px solid">
								<td>${ranking.ROWNUM}</td><td style="color: red">${ranking.id}</td><td>${ranking.quiz_score}/10</td>
								<td>${Math.round(ranking.quiz_timer/6000)}:${Math.round(ranking.quiz_timer%6000/100)}:${ranking.quiz_timer%6000%100}</td>
								<td>${ranking.quiz_success_date}</td>							
							</tr>
						</c:if>
					</c:forEach>
				</table>
			</div>
		</div>	
	</body>
	<script></script>
</html>