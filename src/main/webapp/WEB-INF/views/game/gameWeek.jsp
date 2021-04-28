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
				margin: 2%;
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
				<h2>상식퀴즈</h2>
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
					<table>
						<tr>
							<th>회차</th><th>등록일</th>
						</tr>
						<tr>
							<td>3회차 상식퀴즈</td><td>2021-04-26</td>
						</tr>
						<tr>
							<td>2회차 상식퀴즈</td><td>2021-04-19</td>
						</tr>
						<tr>
							<td>1회차 상식퀴즈</td><td>2021-04-12</td>
						</tr>
					</table>
				</div>
				<div id="nemo">			
					<table>
						<tr>
							<th>회차</th><th>등록일</th>
						</tr>
						<tr>
							<td>3회차 네모로직</td><td>2021-04-26</td>
						</tr>
						<tr>
							<td>2회차 네모로직</td><td>2021-04-19</td>
						</tr>
						<tr>
							<td>1회차 네모로직</td><td>2021-04-12</td>
						</tr>
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