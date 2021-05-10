<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/main/top_Navi.jsp" %>
<%@ include file="/WEB-INF/views/main/side_adminNavi.jsp" %>           
<html>
	<head>
		<meta charset="UTF-8">
		<title>NemoUpdatePage</title>
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
				width: 70%;
				height: 35px;
			}
			#btn{
				padding: 1%;
				margin: 3% 0% 0% 80%;
			}
			#gameManage{
				background-color: lightpink;
			}
			#adNavi{
				background-color: lightcoral;
				color: white;
				font-weight: bold;
			}
		</style>
	</head>
	<body>
		<div id="conBody">
			<div id="nemoDiv">
				<form action="./updateNemo" method="post">
					<table id="nemoTable">
						<tr>
							<th colspan="11" id="subjectSpace">
								<h2>네모 제목 : <input type="text" name="nemo_subject" id="nemo_subject" value="${nemoDetail.nemo_subject}"/></h2>
							</th>
						</tr>
						<tr>
							<th>NemoLogic</th>
							<th><input type="text" class="nemoNum" id="col1" value="${qList.get(0)}"/></th>
							<th><input type="text" class="nemoNum" id="col2" value="${qList.get(1)}"/></th>
							<th><input type="text" class="nemoNum" id="col3" value="${qList.get(2)}"/></th>
							<th><input type="text" class="nemoNum" id="col4" value="${qList.get(3)}"/></th>
							<th style="border-right: 3px double">
								<input type="text" class="nemoNum" id="col5" value="${qList.get(4)}"/>
							</th>
							<th><input type="text" class="nemoNum" id="col6" value="${qList.get(5)}"/></th>
							<th><input type="text" class="nemoNum" id="col7" value="${qList.get(6)}"/></th>
							<th><input type="text" class="nemoNum" id="col8" value="${qList.get(7)}"/></th>
							<th><input type="text" class="nemoNum" id="col9" value="${qList.get(8)}"/></th>
							<th><input type="text" class="nemoNum" id="col10" value="${qList.get(9)}"/></th>
						</tr>
						<tr id="block1">
							<th><input type="text" class="nemoNum" id="row1" value="${qList.get(10)}"/></th>
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
							<th><input type="text" class="nemoNum" id="row2" value="${qList.get(11)}"/></th>
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
							<th><input type="text" class="nemoNum" id="row3" value="${qList.get(12)}"/></th>
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
							<th><input type="text" class="nemoNum" id="row4" value="${qList.get(13)}"/></th>
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
							<th style="border-bottom: 3px double">
								<input type="text" class="nemoNum" id="row5" value="${qList.get(14)}"/>
							</th>
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
							<th><input type="text" class="nemoNum" id="row6" value="${qList.get(15)}"/></th>
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
							<th><input type="text" class="nemoNum" id="row7" value="${qList.get(16)}"/></th>
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
							<th><input type="text" class="nemoNum" id="row8" value="${qList.get(17)}"/></th>
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
							<th><input type="text" class="nemoNum" id="row9" value="${qList.get(18)}"/></th>
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
							<th><input type="text" class="nemoNum" id="row10" value="${qList.get(19)}"/></th>
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
								<input type="hidden" id="nemo_question" name="nemo_question" value=""/>
								<input type="hidden" id="nemo_answer" name="nemo_answer" value=""/>
							</td>
						</tr>
					</table>
				</form>
				<button id="btn" onclick="save()">저장하기</button>	
			</div>	
		</div>	
	</body>
	<script>
	//불러오기(상세내역)
		var aArray = [];
		aArray = "${aList}".split(",");
		console.log(aArray);
		for(var i=0; i<10; i++){
			var trBlock = $('#block'+(i+1));
			console.log(trBlock);
			for(var j=0; j<11; j++){
				if(trBlock.children().eq(j).attr('class') == "false"){
					for(var k=0; k<10; k++){
						//console.log(trBlock.children().eq(j));
						//console.log(aArray[i][k]);
						if(trBlock.children().eq(j).attr('id') == aArray[i][k]){
							trBlock.children().eq(j).css({'background-color':'black'});
						}
					}					
				}
			}
		}
		
		//수정사항 저장하기
		for(var i=0; i<100; i++){
			//console.log($('td').eq(i).css('background-color'));
			if($('td').eq(i).css('background-color') == "rgb(0, 0, 0)"){
				$('td').eq(i).attr('class','true');
			}
			console.log($('td').eq(i).attr('class'));
			console.log($('td').eq(i).attr('id'));
		}

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
		function save(){
			console.log("*************");
/* 			for (var i = 1; i <= 10; i++) {
				console.log($('#block'+i).html());
				
			} */
			console.log($('.true').attr('id'));

			console.log("*************");
			
			for(var i=0; i<=21; i++){
				if($('input[type="text"]').eq(i).attr('class') == "nemoNum"){
					console.log($('input[type="text"]').eq(i).val());
					questionIdVal = $('input[type="text"]').eq(i).val();
					console.log(questionIdVal);
					question.push(questionIdVal);
				}
			}
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
			console.log(question);
			console.log(answer);
			$('#nemo_question').val(question);
			$('#nemo_answer').val(answer);
			console.log($('#nemo_question').val());
			console.log($('#nemo_answer').val());
			$('form').submit();
		}	
	</script>
</html>