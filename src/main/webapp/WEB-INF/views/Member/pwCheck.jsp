<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원탈퇴</title>
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<style>
			#withdrawTable{
					width: 60%;
					margin-left: 20%;
					margin-top: 100px;
			}
			
			#draw{
				background-color: lightcoral;
				color: white;				
				font-weight: bold;
			}
		</style>
	</head>
	<body>
		<jsp:include page="../main/top_Navi.jsp"/>
		<jsp:include page="../main/side_myNavi.jsp"/>
		
		<form id="withdrawForm" action="withdraw" method="post">
			<table id="withdrawTable">
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
		</form>		
	</body>
	<script>
	var msg = "${msg}";
	if(msg!=""){
		alert(msg);
		msg = "";
	}
	
	$("#withdrawal").click(function() {
		if($("#pw").val() == "") {
			alert("비밀번호를 입력하세요.");
			$("#pw").focus();
			return;
		}
		
		$("#withdrawForm").submit();
	});
	
	
	
	</script>
</html>