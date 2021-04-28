<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>탈퇴 계정 복구</title>
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<style></style>
	</head>
	<body>
		<form action="restore" method="post">
			<table>
				<tr>
					<td>
						<div>
							<label>비밀번호</label><br/>
							<input type="password" id="pw" name="pw" />
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<input type="button" value="계정복구" id="restore"/>
					</td>
				</tr>
			</table>
		</form>
	</body>
	<script>
	$("#restore").click(function(){
		if($("#pw").val() == "") {
			alert("비밀번호를 입력하세요.");
			$("#pw").focus();
		}else{
			$.ajax({
				type : "POST",
				url:"checkPw",
				data : "pw" : $("#pw").val()
				datatype : "json",
				success : function(result){
					console.log(result);
					
					if(result==="pwConfirmOK"){
						$('#pwMsg').html('');
						chk1=true;
					}else{
						$('#pwMsg').html(''); 
						chk1 = false;
					}
				},
				error : function(error){
					console.log("error : "+error);
				}
			});
		}
	});
	
	var msg = "${msg}";
	if(msg!=""){
		alert(msg);
	}
	</script>
</html>