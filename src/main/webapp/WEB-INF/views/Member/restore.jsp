<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>탈퇴 계정 복구</title>
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<style>
			#restoreForm{
				width: 60%;
				margin-top : 20%;
			}		
			
			#draw{
				background-color: lightcoral;
				color: white;
				font-weight: bold;
			}
		
			input {
				width: 300px;
				margin: 5px;
				height: 35px;
			}
			
			#table{
				width: 60%;
				margin-left: 60%;
				margin-top : 20%;
			}
		</style>
	</head>
	<body>
		<jsp:include page="../main/top_Navi.jsp"/>
		<jsp:include page="../main/side_myNavi.jsp"/>
		
		<form id="restoreForm" action="restore" method="post">
			<table id="table">
				<tr>
					<td>
						<div>
							<label>비밀번호</label><br/>
							<input type="password" id="pw" name="pw" placeholder="비밀번호를 입력해주세요." />
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
	var msg = "${msg}";
	if(msg!=""){
		alert(msg);
		msg = "";
	}
	
	$("#restore").click(function() {
		if($("#pw").val() == "") {
			alert("비밀번호를 입력하세요.");
			$("#pw").focus();
			return;
		}
		
		$("#restoreForm").submit();
	});

	
	
	</script>
</html>