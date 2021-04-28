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
				margin: 5% 30%;
			}
			h2{
				text-align: center;
			}
			#selec{
				float: right;
			}
			#padding{
				padding: 2%;
			}
			#quizTitle,#quiz{
				display: inline;
			}
			#nemoTitle,#nemo{
				display: none;
			}
			table{
				width: 100%;
				margin-top: 2%;
			}
			th,td{
				min-width: 100px;
			}
			table,th,td{
				text-align: center;
				border: 2px solid darkgrey;
				border-collapse: collapse;
				padding: 2%;
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
					<button id="quizInsert">상식퀴즈 게임등록</button>			
					<table>
						<tr>
							<th>퀴즈번호</th><th>문제</th>
						</tr>
						<c:forEach items="${quizList}" var="que">
							<tr>
								<td>${que.quiz_idx}</td>
								<td>${que.quiz_question}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div id="nemo">
					<button id="nemoInsert">네모로직 게임등록</button>			
					<table>
						<tr>
							<th>네모 번호</th><th>제목</th>
						</tr>
						<c:forEach items="${nemoList}" var="nemo">
							<tr>
								<td>${nemo.nemo_idx}</td>
								<td>${nemo.nemo_subject}</td>
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