<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/main/top_Navi.jsp" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>WeeklyQuizDetail</title>
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
			#queList{
				padding-top: 3%;
			}
			#quizTable{
				border: 3px solid darkgrey;
				padding: 3%;
				width: 100%;
			}
			#toGameWeek{
				float: right;
				padding: 1%;
			}
			#quizTable th, #quizTable td{
				text-align: left;
				padding-top: 1%;
			}
			#quizTable th{
				padding-top: 3%;
			}
			span{
				color: red;
				font-size: 14px;
				font-weight: 600;
			}
			#adNavi{
				background-color: lightcoral;
				color: white;
				font-weight: bold;
			}
		</style>
	</head>
	<body>
		<div id="conBody">
			<div  id="title">
				<h2>${week_quiz_idx}회차 상식퀴즈</h2>
			</div>
			<div id="toGameWeek">
				<c:if test="${lastQuiz == null}">
					<button onclick="location.href='./gameWeek'">목록으로</button>				
				</c:if>
				<c:if test="${lastQuiz != null}">
					<button onclick="location.href='./gameMain'">메인으로</button>				
				</c:if>
			</div>
			<div id="queList">			
				<table id="quizTable">
					<c:forEach items="${qWeekDetail}" var="list">
						<tr>
							<th>Q. ${list.quiz_question}</th>			
						</tr>
						<tr>
							<td>
								<c:if test="${list.ex1 == list.quiz_answer}">
									<input type="checkbox" name="exam" value="${list.ex1}" checked="checked"/>${list.ex1}
								</c:if>
								<c:if test="${list.ex1 != list.quiz_answer}">
									<input type="checkbox" name="exam" value="${list.ex1}" disabled="disabled"/>${list.ex1}	
								</c:if>
								<c:if test="${list.ex2 == list.quiz_answer}">
									<input type="checkbox" name="exam" value="${list.ex2}" checked="checked"/>${list.ex2}
								</c:if>
								<c:if test="${list.ex2 != list.quiz_answer}">
									<input type="checkbox" name="exam" value="${list.ex2}" disabled="disabled"/>${list.ex2}								
								</c:if>
								<c:if test="${list.ex3 == list.quiz_answer}">
									<input type="checkbox" name="exam" value="${list.ex3}" checked="checked"/>${list.ex3}
								</c:if>
								<c:if test="${list.ex3 != list.quiz_answer}">
									<input type="checkbox" name="exam" value="${list.ex3}" disabled="disabled"/>${list.ex3}								
								</c:if>
								<c:if test="${list.ex4 == list.quiz_answer}">
									<input type="checkbox" name="exam" value="${list.ex4}" checked="checked"/>${list.ex4}
								</c:if>
								<c:if test="${list.ex4 != list.quiz_answer}">
									<input type="checkbox" name="exam" value="${list.ex4}" disabled="disabled"/>${list.ex4}								
								</c:if>
								&nbsp;&nbsp;<span> 정답 : ${list.quiz_answer}</span>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>	
		<jsp:include page="/WEB-INF/views/main/footerjsp.jsp"/>	
	</body>
	<script></script>
</html>