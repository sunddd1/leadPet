<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/main/top_Navi.jsp" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>WeeklyNemoDetail</title>
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<style>
			#conBody{
				margin-left : 10%;
				width: 80%;
				margin-top: 100px;
				margin-bottom: 100px;
			}
			#nemoTable{
				border: 5px double grey;
				border-collapse: collapse;
				margin-left: 20%;
			}
			#nemoTable th, #nemoTable td{
				border: 1px solid black;
				border-collapse: collapse;
				width: 70px;
				height: 70px;
				font-size: 12px;
			}
			#subjectSpace{
				padding-top: 3%;
			}
			#nemoTable button{
				margin-right: 15px;
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
				<table id="nemoTable">
					<tr>
						<td colspan="11" style="text-align: right; border-top: 5px double white;border-right: 5px double white;border-left: 5px double white;">
							<c:if test="${lastNemo == null}">
								<button onclick="location.href='./gameWeek'">목록으로</button>				
							</c:if>
							<c:if test="${lastNemo != null}">
								<button onclick="location.href='./gameMain'">메인으로</button>				
							</c:if>
						</td>
					</tr>
					<tr>
						<th colspan="11" id="subjectSpace" style="	border-top: 5px double grey; ">
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
			<jsp:include page="/WEB-INF/views/main/footerjsp.jsp"/>	
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