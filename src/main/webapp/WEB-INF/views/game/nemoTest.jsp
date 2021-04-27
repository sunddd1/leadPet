<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ include file="/WEB-INF/views/game/include.jsp" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>NemoLogic</title>
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<style>
			#conBody{
				margin: 3% 30%;
			}
			table{
				border: 5px double grey;
				border-collapse: collapse;
			}
			th,td{
				border: 1px solid black;
				border-collapse: collapse;
				width: 100px;
				height: 100px;
			}
			.block{
				background-color: white;
				color: white;
			}
		</style>
	</head>
	<body>
		<div id="conBody">
			<button onclick="location.href='./nemoEx'">네모로직 참고자료</button>
			<br/>
			<table>
				<tr>
					<th>NemoLogic</th>
					<th>[ 숫자 ]</th>
					<th>[ 숫자 ]</th>
					<th>[ 숫자 ]</th>
					<th>[ 숫자 ]</th>
					<th>[ 숫자 ]</th>
				</tr>
				<tr>
					<th>[ 숫자 ]</th>
					<td class="block" id="1">OFF</td>
					<td class="block" id="2">OFF</td>
					<td class="block" id="3">OFF</td>
					<td class="block" id="4">OFF</td>
					<td class="block" id="5">OFF</td>
				</tr>
				<tr>
					<th>[ 숫자 ]</th>
					<td class="block" id="6">OFF</td>
					<td class="block" id="7">OFF</td>
					<td class="block" id="8">OFF</td>
					<td class="block" id="9">OFF</td>
					<td class="block" id="10">OFF</td>
				</tr>
				<tr>
					<th>[ 숫자 ]</th>
					<td class="block" id="11">OFF</td>
					<td class="block" id="12">OFF</td>
					<td class="block" id="13">OFF</td>
					<td class="block" id="14">OFF</td>
					<td class="block" id="15">OFF</td>
				</tr>
				<tr>
					<th>[ 숫자 ]</th>
					<td class="block" id="16">OFF</td>
					<td class="block" id="17">OFF</td>
					<td class="block" id="18">OFF</td>
					<td class="block" id="19">OFF</td>
					<td class="block" id="20">OFF</td>
				</tr>
				<tr>
					<th>[ 숫자 ]</th>
					<td class="block" id="21">OFF</td>
					<td class="block" id="22">OFF</td>
					<td class="block" id="23">OFF</td>
					<td class="block" id="24">OFF</td>
					<td class="block" id="25">OFF</td>
				</tr>
			</table>
			<br/>
			<button onclick="save()">저장</button>
			<!-- <td><input class="block" type="text" value="OFF"></td> -->
		</div>	
	</body>
	<script>
		var answer = {};
		var idNum = 0;
		//console.log($('.block'));
		//console.log($('.block')[15]);
		$('.block').click(function(){
			if($(this).html() == "OFF"){
				//console.log($(this).attr("id"));
				idNum = $(this).attr("id");
				$(this).css({'background-color':'black'});
				$(this).css({'color':'black'});
				$(this).html("ON");
				//obj.key3 = "value3";
				//obj["key3"] = "value3";
				answer[idNum] = $(this);
				console.log(answer);
			} else if($(this).html() == "ON"){
				idNum = $(this).attr("id");
				$(this).css({'background-color':'white'});
				$(this).css({'color':'white'});
				$(this).html("OFF");
				//delete obj.key3;
				//delete obj[key3];
				delete answer[idNum];
				console.log(answer);
			}
		});
		
		function save(){
			for(var i=0; i<25; i++){
				//answer.  $('.block')[i];					
			}
			console.log(answer);
		}
		
	</script>
</html>