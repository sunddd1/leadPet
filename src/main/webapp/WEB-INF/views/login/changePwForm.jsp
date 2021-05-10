<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
	<style>
		#changeTable{
			width: 30%;
			margin-left: 20%;
			margin-top : 200px;
			border-collapse: collapse;
		}
		#changeTable, #changeTable th, #changeTable td {
			border : 1px solid black;
			text-align: center;
		}
		#resultTable{
			width: 30%;
			margin-left: 20%;
			margin-top : 200px;
			border-collapse: collapse;
		}
		#resultTable, #resultTable th, #resultTable td {
			border : 1px solid black;
			text-align: center;
		}
		
	</style>
	</head>
	<body>
		<jsp:include page="../main/top_Navi.jsp"/>
		
		<h2>아이디 찾기</h2>
		<form id="changeForm" action="change-pw" method="post">
			<table id="changeTable">
				<tr>
					<th>
						<label>아이디</label>
					</th>
					<td>
						<input type="text" id="id" name="id">
					</td>
				</tr>
				<tr>
					<th>
						<label>이름</label>
					</th>
					<td>
						<input type="text" id="name">
					</td>
				</tr>
				<tr>
					<th>
						<label>이메일</label>
					</th>
					<td>
						<input type="text" id="email">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="아이디 확인" onclick="existId()"/>
					</td>
				</tr>
			</table>
			<br/>
			<table id="resultTable" style="display:none">
				<tr>
					<th>
						<label>비밀번호</label><br/>
					</th>
					<td>
						<input type="password" name="password" id="password" onkeyup="checkPw()" width="400px"/>
					</td>
				<tr>
					<th>
						<label>비밀번호 확인</label>
					</th>
					<td>
						<input type="password" id="checkPassword" onkeyup="checkPw()" />
						<br/>
						<span id="checkPasswordMsg"><font color=red>비밀번호 불일치</font></span>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="변경 완료" onclick="changePw()"/>
					</td>
				</tr>
			</table>		
		</form>
	</body>
	<script>
		var validPw = false;
	
		function existId() {
			var id = $('#id');
			var name = $('#name');
			var email = $('#email');
			
			$.ajax({
				type:'get'
				,url:'exist-id'
				,data:{"id" : id.val()
						,"name" : name.val()
						,"email" : email.val()}
				,dataType:"JSON"
				,success:function(data) {
					if(data) {
						$('#resultTable').css({"display": ""});
						
						id.attr("readonly",true);
						name.attr("readonly",true);
						email.attr("readonly",true);
					} else {
						alert("조건에 맞는 아이디가 없습니다.");
					}
				}
				,error:function(e) {
					console.log(e);
				}
			});
		}
		
		//비밀번호 실시간 확인
		function checkPw() {
			var pwValue = $('#password').val();
			var checkPwValue = $('#checkPassword').val();
			var tag = '<font color=red>비밀번호 불일치</font>';
			validPw = false;

			if( pwValue != '' && checkPwValue
					&& pwValue === checkPwValue) {
				tag = "<font color=blue>비밀번호 일치</font>";
				validPw = true;
			}
			console.log(validPw);
			$('#checkPasswordMsg').html(tag);
		}
		
		function changePw() {
			if(validPw) {
				$('#changeForm').submit();
			} else{
				alert("비밀번호가 일치하지 않습니다.");				
			}
			
		}
	</script>
</html>