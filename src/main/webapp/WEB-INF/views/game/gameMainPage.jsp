<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/game/include.jsp" %>    
<html>
	<head>
		<meta charset="UTF-8">
		<title>GameMainPage</title>
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<style>
			#game{
				background-color: white;
				border: 3px solid grey;
				width: 50%;
				height: 65%;
				padding: 2%;
				margin: 2% 20%;
			}
			.flexBox {
			   display: inline-flex;
			   align-items: center;
			   margin: 1%;
			}
			#quiz{
				/*border: 3px solid grey;*/
				margin-right:1%;
				padding: 1% 5%;
				font-family: monospace;
				width: 80%;
			}
			#nemo{
				/*border: 3px solid grey;*/
				margin-left: 1%;
				padding: 1% 5%;
				font-family: monospace;
				width: 80%;
			}
			img{
				width: 300px; 
				height: 300px;
				margin-bottom: 8%;
			}
			button{
				border: 2px solid #6495ED;
				border-radius: 8px;
				background-color: #6495ED;
				color: white;
				font-weight: 400;
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
						<img src="https://t1.daumcdn.net/cfile/tistory/99D3DB4A5D9A71821C">
						<button onclick="location.href='./quizPlaying'">게임시작</button>
						&nbsp;<button onclick="location.href='./quizRanking'">랭킹보기</button>
						&nbsp;<button onclick="location.href='./lastQuizAnswer'">지난 상식퀴즈 정답</button>
					</div>
					<div id="nemo">
						<h3>네모로직</h3>
						<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDQom1iYiiJqXX9rTaexFVfG_xV9PkEGpHLyF_sfUAqmqcAln6oQS1m9jEBCP3LZ6vfsA&usqp=CAU">
						<button onclick="location.href='./nemoPlaying'">게임시작</button>
						&nbsp;<button onclick="location.href='./nemoRanking'">랭킹보기</button>
						&nbsp;<button onclick="location.href='./lastNemoAnswer'">지난 네모로직 정답</button>
					</div>	
				</div>
			</div>
		</div>
		<!-- 
			상단에 include file="/WEB-INF/views/include.jsp"
			혹은
			jsp에서 <jsp:include page="${request.contextPath}/newItem"></jsp:include> 로 보내고
			controller에서
			@RequestMapping(method = RequestMethod.GET, value = "newItem")
			public String newItem(Model model) {
			    return "shared/items/NewItem";
			}
			로 받는다
		 -->		
	</body>
	<script></script>
</html>