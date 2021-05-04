<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/main/top_Navi.jsp" %>
<%@ include file="/WEB-INF/views/main/side_adminNavi.jsp" %>    
<html>
	<head>
		<meta charset="UTF-8">
		<title>WeeklyGameList</title>
		<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
		<style>
			#side_Navi,#conBody{
				display: inline-block;
			}
			#conBody{
				margin: 5% 22%;
				width: 50%;
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
			#quizTable, #nemoTable{
				width: 100%;
				margin-top: 2%;
			}
			#quizTable, #nemoTable, #quizTable th, #quizTable td, #nemoTable th, #nemoTable td{
				text-align: center;
				border: 2px solid darkgrey;
				border-collapse: collapse;
				padding: 2%;
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
					<table id="quizTable">
						<tr>
							<th>회차</th><th>등록일</th>
						</tr>
						<c:forEach items="${qWeekList}" var="qWeek">
							<tr>
								<td><a href="./quizWeekDetail?idx=${qWeek.week_quiz_idx}">${qWeek.week_quiz_idx}회차 상식퀴즈</a></td>
								<td>${qWeek.quiz_update_date}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div id="nemo">			
					<table id="nemoTable">
						<tr>
							<th>회차</th><th>등록일</th>
						</tr>
						<c:forEach items="${nWeekList}" var="nWeek">
							<tr>
								<td><a href="./nemoWeekDetail?idx=${nWeek.week_nemo_idx}">${nWeek.week_nemo_idx}회차 네모로직</a></td>
								<td>${nWeek.nemo_update_date}</td>
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