<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<style></style>
	</head>
	<body>
		<table>
			<tr>
				<td>
					<form action="withdraw" method="post">
						<div>
							<label>비밀번호</label><br/>
							<input type="password" id="pw" name="pw" />
						</div>
					</form>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<input type="button" value="회원탈퇴" id="membership_withdrawal"/>
				</td>
			</tr>
		</table>
	</body>
	<script>
	$("#login").click(function() {
		if ($("#pw").val() == "") {
			alert("비밀번호를 입력하세요.");
			$("#pw").focus();
		}else{
			$.ajax({
				type : 'POST',
				url : 'withdrawal',
				data : {
					"pw" : $("#pw").val()
				},
				success : function(data){
					console.log(data);
					if(data=='{"use":true}'){
						loction.href="./login";
					}
				}
			});
		}
	}
	</script>
</html>