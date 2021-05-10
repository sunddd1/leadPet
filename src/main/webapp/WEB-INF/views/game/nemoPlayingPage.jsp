<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/main/top_Navi.jsp" %>     
<html>
	<head>
		<meta charset="UTF-8">
		<title>NemoPlayingPage</title>
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<style>
			#conBody{
				margin-left : 20%;
				width: 60%;
				margin-top: 100px;
				margin-bottom: 100px;
			}
			#nemoDiv{
				padding-top: 6%;
			}
			#nemoTable{
				border: 5px double grey;
				border-collapse: collapse;
			}
			#nemoTable th, #nemoTable td{
				border: 1px solid black;
				border-collapse: collapse;
				min-width: 90px;
				height: 70px;
				font-size: 12px;
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
				margin: 3% 0% 0% 55%;
			}
			.block{
				background-color: white;
				color: white;
			}
			.nemoNum{
				text-align: center;
				font-size:small;
				width: 90%;
				height: 90%;
			}
			#subjectSpace{
				padding-top: 2%;
			}
			#nemo_subject{
				width: 50%;
				height: 35px;
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
			<div id="nemoDiv">
				<form action="./submitNemo" method="post">
					<table id="nemoTable">
						<tr>
							<th colspan="11" id="subjectSpace">
								<h2>네모 제목 : ${nemoDetail.nemo_subject}</h2>
								<div id="timeWatch">
									<span id="postTestMin">00</span><!-- 분 -->
									<span>:</span>
									<span id="postTestSec">00</span><!--초-->
									<span>.</span>
									<span id="postTestMilisec">00</span><!--밀리초-->
								</div>
							</th>
						</tr>
						<tr>
							<th>NemoLogic</th>
							<th>${qList.get(0)}</th>
							<th>${qList.get(1)}</th>
							<th>${qList.get(2)}</th>
							<th>${qList.get(3)}</th>
							<th style="border-right: 3px double">${qList.get(4)}</th>
							<th>${qList.get(5)}</th>
							<th>${qList.get(6)}</th>
							<th>${qList.get(7)}</th>
							<th>${qList.get(8)}</th>
							<th>${qList.get(9)}</th>
						</tr>
						<tr id="block1">
							<th>${qList.get(10)}</th>
							<td class="false" id="A"></td>
							<td class="false" id="B"></td>
							<td class="false" id="C"></td>
							<td class="false" id="D"></td>
							<td class="false" id="E" style="border-right: 3px double"></td>
							<td class="false" id="F"></td>
							<td class="false" id="G"></td>
							<td class="false" id="H"></td>
							<td class="false" id="I"></td>
							<td class="false" id="J"></td>
						</tr>
						<tr id="block2">
							<th>${qList.get(11)}</th>
							<td class="false" id="A"></td>
							<td class="false" id="B"></td>
							<td class="false" id="C"></td>
							<td class="false" id="D"></td>
							<td class="false" id="E" style="border-right: 3px double"></td>
							<td class="false" id="F"></td>
							<td class="false" id="G"></td>
							<td class="false" id="H"></td>
							<td class="false" id="I"></td>
							<td class="false" id="J"></td>
						</tr>
						<tr id="block3">
							<th>${qList.get(12)}</th>
							<td class="false" id="A"></td>
							<td class="false" id="B"></td>
							<td class="false" id="C"></td>
							<td class="false" id="D"></td>
							<td class="false" id="E" style="border-right: 3px double"></td>
							<td class="false" id="F"></td>
							<td class="false" id="G"></td>
							<td class="false" id="H"></td>
							<td class="false" id="I"></td>
							<td class="false" id="J"></td>
						</tr>
						<tr id="block4">
							<th>${qList.get(13)}</th>
							<td class="false" id="A"></td>
							<td class="false" id="B"></td>
							<td class="false" id="C"></td>
							<td class="false" id="D"></td>
							<td class="false" id="E" style="border-right: 3px double"></td>
							<td class="false" id="F"></td>
							<td class="false" id="G"></td>
							<td class="false" id="H"></td>
							<td class="false" id="I"></td>
							<td class="false" id="J"></td>
						</tr>
						<tr id="block5">
							<th style="border-bottom: 3px double">${qList.get(14)}</th>
							<td class="false" id="A" style="border-bottom: 3px double"></td>
							<td class="false" id="B" style="border-bottom: 3px double"></td>
							<td class="false" id="C" style="border-bottom: 3px double"></td>
							<td class="false" id="D" style="border-bottom: 3px double"></td>
							<td class="false" id="E" style="border-right: 3px double; border-bottom: 3px double"></td>
							<td class="false" id="F" style="border-bottom: 3px double"></td>
							<td class="false" id="G" style="border-bottom: 3px double"></td>
							<td class="false" id="H" style="border-bottom: 3px double"></td>
							<td class="false" id="I" style="border-bottom: 3px double"></td>
							<td class="false" id="J" style="border-bottom: 3px double"></td>
						</tr>
						<tr id="block6">
							<th>${qList.get(15)}</th>
							<td class="false" id="A"></td>
							<td class="false" id="B"></td>
							<td class="false" id="C"></td>
							<td class="false" id="D"></td>
							<td class="false" id="E" style="border-right: 3px double"></td>
							<td class="false" id="F"></td>
							<td class="false" id="G"></td>
							<td class="false" id="H"></td>
							<td class="false" id="I"></td>
							<td class="false" id="J"></td>
						</tr>
						<tr id="block7">
							<th>${qList.get(16)}</th>
							<td class="false" id="A"></td>
							<td class="false" id="B"></td>
							<td class="false" id="C"></td>
							<td class="false" id="D"></td>
							<td class="false" id="E" style="border-right: 3px double"></td>
							<td class="false" id="F"></td>
							<td class="false" id="G"></td>
							<td class="false" id="H"></td>
							<td class="false" id="I"></td>
							<td class="false" id="J"></td>
						</tr>
						<tr id="block8">
							<th>${qList.get(17)}</th>
							<td class="false" id="A"></td>
							<td class="false" id="B"></td>
							<td class="false" id="C"></td>
							<td class="false" id="D"></td>
							<td class="false" id="E" style="border-right: 3px double"></td>
							<td class="false" id="F"></td>
							<td class="false" id="G"></td>
							<td class="false" id="H"></td>
							<td class="false" id="I"></td>
							<td class="false" id="J"></td>
						</tr>
						<tr id="block9">
							<th>${qList.get(18)}</th>
							<td class="false" id="A"></td>
							<td class="false" id="B"></td>
							<td class="false" id="C"></td>
							<td class="false" id="D"></td>
							<td class="false" id="E" style="border-right: 3px double"></td>
							<td class="false" id="F"></td>
							<td class="false" id="G"></td>
							<td class="false" id="H"></td>
							<td class="false" id="I"></td>
							<td class="false" id="J"></td>
						</tr>
						<tr id="block10">
							<th>${qList.get(19)}</th>
							<td class="false" id="A"></td>
							<td class="false" id="B"></td>
							<td class="false" id="C"></td>
							<td class="false" id="D"></td>
							<td class="false" id="E" style="border-right: 3px double"></td>
							<td class="false" id="F"></td>
							<td class="false" id="G"></td>
							<td class="false" id="H"></td>
							<td class="false" id="I"></td>
							<td class="false" id="J"></td>
						</tr>
						<tr style="display: none">
							<td colspan="6">
								<input type="hidden" id="nemo_idx" name="nemo_idx" value="${nemoDetail.nemo_idx}"/>
								<input type="hidden" id="nemo_timer" name="nemo_timer" value=""/>
								<input type="hidden" id="nemo_success" name="nemo_success" value=""/>
							</td>
						</tr>
					</table>
				</form>
				<button type="button" id="testStopBtn">STOP</button>
			</div>	
		</div>
		<jsp:include page="/WEB-INF/views/main/footerjsp.jsp"/>		
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
		
		function addZero(num) {
			return (num < 10 ? '0'+num : ''+num)
		}
		
		//수정사항 저장하기
		var question = [];
		var questionIdVal = '';
		var answer = [];
		var answerIdVal = '';		
		//console.log($('td').eq(15));
		//console.log($('td')[15]);
		$('td').click(function(){
			if($(this).attr('class') == "false"){
				$(this).css({'background-color':'black'});
				$(this).css({'color':'black'});
				$(this).attr('class','true');
			} else if($(this).attr('class') == "true"){
				$(this).css({'background-color':'white'});
				$(this).css({'color':'white'});
				$(this).attr('class','false');
			}
		});
		
		document.getElementById('testStopBtn').addEventListener('click', function() {
			if(timerStart) {
				clearInterval(timerStart)
				//console.log($('#postTestMin').html(),$('#postTestSec').html(),$('#postTestMilisec').html())
				var timerCnt = $('#postTestMin').html()+"/"+$('#postTestSec').html()+"/"+$('#postTestMilisec').html();
				$('#nemo_timer').val(timerCnt);
				console.log(timerCnt);
				
				console.log("*************");
				console.log($('.true').attr('id'));
				console.log("*************");
							
				/* for(var i=0; i<=21; i++){
					if($('input[type="text"]').eq(i).attr('class') == "nemoNum"){
						console.log($('input[type="text"]').eq(i).val());
						questionIdVal = $('input[type="text"]').eq(i).val();
						console.log(questionIdVal);
						question.push(questionIdVal);
					}
				} */
				for(var i=0; i<100; i++){
					if($('#nemoTable td').eq(i).attr('class') == "true"){
						console.log($('#nemoTable td').eq(i));
						//console.log($('td').eq(i).attr("id"));
						answerIdVal = answerIdVal + $('#nemoTable td').eq(i).attr("id");
					}
					if((i%10) == 9){
						console.log(i+"//"+answerIdVal);
						answer.push(answerIdVal);
						answerIdVal = '';
					}
				} 
				console.log("원래 답 : ","${aList}");
				console.log("제출한 답 : ",answer);
				if("${aList}" == answer){
					$('#nemo_success').val('Y');
				} else {
					$('#nemo_success').val('N');
				}
				console.log($('#nemo_success').val());
				$('form').submit();
			}
		});
		
	</script>
</html>