<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
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
						<input type="text" id="newPass" name="newPass" placeholder="새 비밀번호"/>
					</td>
				</tr>
				<tr>
					<td rowspan="2">
						<button id="save" value="저장">저장</button>
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
		var id = opener.oriWindow;
		console.log(id);
		var newPass = $("#newPass").val();
		var allData = {"newPass": newPass, "id": id };
			$.ajax({ 
				type:'GET' 
				,url:'change'
				,data:allData
				,dataType: 'json' 
				,success: function(data){
					if(data == 1){
					alert("변경 완료");
					opener.parent.location.reload();
					window.close();
					}
				}
				,error: function(e){
					console.log(e);
				}
			});
	});
	</script>
</html>