<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>관심 유저</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
   
		<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

		<style>
			#interestTable, #interestTable td {
				border: 1px solid black;
			}
		</style>
	</head>
	<body>
		<jsp:include page="../main/top_Navi.jsp"/>
		<jsp:include page="../Member/idClickPopup.jsp"/>
	
		<h3>관심 유저</h3>
			<table id="interestTable">		
				<tbody id="list">
					<!-- 불러온 데이터 뿌리는 영역 -->
				</tbody>
				<tr>
					<td id="paging" colspan="6">
						<!-- 플러그인 사용 -->
						<div class="container">
							<nav aria-label="page navigation" style="text-align: center;">
								<ul class="pagination" id="pagination"></ul>
							</nav>
						</div>
						<!-- //플러그인 사용 -->
					</td>
				</tr>
			</table>

		<!-- 페이징 라이브러리 -->
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> 
		<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
	</body>
	<script>

	function deleteInterest(friendId) {
		if(friendId == null) {
			return;
		}
		
		$.ajax({
			type:'GET' 
			,url:'delete-interest-id'
			,data: {"interestId" : friendId}
			,dataType: 'json' 
			,success: function(data){
				if(data) {
					console.log("성공");
					$("#" + friendId).remove();
				}
				
			}
			,error: function(e){
				console.log(e);
			}
		});
	}
	
	
	var showPage = 1;

	listCall(showPage);
	
	function listCall(reqPage){
		var reqUrl = "./interest-users/" + '${sessionScope.loginId}' + "/6/"+reqPage;
		
		$.ajax({
			url:reqUrl,
			type:'GET',
			data:{},
			dataType:'JSON',
			success:function(data) {
				console.log(data);
				showPage = data.curPage;
				listPrint(data.list);
				//pagePrint(data.range);
				$("#pagination").twbsPagination({
					startPage:data.curPage, // 시작 페이지
					totalPages:data.range, // 생성 가능 최대 페이지
					visiblePages:5, // 5개씩 보여주겠따. (1~5)
					onPageClick:function(evt, page) { // 각 페이지를 눌렀을 경우
						//console.log(evt);
						//console.log(page);
						listCall(page);
					}
				})
			},
			error:function(error) {
				console.log(error);
			}		
		});
	}
	
	function listPrint(list) {
		var colLength = 2;
		var count = 0;

		$("#list").empty();
		
		for(var i=0; i<list.length; ++i, ++count) {
			var content = "";
			
			if(i % colLength == 0) {
				$("#list").append("<tr>");
			}
			
			content += "<td id=" + list[i].add_id + ">"
			content += "<img src='#' alt='petPost'/>"
			content += "<a href=\"javascript:void(0)\" onclick=\"idClickPopup(\'" + list[i].add_id + "\',\'" + list[i].nickname + "\')\">" + list[i].nickname + "</a>"
			content += "<button onclick=\"deleteInterest(\'" + list[i].add_id + "\')\">관심 유저 취소</button>"
			content += "</td>";
			
			if(i % colLength == 1) {
				console.log("닫음");
				content += "</tr>";
			}
			
			//console.log(content);
			$("#list").append(content);
		}
	}
	
	</script>
</html>
