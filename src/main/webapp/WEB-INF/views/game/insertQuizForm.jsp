<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/main/top_Navi.jsp" %>    
<%@ include file="/WEB-INF/views/main/side_adminNavi.jsp" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>InsertQuizPage</title>
		<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
		<style>
			#side_Navi,#conBody{
				display: inline-block;
			}
			#conBody{
				margin: 5% 18%;
				width: 60%;
			}
			h2{
				text-align: center;
			}
			#queDetail{
				padding-top: 1%;
			}
			#quizTable{
				border: 3px solid;
				padding: 5%;
				width: 100%;
			}
			#quizTable th{
				text-align: center;
				padding: 2%;
				border: 3px double darkgrey;
			}
			#quizTable td{
				text-align: left;
				padding-top: 3%;
				margin: 1%;
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
			#inputQ{
				width: 100%;
				height: 100px;
				background-color: #ECF0F1;
			}
			#answer{
				width: 50%;
			}
			#inputEx1,#inputEx2,#inputEx3,#inputEx4{
				width: 22%;
			}
		</style>
	</head>
	<body>
		<div id="conBody">
			<div  id="title">
				<h2>상식퀴즈 등록</h2>
			</div>
			<div id="queDetail">
				<form action="./insertQuiz" method="post">			
					<table id=quizTable>
						<tr>
							<th>
								[ 문제 ]<hr/>
								<h3><input type="text" name="quiz_question" id="inputQ"/></h3>
							</th>			
						</tr>
						<tr>
							<td>
								<input type="text" name="ex1" placeholder="보기 1" id="inputEx1"/>
								<input type="text" name="ex2" placeholder="보기 2" id="inputEx2"/>	
								<input type="text" name="ex3" placeholder="보기 3" id="inputEx3"/>	
								<input type="text" name="ex4" placeholder="보기 4" id="inputEx4"/>								
							</td>
						</tr>
						<tr>
							<td>
								정답 :&nbsp;&nbsp; 
								<input type="text" name="quiz_answer" id="answer"/>
								<input type="button" onclick="saveQuiz()" value="등록하기"/>
							</td>
						</tr>
					</table>
				</form>	
			</div>
		</div>
	</body>
	<script>
		function saveQuiz(){
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
	</script>
</html>	