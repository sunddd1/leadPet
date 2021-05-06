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
				width: 60%;
				margin-left: 20%;
		}
	</style>
	</head>
	<body>
		<jsp:include page="../main/top_Navi.jsp"/>
		<jsp:include page="../main/side_myNavi.jsp"/>
		<jsp:include page="../Member/idClickPopup.jsp"/>
		
		<table id="loginTable">
			<tr>
				<td>
					<h3>leadPet</h3>
				</td>
			</tr>
			<tr>
				<td>
					<form id="loginForm" action="login" method="post">
						<div>
							<label>아이디 
							<!-- 임시 테스트용 -->
							<a href="javascript:void(0)" onclick="idClickPopup('withdrawal', 'withdrawal')">test123</a>
							</label
							><br/>
							<input type="text" id="id" name="id" value="${id}" />
						</div>
						<div>
							<label>비밀번호 pass</label>
							<br/>
							<input type="password" id="password" name="password" />
						</div>
					</form>
				</td>
			<tr>
				<td colspan="3" style="color: lightgray">
					<a href="find-id-form">아이디 찾기</a>
					/
					<a href="change-pw-form">비밀번호 변경 </a> -->
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<input type="button" value="로그인" id="login" onclick="login()"/>
					<br/>
					<input type="button" value="회원가입" onclick="location.href='registForm'"/>
				</td>
			</tr>
		</table>

	</body>
	<script>
		var msg = "${msg}";
		if(msg != '') {
			alert(msg);
			msg = '';
		}

		function login() {		
			$("#loginForm").submit();
		}
		
	</script>
</html>