<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/main/top_Navi.jsp" %>    
<html>
	<head>
		<meta charset="UTF-8">
		<title>QuizPlayingPage</title>
		<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
		<style>
			#side_Navi,#conBody{
				display: inline-block;
			}
			#conBody{
				width: 60%;
				margin-left: 20%;
				margin-top: 100px;
				margin-bottom: 100px;
			}
			h2{
				text-align: center;
			}
			#queList{
				padding-top: 3%;
				width: 105%;
			}
			#quizTable{
				border: 3px solid darkgrey;
				padding-left : 50px;
				padding-right : 50px;
			}
			#timeWatch{
				float: right;
				border: 2px solid #6495ED;
				border-radius: 8px;
				background-color: #6495ED;
				color: white;
				font-weight: 600;
				padding: 1%;
			}
			#testStopBtn{
				border: 2px solid #6495ED;
				border-radius: 8px;
				background-color: #6495ED;
				color: white;
				font-weight: 600;
				padding: 1%;
				margin: 3% 0% 0% 45%;
			}
			#quizTable th, #quizTable td{
				text-align: left;
				padding-top: 1%;
			}
			#quizTable th{
				padding-top: 3%;
			}
			#minGame{
				background-color: lightcoral;
				color: white;
				font-weight: bold;
			}
		</style>
	</head>
	<body>
		<form action="./submitQuiz" method="post">
			<div id="conBody">
				<div  id="title">
					<h2>${week_quiz_idx}회차 상식퀴즈</h2>
					<input type="hidden" name="week_quiz_idx" value="${week_quiz_idx}"/>
				</div>
				<div id="queList">			
					<table id="quizTable">
						<tr>
							<td id="timeWatch">
								<span id="postTestMin">00</span><!-- 분 -->
								<span>:</span>
								<span id="postTestSec">00</span><!--초-->
								<span>.</span>
								<span id="postTestMilisec">00</span><!--밀리초-->
							</td>
						</tr>
						<c:forEach items="${ThisWeekQuiz}" var="list">
							<tr>
								<th>
									Q. ${list.quiz_question}
									<input type="hidden" name="quiz_idx${list.quiz_idx}" value="${list.quiz_idx}"/>
									<input type="hidden" name="quiz_question${list.quiz_idx}" value="${list.quiz_question}"/>
								</th>			
							</tr>
							<tr>
								<td>
									<input type="radio" name="exam${list.quiz_idx}" value="${list.ex1}">${list.ex1}	
									<input type="radio" name="exam${list.quiz_idx}" value="${list.ex2}"/>${list.ex2}								
									<input type="radio" name="exam${list.quiz_idx}" value="${list.ex3}"/>${list.ex3}								
									<input type="radio" name="exam${list.quiz_idx}" value="${list.ex4}"/>${list.ex4}								
								</td>
							</tr>
						</c:forEach>
						<tr>
							<td>
								<input type="hidden" name="quiz_timer" id="quiz_timer"/>
							</td>
						</tr>
						<tr>
							<td>
								<button type="button" id="testStopBtn">STOP</button><!--스톱 버튼-->
							</td>
						</tr>
					</table>
				</div>
			</div>
		</form>
	</body>
	<script>
		//페이지 띄우자 마자 stop watch 시작
		//제출 클릭 시 stop watch 멈추고 시간 기록해서 넘기기
		//제출 시 문제, 답, 현재시각(millisecond), stop watch 시간이 넘어가야 함
		var stTime
		var timerStart
		if(! stTime) {
			stTime = new Date().getTime() //클릭한 시점의 현재시간 timestamp를 stTime에 저장
		}
		timerStart = setInterval(function() {
				var nowTime = new Date().getTime() //1ms당 한 번씩 현재시간 timestamp를 불러와 nowTime에 저장
				var newTime = new Date(nowTime - stTime) //(nowTime - stTime)을 new Date()에 넣는다
				var min = newTime.getMinutes() //분
				var sec = newTime.getSeconds() //초
				var milisec = Math.floor(newTime.getMilliseconds()/10) //밀리초
				document.getElementById('postTestMin').innerText = addZero(min)
				document.getElementById('postTestSec').innerText = addZero(sec)
				document.getElementById('postTestMilisec').innerText = addZero(milisec)
		}, 1)
		document.getElementById('testStopBtn').addEventListener('click', function() {
			if(timerStart) {
				clearInterval(timerStart)
				//console.log($('#postTestMin').html(),$('#postTestSec').html(),$('#postTestMilisec').html())
				var timerCnt = $('#postTestMin').html()+"/"+$('#postTestSec').html()+"/"+$('#postTestMilisec').html();
				$('#quiz_timer').val(timerCnt);
				console.log(timerCnt);
				$('form').submit();
			}
		});
		function addZero(num) {
			return (num < 10 ? '0'+num : ''+num)
		}
	</script>
</html>	