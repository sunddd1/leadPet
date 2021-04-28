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
			table,td{
				border: 1px solid navy;
				padding: 15px 10px;
			}
			table{
				width: 80%;
				height: 80%;
			}
			th,td,input{			
				font-size: 8pt;
			}
		</style>
	</head>
	<body>
		<h3>상세보기 폼</h3>
		<form action="regVaccin" method="POST">
			<table>
				<tr>
					<td colspan="3">${sche.content }</td>
					<th></th>
				</tr>
				<tr>	
					<th>${sche.subject }</th>
					<th colspan="2">${sche.cycle }</th>
				</tr>
				<tr>	
					<th>접종날짜 설정</th>
					<th><input type="date" name="date" value="${sche.d_day }" /></th>
					<th><input type="button" id="btn" value="등록"/></th>			
				</tr>
			</table>
			<input type="hidden" name="vac_idx" value="${sche.sche_idx }"/>
		</form>
		
	</body>
	<script>
		$('#btn').click(function() {
			opener.setData($('input[type="date"]').val());
			$('form').submit();

		});
	</script>
</html>