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
			text-align: left;
		}
	</style>
	<body>
		<table>
			<tr>
				<td>아이디</td>
					<td>
						<input type="text" id="id" placeholder="아이디"/>
						<input type="button" id="idCheck" value="아이디 중복 체크"/>
						<input type="hidden" id="idVal" value=""/>
					</td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td>
						<input type="text" id="nickname" placeholder="닉네임"/>
						<input type="button" id="nickCheck" value="닉네임 중복 체크"/>
						<input type="hidden" id="nickVal" value=""/>
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>
						<input type="text" id="pw" placeholder="비밀번호" value=""/>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center">
						<button id="save">등록</button>
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
		
		$("#idCheck").click(function(){
			var id = $("#id").val();
				$.ajax({ 
					type:'GET' 
					,url:'idCheck'
					,data: { "id": id }
					,dataType: 'json' 
					,success: function(data){
						if(data == 1){
							alert("사용 불가");
							$("#id").focus();
							$("#id").val("");
							$("#idVal").val(data);
						}else{
							alert("사용 가능");
							$("#idVal").val(data);
						}
					}
					,error: function(e){
						console.log(e);
					}
				});
		});
		
		$("#nickCheck").click(function(){
			var nickname = $("#nickname").val();
			$.ajax({ 
				type:'GET' 
				,url:'nickCheck'
				,data: { "nickname": nickname }
				,dataType: 'json' 
				,success: function(data){
					if(data == 1){
						alert("사용 불가");
						$("#nickname").focus();
						$("#nickname").val("");
						$("#nickVal").val(data);
					}else{
						alert("사용 가능");
						$("#nickVal").val(data);
					}
				}
				,error: function(e){
					console.log(e);
				}
			});
	});
	
		$("#save").click(function(){
			
			var id = $("#id").val();
			var nickname = $("#nickname").val();
			var pw = $("#pw").val();
			var allData = { "id": id, "nickname": nickname, "pw": pw };
			
			var idVal = $("#idVal").val();
			var nickVal = $("#nickVal").val();
			
			if(idVal != "" && nickVal != "" && pw != ""){
				$.ajax({ 
					type:'GET'
					,url:'insert'
					,data:allData
					,dataType: 'json' 
					,success: function(data){
							if(data == 1 && idVal == 0 && nickVal == 0){
								alert("관리자 등록 완료");
								opener.parent.location.reload();
								window.close();
							}
					}
					,error: function(e){
						console.log(e);
					}
				});
			}else{
				alert("아이디/닉네임 중복체크 해주세요");
			}
		});
	</script>
</html>