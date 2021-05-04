<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ include file="/WEB-INF/views/main/top_Navi.jsp" %>
<%@ include file="/WEB-INF/views/main/side_adminNavi.jsp" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>InsertNemoLogic</title>
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<style>
			#side_Navi,#conBody{
				display: inline-block;
			}
			#conBody{
				margin: 5% 0% 0% 7%;
				width: 50%;
			}
			#nemoTable{
				border: 5px double grey;
				border-collapse: collapse;
			}
			th,td{
				border: 1px solid black;
				border-collapse: collapse;
				font-size: 12px;
				min-width: 90px;
				height: 70px;
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
				margin: 2% 0% 0% 48%;
			}
		</style>
	</head>
	<body>
		<div id="conBody">
			<form action="./nemoMake" method="post">
				<table id="nemoTable">
					<tr>
						<th colspan="11" id="subjectSpace">
							<h2>네모 제목 : <input type="text" name="nemo_subject" id="nemo_subject"/></h2>
						</th>
					</tr>
					<tr>
						<th>NemoLogic</th>
						<th><input type="text" class="nemoNum" id="col1" placeholder="숫자입력(n/n)"/></th>
						<th><input type="text" class="nemoNum" id="col2" placeholder="숫자입력(n/n)"/></th>
						<th><input type="text" class="nemoNum" id="col3" placeholder="숫자입력(n/n)"/></th>
						<th><input type="text" class="nemoNum" id="col4" placeholder="숫자입력(n/n)"/></th>
						<th style="border-right: 3px double">
							<input type="text" class="nemoNum" id="col5" placeholder="숫자입력(n/n)"/>
						</th>
						<th><input type="text" class="nemoNum" id="col6" placeholder="숫자입력(n/n)"/></th>
						<th><input type="text" class="nemoNum" id="col7" placeholder="숫자입력(n/n)"/></th>
						<th><input type="text" class="nemoNum" id="col8" placeholder="숫자입력(n/n)"/></th>
						<th><input type="text" class="nemoNum" id="col9" placeholder="숫자입력(n/n)"/></th>
					<th><input type="text" class="nemoNum" id="col10" placeholder="숫자입력(n/n)"/></th>
					</tr>
					<tr id="block1">
						<th><input type="text" class="nemoNum" id="row1" placeholder="숫자입력(n/n)"/></th>
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
						<th><input type="text" class="nemoNum" id="row2" placeholder="숫자입력(n/n)"/></th>
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
						<th><input type="text" class="nemoNum" id="row3" placeholder="숫자입력(n/n)"/></th>
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
						<th><input type="text" class="nemoNum" id="row4" placeholder="숫자입력(n/n)"/></th>
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
							<input type="text" class="nemoNum" id="row5" placeholder="숫자입력(n/n)"/>
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
						<th><input type="text" class="nemoNum" id="row6" placeholder="숫자입력(n/n)"/></th>
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
						<th><input type="text" class="nemoNum" id="row7" placeholder="숫자입력(n/n)"/></th>
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
						<th><input type="text" class="nemoNum" id="row8" placeholder="숫자입력(n/n)"/></th>
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
						<th><input type="text" class="nemoNum" id="row9" placeholder="숫자입력(n,n)"/></th>
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
						<th><input type="text" class="nemoNum" id="row10" placeholder="숫자입력(n/n)"/></th>
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
							<input type="hidden" id="nemo_question" name="nemo_question" value=""/>
							<input type="hidden" id="nemo_answer" name="nemo_answer" value=""/>
						</td>
					</tr>
				</table>
			</form>
			<button id="btn" onclick="save()">등록하기</button>
			<!-- <td><input class="block" type="text" value="OFF"></td> -->
		</div>	
	</body>
	<script>
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
			for(var i=0; i<=21; i++){
				if($('input[type="text"]').eq(i).attr('class') == "nemoNum"){
					console.log($('input[type="text"]').eq(i).val());
					questionIdVal = $('input[type="text"]').eq(i).val();
					console.log(questionIdVal);
					question.push(questionIdVal);
				}
			}
			for(var i=0; i<101; i++){
				if($('#nemoTable td').eq(i).attr('class') == "true"){
					console.log($('#nemoTable td').eq(i).attr("id"));
					 answerIdVal = answerIdVal + $('#nemoTable td').eq(i).attr("id");
				}
				 if((i%10) == 9){
					 	console.log(answerIdVal);
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