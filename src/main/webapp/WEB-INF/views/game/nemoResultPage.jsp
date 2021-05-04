<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ include file="/WEB-INF/views/main/top_Navi.jsp" %>    
<%@ include file="/WEB-INF/views/main/side_adminNavi.jsp" %> 
<html>
	<head>
		<meta charset="UTF-8">
		<title>NemoResultPage</title>
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<style>
			#side_Navi,#conBody{
				display: inline-block;
			}
			#conBody{
				margin: 5% 25%;
				width: 40%;
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