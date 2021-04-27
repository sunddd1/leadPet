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
					<td>
						<input type="text" name="oriPass" placeholder="현재 비밀번호"/>
					</td>
					<td rowspan="2">
						<input type="submit" id="save" value="저장"/>
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" name="newPass" placeholder="새 비밀번호"/>
					</td>
				</tr>
			</table>
	</body>
	<script>
	var msg = "${msg}";
	if(msg != ""){
		alert(msg);
		window.close();
	}

	$("#save").click(function(){
			$.ajax({ 
				type:'GET' 
				,url:'change'
				,dataType: 'json' 
				,success: function(data){
					console.log(data);
						window.close();
				}
				,error: function(e){
					console.log(e);
				}
			});
	});
	</script>
</html>