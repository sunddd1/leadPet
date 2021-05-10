<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>
			#galllery_content{
				margin-left: 20%;
				width:60%;
				margin-top: 100px
			}
			
			#write_button{
				text-align: right;
				width:100%;
				margin-bottom: 50px;
			}
			#rsTable{
				border: 1px solid black;
				border-radius: 10%;
				width: 300px;
				height: 250px;
			}
			#gal_img{
				padding-left: 45px;
			}
			#gallBBS{
				background-color: lightcoral;
				color: white;
				font-weight: bold;
			}

			
		
		</style>
	</head>
	<body>
		<jsp:include page="../Member/idClickPopup.jsp"/>
		<jsp:include page="../main/top_Navi.jsp"/>
		<div id = "galllery_content">
			<div id="write_button">
				<button onclick="location.href='GalwriteForm?id=${sessionScope.loginId}' ">글쓰기</button>
			</div>
				<c:forEach items="${GalleryList}" var="list">
				<table id="rsTable"  style='float:left; margin-right:5%; margin-top:1%;'>
					<tr>
					<td colspan='4' id="gal_img">
						<a onclick="GalleryDetail(${list.bbs_idx})"><img src="/photo/${list.newFileName}"  width='200px' height='200px'/></a>
					</td>
					</tr>
					<tr>
						<td colspan="4" style="color: blue; text-align: center;" onclick='idClickPopup("${list.nickname}")'>${list.nickname }</td>
					</tr>
					<tr>
						<th>조회수</th>
						<td>${list.views }</td>
						<th>추천수</th>
						<td>${list.reco_count }</td>
					</tr>
					<tr>
						<th colspan="4" style="text-align: center;">${list.bbs_subject }</th>
					</tr>
				</table>
				</c:forEach>
		</div>
	</body>
	<script>
		function GalleryDetail(bbs_idx){
			window.open('GalleryDetail?bbs_idx='+bbs_idx,'GalleryDetailpop','width=800, height=400,top=300,left=550');
		}
	</script>
</html>