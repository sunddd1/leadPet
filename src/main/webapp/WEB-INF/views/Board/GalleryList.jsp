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
				<table style='float:left; margin-right:5%; margin-top:1%;'>
					<tr>
					<td colspan='3'>
						<a href='./BoardDetail?bbs_idx='><img src='/photo/'  width='200px' height='200px'/></a>
					</td>
					</tr>
					<tr>
						<td>name</td>
						<td>"+list[i].views+"</td>
						<td>"+list[i].reco_count+"</td>
					</tr>
					<tr>
						<td>subject</td>
					</tr>
				</table>
		</div>
	</body>
	<script>
	</script>
</html>