<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>
			table,td, th{
				border: 1px solid black;
				border-collapse: collapse;
				padding: 5px 10px;
				text-align: center;
			}
		</style>
	</head>
	<body>
	
		<h3>신고</h3>
		<form action="http://192.168.0.24:8080/main/replyReport" method="POST">
		<table>
			<tr>
				<th>신고자</th>
				<th>	<input name="loginId" value="${sessionScope.loginId}" readonly/></th>
			</tr>
			<tr>
				<td>신고사유</td>
				
				<td style="display: none"><input name="reply_idx" value="${reply_idx}" style="display: none"/></td>
				<td style="display: none" ><input name="type" value="${type}"  style="display: none" /></td>
				<td>
					<textarea name="reason" rows="10" cols="50" style="resize: none;"></textarea>
				</td>
			</tr>
		</table>
		</form>
		<input type="button" value="신고하기"/>
	</body>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script>
	$("input[type='button']").click(function(){
		console.log(this);
		$('form').submit();
	})
	var msg = "${msg}";
		console.log(msg)
		if(msg!=""){
			alert(msg);
			window.close();
		}
	</script>
</html>