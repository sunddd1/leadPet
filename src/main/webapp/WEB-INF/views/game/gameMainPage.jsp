<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/main/top_Navi.jsp" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>GameMainPage</title>
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<style>
			#side_Navi,#conBody{
				display: inline-block;
			}
			#conBody{
				width: 70%;
				min-width: 1000px;
				max-width : 1200px;
				margin-left: 20%;
				margin-top: 100px;
				margin-bottom: 100px;
			}
			#game{
				background-color: white;
				border: 5px solid grey;
				width: 90%;
				height: 65%;
				padding: 2%;
			}
			.flexBox {
			   display: inline-flex;
			   align-items: center;
			   margin: 1%;
			   width : 100%;
			}
			#quiz{
				/*border: 3px solid grey;*/
				margin-right:1%;
				padding: 1% 5%;
				font-family: monospace;
				width: 80%;				
				text-align: center;
			}
			#nemo{
				/*border: 3px solid grey;*/
				margin-left: 1%;
				font-family: monospace;
				width: 80%;
				float: right;
				margin-right : 50px;
				text-align: center;
			}
			button{
				border: 2px solid #6495ED;
				border-radius: 8px;
				background-color: #6495ED;
				color: white;
				font-weight: 400;
			}
			#quizImg{
				background: url("./resources/quiz_sea.jpg");
				background-size: 440px 300px;
				width: 441px;
				height: 301px;
				background-repeat: no-repeat;
				margin-bottom: 8%;
			}
			#nemoImg{
				background: url("./resources/nemo_cherry.jpg");
				background-size: 330px 300px;
				width: 331px;
				height: 301px;
				background-repeat: no-repeat;
				margin: 0% 0% 8% 2%;
			}
			#decoImg{
				display: inline-block;
				width : 100%;
				height : 140px;
				background-repeat: no-repeat;
			}
			#minGame{
				background-color: lightcoral;
				color: white;
				font-weight: bold;
			}
		</style>
	</head>
	<body>
		<div id="conBody">
			<div id="game">
				<h2 id="title">미니게임</h2>
				<hr/>
				<div class="flexBox">
					<div id="quiz">
						<h3>상식퀴즈</h3>
						<div id="quizImg"></div>
						<p>
							<button onclick="location.href='./quizPlaying'">게임시작</button>
							&nbsp;<button onclick="location.href='./quizRanking'">랭킹보기</button>
							&nbsp;<button onclick="location.href='./lastQuizAnswer'">지난 상식퀴즈 정답</button>
						</p>
					</div>
					<div id="nemo">
						<h3>네모로직</h3>
						<div id="nemoImg"></div>
						<p>
							<button onclick="location.href='./nemoPlaying'">게임시작</button>
							&nbsp;<button onclick="location.href='./nemoRanking'">랭킹보기</button>
							&nbsp;<button onclick="location.href='./lastNemoAnswer'">지난 네모로직 정답</button>
						</p>
					</div>	
				</div>
			</div>
		</div>
		<div id="decoImg" style="background: url('./resources/gameDecoImg.jpg')"></div>
		<jsp:include page="/WEB-INF/views/main/footerjsp.jsp"/>
	</body>
	<script></script>
</html>