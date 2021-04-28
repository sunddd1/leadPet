<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/game/include.jsp" %>    
<html>
	<head>
		<meta charset="UTF-8">
		<title>WeeklyQuizDetail</title>
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<style>
			#conBody{
				margin: 5% 15%;
			}
			h2{
				text-align: center;
			}
			#queList{
				padding-top: 3%;
			}
			table{
				border: 3px solid darkgrey;
				padding: 3%;
				width: 100%;
				
			}
			#toGameWeek{
				float: right;
			}
			th,td{
				text-align: left;
				padding-top: 1%;
			}
			th{
				padding-top: 3%;
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
				<h2>${week_quiz_idx}회차 상식퀴즈</h2>
			</div>
			<div id="toGameWeek">
				<button onclick="location.href='./gameWeek'">목록으로</button>
			</div>
			<div id="queList">			
				<table>
					<c:forEach items="${qWeekDetail}" var="list">
						<tr>
							<th>Q. ${list.quiz_question}</th>			
						</tr>
						<tr>
							<td>
								<input type="radio" name="exam" value="${list.ex1}"/>${list.ex1}
								<input type="radio" name="exam" value="${list.ex2}"/>${list.ex2}
								<input type="radio" name="exam" value="${list.ex3}"/>${list.ex3}
								<input type="radio" name="exam" value="${list.ex4}"/>${list.ex4}
								&nbsp;&nbsp;<span> 정답 : ${list.quiz_answer}</span>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>	
	</body>
	<script></script>
</html>