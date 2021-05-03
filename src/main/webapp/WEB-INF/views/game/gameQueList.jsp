<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/main/top_Navi.jsp" %>
<%@ include file="/WEB-INF/views/main/side_adminNavi.jsp" %>        
<html>
	<head>
		<meta charset="UTF-8">
		<title>GameQuestionList</title>
		<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
		<style>
			#side_Navi,#conBody{
				display: inline-block;
			}
			#conBody{
				margin-left: 10%;
				width: 50%;
			}
			h2{
				text-align: center;
			}
			#selec{
				float: right;
			}
			#padding{
				width: 100%;
			}
			#quizTitle,#quiz{
				display: inline;
			}
			#nemoTitle,#nemo{
				display: none;
			}
			th,td{
				text-align: center;
				border: 2px solid darkgrey;
				border-collapse: collapse;
				padding: 2%;
			}
			#quizTable, #nemoTable{
				width: 100%;
				margin-top: 2%;
			}
			th,td{
				min-width: 100px;
			}
			th{
				border-bottom: 3px double darkgrey;
			}
			a:link, a:visited, a:active{
				color:darkslategrey;
				text-decoration: none;
				font-size: 15px;
				font-weight: 600;
			}
		</style>
	</head>
	<body>
		<div id="conBody">
			<div  id="quizTitle">
				<h2>상식퀴즈 문제 목록</h2>
			</div>
			<div	id="nemoTitle">
				<h2 >네모로직</h2>
			</div>	
			<div id="selec">
				상식퀴즈<input type="radio" name="toggle" value="상식퀴즈" checked="checked"/>
				네모로직<input type="radio" name="toggle" value="네모로직"/>
			</div>	
			<div id="padding">
				<div id="quiz">
					<button id="quizInsert" onclick="location.href='./insertQuizForm'">상식퀴즈 게임등록</button>			
					<table id="quizTable">
						<tr>
							<th>퀴즈번호</th><th>문제</th><th>블라인드</th>
						</tr>
						<c:forEach items="${quizList}" var="que">
							<tr>
								<td>${que.quiz_idx}</td>
								<td><a href="./quizDetail?idx=${que.quiz_idx}">${que.quiz_question}</a></td>
								<td><a href="./quizBlind?idx=${que.quiz_idx}" style="color: #1B4F72; font-family: cursive;">Blind</a></td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div id="nemo">
					<button id="nemoInsert" onclick="location.href='./insertNemoForm'">네모로직 게임등록</button>			
					<table id="nemoTable">
						<tr>
							<th>네모로직 문제번호</th><th>네모로직 제목</th>
						</tr>
						<c:forEach items="${nemoList}" var="nemo">
							<tr>
								<td>${nemo.nemo_idx}</td>
								<td><a href="./nemoDetail?idx=${nemo.nemo_idx}">${nemo.nemo_subject}</a></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>	
	</body>
	<script>
		$('input[type="radio"]').click(function(){
			if($(this).val() == "상식퀴즈"){
				$('#quiz').css({"display":"inline"});
				$('#quizTitle').css({"display":"inline"});
				$('#nemo').css({"display":"none"});
				$('#nemoTitle').css({"display":"none"});
			} else if($(this).val() == "네모로직"){
				$('#quiz').css({"display":"none"});
				$('#quizTitle').css({"display":"none"});
				$('#nemo').css({"display":"inline"});
				$('#nemoTitle').css({"display":"inline"});
			}
		});
	</script>
</html>	