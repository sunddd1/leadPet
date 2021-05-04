<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/main/top_Navi.jsp" %>
<%@ include file="/WEB-INF/views/main/side_adminNavi.jsp" %>           
<html>
	<head>
		<meta charset="UTF-8">
		<title>NemoDetail</title>
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<style>
			#side_Navi,#conBody{
				display: inline-block;
			}
			#conBody{
				margin: 5% 22%;
				width: 50%;
			}
			#btn{
				float: right;
				padding: 1%;
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
				width: 70px;
				height: 70px;
				font-size: 12px;
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
			#subjectSpace{
				padding-top: 2%;
			}
		</style>
	</head>
	<body>
		<div id="conBody">
			<div id="btn">
				<button onclick="location.href='./nemoUpdateForm?idx=${nemoDetail.nemo_idx}'">수정하기</button>
				<button onclick="location.href='./gameQueList'">목록으로</button>
			</div>
			<div id="nemoDiv">
				<table id="nemoTable">
					<tr>
						<th colspan="11" id="subjectSpace">
							<h2>네모 제목 : ${nemoDetail.nemo_subject}</h2>
						</th>
					</tr>
					<tr>
						<th>NemoLogic</th>
						<th>${qList.get(0)}</th>
						<th>${qList.get(1)}</th>
						<th>${qList.get(2)}</th>
						<th>${qList.get(3)}</th>
						<th style="border-right: 3px double">
							${qList.get(4)}
						</th>
						<th>${qList.get(5)}</th>
						<th>${qList.get(6)}</th>
						<th>${qList.get(7)}</th>
						<th>${qList.get(8)}</th>
						<th>${qList.get(9)}</th>
					</tr>
					<tr id="block0">
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
					<tr id="block1">
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
					<tr id="block2">
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
					<tr id="block3">
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
					<tr id="block4">
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
					<tr id="block5">
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
					<tr id="block6">
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
					<tr id="block7">
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
					<tr id="block8">
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
					<tr id="block9">
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
				</table>
			</div>	
		</div>	
	</body>
	<script>
		var aArray = [];
		aArray = "${aList}".split(",");
		console.log(aArray);
		for(var i=0; i<10; i++){
			var trBlock = $('#block'+i);
			//console.log(trBlock);
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
	</script>
</html>