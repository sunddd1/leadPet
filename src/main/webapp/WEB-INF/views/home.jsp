<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>리드펫</title>
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<style>
			#main{
				width: 80%;
				margin-top: 50px;
				margin-bottom: 50px;
				min-width: 1200px;
			}
		</style>
	</head>
	<body>
		<jsp:include page="./main/top_Navi.jsp"/>
		<jsp:include page="./cal/popup.jsp"/>		
		<table id="main">
			<tr>
				<th>
					<jsp:include page="./main/main_calendar.jsp"/>
				</th>
				<th>
					<jsp:include page="./main/main_bbsTop5.jsp"/>
				</th>
			</tr>
			<tr>
				<th>
					<jsp:include page="./main/main_galTop3.jsp"/>
				</th>
				<th>
					<jsp:include page="./main/main_gameRank.jsp"/>
				</th>
			</tr>
		</table>
		
		<jsp:include page="./main/footerjsp.jsp"/>
	</body>
	<script>
	</script>
</html>