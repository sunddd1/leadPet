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
			#main{
				border: 3px solid red;
				width: 100%;
			}
			#main th{
				border: 3px solid green;
			}

		</style>
	</head>
	<body>
		<h3>4조</h3>
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
				</th>
			</tr>
		</table>
		
	</body>
	<script>
	</script>
</html>