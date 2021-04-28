<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원탈퇴</title>
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<style></style>
	</head>
	<body>
		
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
						<input type="button" value="회원탈퇴" id="withdrawal"/>
					</td>
				</tr>
			</table>
		
	</body>
	<script>
	$("#withdrawal").click(function(){
		if($("#pw").val() == "") {
			alert("비밀번호를 입력하세요.");
			$("#pw").focus();
		}else{
			$.ajax({
				type : "POST",
				url:"withdraw",
				data : {
				"pw" : $("#pw").val()
				},
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