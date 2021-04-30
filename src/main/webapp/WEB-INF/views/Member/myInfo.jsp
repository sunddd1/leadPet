<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
	<title>내 정보</title>
	<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
	<style>
		table, th, td {
			border : 1px solid black;
		}
	</style>
	</head>
	
	
	<body>
		<table>			
			<tr>
				<th colspan="2">
					<h2>내정보</h2>
				</th>
			</tr>
			<tr>
				<th>
					<label>아이디</label>
				</th>
				<td>
					<input type="text" name="id" id="id" value='${member.id }' readonly />
				</td>
			</tr>
			<tr>
				<th>
					<label>이름</label>
				</th>
				<td>
					<input type="text" name="name"id="name" value='${member.name }' readonly/>
				</td>
			</tr>
			<tr>	
				<th>
					<label>나이</label>
				</th>
				<td>					
					<input type="text" name="age" id="age" value='${member.age }' readonly/>
				</td>
			</tr>
			<tr>
				<th>
					<label>닉네임</label>
				</th>
				<td>
					<input type="text" name="nickname" id="nickname" value='${member.nickname }' readonly/>
				</td>
			</tr>			
			<tr>
				<th>
					<label>성별</label> 
				</th>
				<td>
					<c:if test="${member.gender eq '남' }">
						<input type="radio" name="gender" value="남" id="male" checked />남
						<input type="radio" name="gender" value="여" id="female" disabled />여	
					</c:if>
					<c:if test="${member.gender eq '여' }">
						<input type="radio" name="gender" value="남" id="male" disabled/>남
						<input type="radio" name="gender" value="여" id="female" checked />여	
					</c:if>
				</td>
			</tr>
			<tr>
				<th>
					<label>이메일</label><br>
				</th>
				<td>
					<input type="text" name="email" value='${member.email }' readonly/>
				</td>
			</tr>
			<tr>
				<th>
					<label>가입일</label>
				</th>
				<td>
					<input type="text" name="reg_date" value='${member.reg_date }' readonly/>
				</td>
			</tr>
			<tr>
				<th>
					<label>포인트</label>
				</th>
				<td>
					<input type="text" name="point" value='${member.point }' readonly/>
				</td>
			</tr>
			<tr>
				<th>
					<label>등급</label>
				</th>
				<td>
					<input type="text" name="grade" value='${member.grade }' readonly/>
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<form action="member-update-form" method="post">
						<input type="hidden" name="id" value='${member.id }'/>
						비밀번호
						<input type="password" name="password" id="password"/>
						<br/>
						<input type="submit" value="회원 정보 수정">
					</form>
				</th>
			</tr>
		</table>
	</body>
	<script>
		var msg = "${msg}";
		if(msg != '') {
			alert(msg);
			msg = '';
		}
		
		// 비동기로 해보자.
	</script>

</html>

