<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
	<title>로그인</title>
	<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
	<style>
		#loginTable{
			margin-top : 200px;
			width: 30%;
			max-width : 500px;
			min-width : 450px;
			margin-left: 35%;
			border: 3px solid gray;
			white-space: nowrap;
			box-shadow: 5px 5px 15px 5px;
		}
		#loginTable td{
			text-align: right;
			width: 60%;
			min-width : 250px;
			padding: 10px;
		}
		#loginTable th,h3{			
			padding: 10px;
		}
		#loginTable {
			/* background: url("./resources/loginImg.jpg") -35px 0px; */
			background: url("./resources/loginImg.jpg") 0px -10px;
			background-size: cover;
			background-repeat: no-repeat;
		}
		label{
		}
		#loginTable a:hover {
			font-weight: bold;
			color: blue;
		}
		#loginTable div:hover {
			cursor: pointer;			
			font-weight: bold;
			color:red;
		}
	</style>
	</head>
	<body>
		<jsp:include page="../main/top_Navi.jsp"/>
		<jsp:include page="../Member/idClickPopup.jsp"/>
		
	<form id="loginForm" action="login" method="post">
		<table id="loginTable">
			<tr>
				<th colspan="3">
					<h3>leadPet</h3>
				</th>
			</tr>
			<tr>
				<td>
					<label>아이디 </label>
				</td>
				<th style="text-align: left;">
					<input type="text" id="id" name="id" value="${id}" />
				</th>
				<th>
					<div id="login">로그인</div>
				</th>
			</tr>			
			<tr>
				<td>
					<label>비밀번호</label>							
				</td>
				<th style="text-align: left;">
					<input type="password" id="password" name="password" />
				</th>
				<th colspan="2">
					<div onclick="location.href='registForm'">회원가입</div>
				</th>
			</tr>
			<tr>
				<td colspan="2" style="color: grey">
					<a href="find-id-form">아이디 찾기</a>
					/
					<a href="change-pw-form">비밀번호 변경 </a> 
				</td>
			</tr>
		</table>
	</form>

	</body>
	<script>
		var msg = "${msg}";
		if(msg != '') {
			alert(msg);
			msg = '';
		}
		$('#login').click(function() {
			$('form').submit();
		});
		
	</script>
</html>