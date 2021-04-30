<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/game/include.jsp" %>    
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
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
			th,td{
				text-align: left;
				padding-top: 1%;
			}
			th{
				padding: 2%;
				border: 3px double darkgrey;
			}
			td{
				text-align: center;
				padding-top: 3%;
			}
			span{
				color: red;
				font-size: 14px;
				font-weight: 600;
			}
			#inputQ{
				width: 100%;
				height: 100px;
				background-color: #F3F3F3;
				font-size: 16px;
			}
			#answer,#inputEx1,#inputEx2,#inputEx3,#inputEx4{
				width: 20%;
			}
		</style>
	</head>
	<body>
		<div id="conBody">
			<div  id="title">
				<h2>${quiz_idx}번 상식퀴즈</h2>
			</div>
			<div id="queDetail">
				<form action="./updateQuiz?idx=${quiz_idx}" method="post">			
					<table>
						<tr>
							<th>
								[ 문제 ]<hr/>
								<h3><input type="text" name="quiz_question" id="inputQ" value="${quizDetail.quiz_question}"></h3>
							</th>			
						</tr>
						<tr>
							<td>
								<c:if test="${quizDetail.ex1 == quizDetail.quiz_answer}">
									<input type="radio" name="exam" checked="checked"/>
									<input type="text" name="ex1" id="inputEx1" value="${quizDetail.ex1}">
								</c:if>
								<c:if test="${quizDetail.ex1 != quizDetail.quiz_answer}">
									<input type="radio" name="exam"/>
									<input type="text" name="ex1" id="inputEx1" value="${quizDetail.ex1}">					
								</c:if>
								<c:if test="${quizDetail.ex2 == quizDetail.quiz_answer}">
									<input type="radio" name="exam" checked="checked"/>
									<input type="text" name="ex2" id="inputEx2" value="${quizDetail.ex2}">
								</c:if>
								<c:if test="${quizDetail.ex2 != quizDetail.quiz_answer}">
									<input type="radio" name="exam"/>
									<input type="text" name="ex2" id="inputEx2" value="${quizDetail.ex2}">					
								</c:if>
								<c:if test="${quizDetail.ex3 == quizDetail.quiz_answer}">
									<input type="radio" name="exam" checked="checked"/>
									<input type="text" name="ex3" id="inputEx3" value="${quizDetail.ex3}">
								</c:if>
								<c:if test="${quizDetail.ex3 != quizDetail.quiz_answer}">
									<input type="radio" name="exam"/>
									<input type="text" name="ex3" id="inputEx3" value="${quizDetail.ex3}">						
								</c:if>
								<c:if test="${quizDetail.ex4 == quizDetail.quiz_answer}">
									<input type="radio" name="exam" checked="checked"/>
									<input type="text" name="ex4" id="inputEx4"  value="${quizDetail.ex4}">
								</c:if>
								<c:if test="${quizDetail.ex4 != quizDetail.quiz_answer}">
									<input type="radio" name="exam"/>
									<input type="text" name="ex4" id="inputEx4" value="${quizDetail.ex4}">						
								</c:if>
							</td>
						</tr>
						<tr>
							<td><input type="hidden" name="quiz_idx" value="${quiz_idx}"></td>
						</tr>
						<tr>
							<td>
								<span>정답 :</span>&nbsp;&nbsp;
								<input type="text" name="quiz_answer" id="answer" value="${quizDetail.quiz_answer}">&nbsp;
								<input type="button" onclick="updateQuiz()" value="수정하기"/>
							</td>
						</tr>
					</table>
				</form>	
			</div>
		</div>	
	</body>
	<script>
		function updateQuiz(){
			if($('#inputQ').val() == ""){
				alert("문제를 입력해주세요");
			} else if($('#inputEx1').val()=="" || $('#inputEx2').val()=="" || $('#inputEx3').val()=="" || $('#inputEx4').val()==""){
				alert("보기를 빠짐 없이 입력해주세요");
			} else if($('#answer').val()==""){
				alert("정답을 입력해주세요");
			} else {
				$('form').submit();
			}
		}
		$('input[type="radio"]').click(function() {
			console.log($(this).next());
			$('#answer').val($(this).next().val());
			
		});
	</script>
</html>	