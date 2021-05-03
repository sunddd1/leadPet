<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<style>
			#resultPage{
				border: 1px solid red ;
				width: 100%;
				min-width: 1000px;
			}
			.bbscontent{
				border: 3px solid ;
				width: 100%;
				max-width: 800px;
			}
		</style>
	</head>
	<body>
		<h3>검색 결과2</h3>		
		<jsp:include page="./top_Navi.jsp"/>
		<c:if test="${list eq '[]'}">
			<h3>해당 검색에 대한 내용이 없습니다.</h3>
		</c:if>
		<c:if test="${list ne '[]'}">
			<table id="resultPage">
				<tr>
				<c:forEach items="${list}" var="bbs" begin="0" end="3">
						<td>
							<table class="bbscontent">
								<tr>
									<td>${bbs.category_name}</td>
									<td>조회수 ${bbs.views}</td>
									<td>추천 ${bbs.reco_count}</td>
								</tr>	
								<tr>
									<td colspan="3"><h3>${bbs.bbs_subject}</h3></td>
								</tr>	
								<tr>
									<td colspan="3" style="color: blue">${bbs.nickname}</td>
								</tr>
							</table>
						</td>
				</c:forEach>
				</tr>
				<tr>
				<c:forEach items="${list}" var="bbs" begin="4" end="7">
						<td>
							<table class="bbscontent">
								<tr>
									<td>${bbs.category_name}</td>
									<td>조회수 ${bbs.views}</td>
									<td>추천 ${bbs.reco_count}</td>
								</tr>	
								<tr>
									<td colspan="3"><h3>${bbs.bbs_subject}</h3></td>
								</tr>	
								<tr>
									<td colspan="3" style="color: blue">${bbs.nickname}</td>
								</tr>
							</table>
						</td>
				</c:forEach>
				</tr>
				<tr>
				<c:forEach items="${list}" var="bbs" begin="8" end="11">
						<td>
							<table class="bbscontent">
								<tr>
									<td>${bbs.category_name}</td>
									<td>조회수 ${bbs.views}</td>
									<td>추천 ${bbs.reco_count}</td>
								</tr>	
								<tr>
									<td colspan="3"><h3>${bbs.bbs_subject}</h3></td>
								</tr>	
								<tr>
									<td colspan="3" style="color: blue">${bbs.nickname}</td>
								</tr>
							</table>
						</td>
				</c:forEach>
				</tr>
			</table>
		</c:if>
		<div id="paging">
			<a href="#">이전</a>
			<a href="#">1</a>
			<a href="#">2</a>
			<a href="#">3</a>
			<a href="#">4</a>
			<a href="#">5</a>
			<a href="#">다음</a>
		</div>
	</body>
	<script>
	</script>
</html>