<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<style>
			#game{
				width: 100%;
				text-align:  center;				
			}
			.tit{
				background-color: gray;
				color: white;
			}
			#quizRank, #quizRank th, #quizRank td, #nemoRank,#nemoRank td,#nemoRank th{
				border: 1px solid;
			}
			#quizRank,#nemoRank{
				width: 100%;				
			}
		</style>
	</head>
	<body>
		<h3>게임 랭킹</h3>
		<table id="game">
			<tr>
				<td>
					<table id="quizRank">			
						<tr class="tit">
							<th>랭킹</th>
							<th>아이디</th>
							<th>점수</th>
							<th>걸린시간</th>
						</tr>
					</table>
				</td>
				<td>
					<table id="nemoRank">	
						<tr class="tit">
							<th>랭킹</th>
							<th>아이디</th>
							<th>걸린시간</th>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
	<script>
		$(document).ready(function () {
			console.log("랭킹 요청");
			$.ajax({
				type:'post'
				,url:'mainRank'
				,data:{
				}
				,dataType:'json'
				,success : function(data) {
					console.log("퀴즈 데이터 ");
					console.log(data);
					console.log("퀴즈 데이터 ");
					var quiz = data.quiz;
					for (var i = 0; i < quiz.length; i++) {					
						var content="";
						content+="<tr>";
						content+="<td>"+Number(i+1)+"</td>";
						content+="<td>"+quiz[i].id +"</td>";
						content+="<td>"+quiz[i].quiz_score+"/10" +"</td>";
						content+="<td>"+quiz[i].quiz_timer +"</td>";
						content+="</tr>";
						$('#quizRank').append(content);
					}
					var nemo = data.nemo;
					for (var i = 0; i < nemo.length; i++) {					
						var content="";
						content+="<tr>";
						content+="<td>"+Number(i+1)+"</td>";
						content+="<td>"+nemo[i].id +"</td>";
						content+="<td>"+nemo[i].nemo_timer +"</td>";
						content+="</tr>";
						$('#nemoRank').append(content);
					}
				}
				,error : function(e) {
					console.log(e);
				}
			});
			
		});
	</script>
</html>