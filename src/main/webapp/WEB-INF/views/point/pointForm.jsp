<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
	<title>포인트 표</title>
	<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
	<style>
		#pointTable{
			width: 60%;
			margin-left: 20%;
		}
		#pointTable, #pointTable th, #pointTable td {
			border : 1px solid black;
		}
	</style>
	</head>
	
	
	<body>
		<jsp:include page="../main/top_Navi.jsp"/>
		<jsp:include page="../main/side_myNavi.jsp"/>
		
		<table id="pointTable">			
			<tr>
				<th>획득 기준</th>
				<th>획득 포인트</th>
				<th>획득 획득처</th>
			</tr>
		</table>
	</body>
	<script>
		// 최초 실행하는 함수들.
		$(document).ready(function() {
			importData();
		});

		function importData() {
			var datas = [
					// 획득 기준, 획득 포인트, 획득처
					["글 쓰기 1개당", "+1", "게시글 쓰기"],
					["댓글 쓰기 1개당", "+1", "댓글 쓰기"],
					["본인이 작성한 글에서 받은 추천 수", "+1", "게시글 추천"],
					["각 게임 랭킹 1등", "+50", "게임 랭킹"],
					["각 게임 랭킹 2,3등", "+30", "게임 랭킹"],
					["각 게임 랭킹 4 ~ 10등", "+10", "게임 랭킹"],
					["상식 퀴즈 정답 수", "+1", "상식퀴즈 정답"],
			]
			
			var $table = $('#pointTable');			
			datas.forEach(data => {
				$table.append(
					"<tr><th>" + data[0] + "</th><th>" + data[1] + "</th><th>" + data[2] + "</th></tr>"
				);
			});
			
		}
		
	</script>

</html>

