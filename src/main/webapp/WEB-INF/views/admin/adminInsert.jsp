<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	</head>
	<style>
		table,td,th{
			border: 1px solid;
			border-collapse: collapse;
			padding: 5px 10px;
			text-align: center;
		}
	</style>
	<body>
		<table>
			<tr>
				<td>아이디</td>
					<td>
						<input type="text" id="id" placeholder="아이디"/>
						<input type="button" id="overlay" value="아이디 중복 체크"/>
					</td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td>
						<input type="text" id="nickname" placeholder="닉네임"/>
						<input type="button" id="overlay" value="닉네임 중복 체크"/>
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>
						<input type="text" id="pw" placeholder="비밀번호"/>
					</td>
				</tr>
		</table>
	</body>
	<script>
	</script>
</html>