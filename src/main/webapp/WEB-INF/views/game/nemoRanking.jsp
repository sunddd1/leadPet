<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ include file="/WEB-INF/views/main/top_Navi.jsp" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ThisWeekQuizRankingPage</title>
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<style>
			#conBody{
				margin-left : 20%;
				width: 60%;
				margin-top: 100px;
				margin-bottom: 100px;
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
				white-space: nowrap;
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
			span{
				color: red;
				font-size: 14px;
				font-weight: 600;
			}
			#decoImg{
				display: inline-block;
				width : 100%;
				height : 140px;
				background-repeat: no-repeat;
			}
			#minGame{
				background-color: lightcoral;
				color: white;
				font-weight: bold;
			}
		</style>
	</head>
	<body>
		<div id="conBody">
			<div  id="title">
				<h2>네모로직 랭킹</h2>
			</div>
			<div id="btn">
				<button onclick="location.href='./gameMain'">목록으로</button>				
			</div>
			<div id="rankList">			
				<table id="rankTable">
					<tr>
						<th>랭킹</th><th>아이디</th><th>걸린시간</th><th>날짜</th>			
					</tr>
					<c:forEach items="${nemoRanking}" var="ranking" begin="0" end="9">
						<c:if test="${ranking.id != loginId}">
							<tr>
								<td>${ranking.ROWNUM}</td><td>${ranking.id}</td>
								<td>
									<c:if test="${ranking.nemo_timer < 60000}">
										0${Math.round(ranking.nemo_timer/6000)}
									</c:if> 
									<c:if test="${ranking.nemo_timer/6000 >= 60000}">
										${Math.round(ranking.nemo_timer/6000)}
									</c:if>
									<c:if test="${ranking.nemo_timer%6000/100 < 9.9}">
										: 0${Math.round(ranking.nemo_timer%6000/100)}
									</c:if> 
									<c:if test="${ranking.nemo_timer%6000/100 >= 9.9}">
										: ${Math.round(ranking.nemo_timer%6000/100)}
									</c:if>
									<c:if test="${ranking.nemo_timer%6000%100 < 10}">
										: 0${ranking.nemo_timer%6000%100}
									</c:if> 
									<c:if test="${ranking.nemo_timer%6000%100 >= 10}">
										: ${ranking.nemo_timer%6000%100}
									</c:if>  
								</td>
								<td>${ranking.nemo_success_date}</td>	
							</tr>							
						</c:if>
						<c:if test="${ranking.id == loginId && ranking.ROWNUM<=10}">
							<tr style="border: 3px solid">
								<td>${ranking.ROWNUM}</td><td style="color: red">${ranking.id}</td>
								<td>
									<c:if test="${ranking.nemo_timer < 60000}">
										0${Math.round(ranking.nemo_timer/6000)}
									</c:if> 
									<c:if test="${ranking.nemo_timer/6000 >= 60000}">
										${Math.round(ranking.nemo_timer/6000)}
									</c:if>
									<c:if test="${ranking.nemo_timer%6000/100 < 10}">
										: 0${Math.round(ranking.nemo_timer%6000/100)}
									</c:if> 
									<c:if test="${ranking.nemo_timer%6000/100 >= 10}">
										: ${Math.round(ranking.nemo_timer%6000/100)}
									</c:if>
									<c:if test="${ranking.nemo_timer%6000%100 < 10}">
										: 0${ranking.nemo_timer%6000%100}
									</c:if> 
									<c:if test="${ranking.nemo_timer%6000%100 >= 10}">
										: ${ranking.nemo_timer%6000%100}
									</c:if>  
								</td>
								<td>${ranking.nemo_success_date}</td>							
							</tr>
						</c:if>	
					</c:forEach>
					<c:forEach items="${nemoRanking}" var="ranking">
						<c:if test="${ranking.id == loginId && ranking.ROWNUM>10}">
							<tr><td colspan="4">●</td></tr>
							<tr><td colspan="4">●</td></tr>
							<tr><td colspan="4">●</td></tr>
							<tr style="border: 3px solid">
								<td>${ranking.ROWNUM}</td><td style="color: red">${ranking.id}</td>
								<td>
									<c:if test="${ranking.nemo_timer < 60000}">
										0${Math.round(ranking.nemo_timer/6000)}
									</c:if> 
									<c:if test="${ranking.nemo_timer/6000 >= 60000}">
										${Math.round(ranking.nemo_timer/6000)}
									</c:if>
									<c:if test="${ranking.nemo_timer%6000/100 < 10}">
										: 0${Math.round(ranking.nemo_timer%6000/100)}
									</c:if> 
									<c:if test="${ranking.nemo_timer%6000/100 >= 10}">
										: ${Math.round(ranking.nemo_timer%6000/100)}
									</c:if>
									<c:if test="${ranking.nemo_timer%6000%100 < 10}">
										: 0${ranking.nemo_timer%6000%100}
									</c:if> 
									<c:if test="${ranking.nemo_timer%6000%100 >= 10}">
										: ${ranking.nemo_timer%6000%100}
									</c:if>  
								</td>
								<td>${ranking.nemo_success_date}</td>							
							</tr>
						</c:if>
					</c:forEach>
				</table>
			</div>
		</div>
		<div id="decoImg" style="background: url('./resources/gameDecoImg.jpg')"></div>
		<jsp:include page="/WEB-INF/views/main/footerjsp.jsp"/>	
	</body>
	<script></script>
</html>