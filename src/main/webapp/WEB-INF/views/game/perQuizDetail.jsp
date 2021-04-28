<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<html>
	<head>
		<meta charset="UTF-8">
		<title>PerQuizDetail</title>
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<style>
			#conBody{
				margin: 5% 20%;
			}
			h2{
				text-align: center;
			}
			#queDetail{
				padding-top: 3%;
			}
			table{
				border: 3px solid;
				padding: 5%;
				width: 100%;
			}
			#btn{
				float: right;
			}
			th,td{
				text-align: left;
				padding-top: 1%;
			}
			th{
				padding: 2%;
				border: 3px double darkgrey;
			}
			td{
				padding-top: 3%;
			}
			p{
				color: red;
				font-size: 14px;
				font-weight: 600;
			}
		</style>
	</head>
	<body>
		<div id="conBody">
			<div  id="title">
				<h2>${quiz_idx}번 상식퀴즈</h2>
			</div>
			<div id="btn">
				<button onclick="location.href='./updateQuiz'">수정하기</button>
				<button onclick="location.href='./gameQueList'">목록으로</button>
			</div>
			<div id="queDetail">			
				<table>
					<tr>
						<th>
							[ 문제 ]<hr/>
							<h3>${quizDetail.quiz_question}</h3>
						</th>			
					</tr>
					<tr>
						<td>
							<c:if test="${quizDetail.ex1 == quizDetail.quiz_answer}">
								<input type="radio" name="exam" value="${quizDetail.ex1}" checked="checked"/>${quizDetail.ex1}
							</c:if>
							<c:if test="${quizDetail.ex1 != quizDetail.quiz_answer}">
								<input type="radio" name="exam" value="${quizDetail.ex1}"/>${quizDetail.ex1}							
							</c:if>
							<c:if test="${quizDetail.ex2 == quizDetail.quiz_answer}">
								<input type="radio" name="exam" value="${quizDetail.ex2}" checked="checked"/>${quizDetail.ex2}
							</c:if>
							<c:if test="${quizDetail.ex2 != quizDetail.quiz_answer}">
								<input type="radio" name="exam" value="${quizDetail.ex2}"/>${quizDetail.ex2}							
							</c:if>
							<c:if test="${quizDetail.ex3 == quizDetail.quiz_answer}">
								<input type="radio" name="exam" value="${quizDetail.ex3}" checked="checked"/>${quizDetail.ex3}
							</c:if>
							<c:if test="${quizDetail.ex3 != quizDetail.quiz_answer}">
								<input type="radio" name="exam" value="${quizDetail.ex3}"/>${quizDetail.ex3}							
							</c:if>
							<c:if test="${quizDetail.ex4 == quizDetail.quiz_answer}">
								<input type="radio" name="exam" value="${quizDetail.ex4}" checked="checked"/>${quizDetail.ex4}
							</c:if>
							<c:if test="${quizDetail.ex4 != quizDetail.quiz_answer}">
								<input type="radio" name="exam" value="${quizDetail.ex4}"/>${quizDetail.ex4}							
							</c:if>
						</td>
					</tr>
					<tr>
						<td><p>정답 : ${quizDetail.quiz_answer}</p></td>
					</tr>
				</table>
			</div>
		</div>	
	</body>
	<script></script>
</html>