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
		#findIdForm{
			width: 30%;
			margin-left: 30%;
			margin-top : 200px;
			border-collapse: collapse;
		}
		#findIdForm, #findIdForm th, #findIdForm td {
			border : 1px solid black;
			text-align: center;
			padding: 10px;
		}
	</style>
	</head>
	<body>
		<jsp:include page="../main/top_Navi.jsp"/>
		<table id="findIdForm">
			<tr>
				<th colspan="2">
					<h2>아이디 찾기</h2>
				</th>
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
					<input type="button" value="아이디 찾기" onclick="findId()"/>
				</td>
			</tr>
			<tr>
				<th>
					<label>아이디</label>
				</th>
				<td>
					<input type="text" id="result" readonly/>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<a href="login-form">로그인하러 가기</a>
				</td>
			</tr>
		</table>
	</body>
	<script>
		function findId() {
			var name = $('#name').val();
			var email = $('#email').val();
			
			$.ajax({
				type:'get'
				,url:'find-id'
				,data:{"name" : name
						,"email" : email}
				,dataType:"JSON"
				,success:function(data) {
					if(data.result) {
						$('#result').val(data.id);
					} else {
						alert("조건에 맞는 아이디가 없습니다.");
					}
				}
				,error:function(e) {
					console.log("비동기 에러");
				}
			});
		}
	</script>
</html>