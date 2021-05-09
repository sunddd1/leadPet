<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<jsp:include page="../main/top_Navi.jsp"/>
		<div id = "writebutton_div">
			<button onclick="location.href='GalwriteForm?id=${sessionScope.loginId}' ">글쓰기</button>
				<c:forEach items="${GalleryList}" var="list">
				<table style='float:left; margin-right:5%; margin-top:1%;'>
					<tr>
					<td colspan='3'>
						<a onclick="GalleryDetail(${list.bbs_idx})"><img src="/photo/${list.newFileName}"  width='200px' height='200px'/></a>
					</td>
					</tr>
					<tr>
						<td>${list.nickname }</td>
						<td>${list.views }</td>
						<td>${list.reco_count }</td>
					</tr>
					<tr>
						<td>${list.bbs_subject }</td>
					</tr>
				</table>
				</c:forEach>
		</div>
	</body>
	<script>
		function GalleryDetail(bbs_idx){
			window.open('GalleryDetail/'+bbs_idx,'GalleryDetailpop','width=800, height=600');
		}
	</script>
</html>