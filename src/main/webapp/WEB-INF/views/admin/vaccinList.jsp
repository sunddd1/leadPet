<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<style>
			#vacc, #vacc td, #vacc th{
				font-size: 10pt;
				border: 1px solid;
				border-collapse: collapse;
				padding: 5px 10px;
			}
			#vacc{
				width: 100%;
			}
			#vaccSearchbar{
				width: 100%;
				border: 2px solid lightgray;
				margin: 25px;
				padding: 50px;
				box-shadow: 0 4px 4px -4px black;

			}
			
			#vaccinManage{
				background-color: coral;
			}			
			
		</style>
	</head>
	<body>
		<h3>백신 게시판</h3>
		<jsp:include page="../main/top_Navi.jsp"/>
		<table>
			<tr>
				<td>
					<jsp:include page="../main/side_adminNavi.jsp"/>
				</td>
				<td>					
					<div id="vaccSearchbar">
						백신 이름 검색 : <input type="text" id="VaccSearch"/><button id="searchBtn">SEARCH</button>
					<button style="margin: 5px; float: right;" onclick='window.open("./regVaccForm","","width=600,height=400,left=300,top=300")'>등록</button>
					<c:if test="${list eq '[]'}">
						<h3>해당 검색에 대한 게시물이 없습니다.</h3>
					</c:if>
					
					<c:if test="${list ne '[]' }">			
					<table id="vacc">
						<tr>
							<th>이름</th>
							<th>내용</th>
							<th>주기</th>
							<th>
							</th>
						</tr>			
						<c:forEach items="${list}" var="vacc">
							<tr>
								<td>${vacc.vacc_name }</td>
								<td>${vacc.content }</td>
								<td>${vacc.cycle } 주</td>
								<td>
									<button onclick='window.open("./regVaccDetail?vacc_idx=${vacc.vacc_idx}","","width=600,height=400,left=300,top=300")'>수정 </button> 
									<button onclick='location.href="./deleteVacc?vacc_idx=${vacc.vacc_idx}"'> 삭제</button>
								</td>
							</tr>
						 </c:forEach>
					</table>					
					</c:if>
					</div>
				</td>
			</tr>
		</table>		
	</body>
	<script>
		$('#searchBtn').click(function() {
			var text = $('#VaccSearch').val();
			console.log(text);
			location.href="./VaccSearch?keyword="+text;
		});
	</script>
</html>