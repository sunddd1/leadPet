<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ include file="/WEB-INF/views/main/top_Navi.jsp" %>    
<html>
	<head>
		<meta charset="UTF-8">
		<title>NemoResultPage</title>
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
			#queDetail{
				padding-top: 3%;
			}
			#resultTable{
				border: 3px solid;
				padding: 3% 15%;
				width: 100%;
				white-space: nowrap;
			}
			#resultTable th{
				text-align: center;
				padding: 5%;
				font-size: x-large;
			}
			#resultTable td{
				text-align: center;
				padding: 3%;
				font-size: large;
				font-weight: 600;
			}
			#if_success{
				color: red;
			}
		</style>
	</head>
	<body>
		<div id="conBody">
			<div  id="title">
				<h2>네모로직 게임결과</h2>
			</div>
			<div id="result">			
				<table id="resultTable">
					<tr>
						<th>${loginId} 님 네모로직 게임 결과</th>
					</tr>
					<tr>
						<td id="if_success">
							<c:if test="${nemo_success == 'Y'}">
								정답! 답안과 일치합니다.							
							</c:if>
							<c:if test="${nemo_success == 'N'}">
								불일치합니다. 다음 기회에 다시 도전해주세요!						
							</c:if>
						</td>
					</tr>
					<tr>
						<td>걸린 시간 : ${resultTime}</td>
					</tr>
					<tr>
						<th>
							<button onclick="location.href='./nemoRanking'">랭킹보기</button>&nbsp;&nbsp;
							<button onclick="location.href='./gameMain'">목록으로</button>
						</th>	
					</tr>
				</table>
			</div>
		</div>	
	</body>
	<script></script>
</html>