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
		<table>
			<tr>
				<td>
					<form action="restore" method="post">
						<div>
							<label>비밀번호</label><br/>
							<input type="password" id="pw" name="pw" />
						</div>
					</form>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<input type="button" value="계정복구" id="restore"/>
				</td>
			</tr>
		</table>
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
				data : pw,
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
	</script>
</html>