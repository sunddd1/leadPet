<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>반려동물 등록</title>
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<style>
			table, td{
			border: 1px solid black;
			border-collapse: collapse;
			padding: 5px 10px;
			text-align:center;
			}
			
			input[type='text']{
			width:100%;
			}
			
			table{
			width:100%;
			}
			
			#editable{
				width:98%;
				height:500px;
				border:1px solid gray;
				text-align:left;
				overflow:auto;
				margin:5px;
			}
		</style>
	</head>
	<body>
		<h3>반려동물 등록</h3>
		<hr/>
		<form action="petPlus" method="post">
			<table>
				<tr>
					<th>제목</th>
					<td><input type="text" name="subject" value=""/></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="user_name" value=""/></td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<!-- div에 있는 녀석은 서버로 보낼 수 없다. -->
						<div id="editable" contenteditable="true"></div>
						<input type="hidden" id="content" name="content" value=""/>
					</td>
				</tr>
				<tr>
					<th>파일 첨부</th>
					<td>
					<input type="button" value="파일 업로드" onclick="fileUp()"/>
					</td>
				</tr>
				<tr>
					<td colspan="2"><input id="save" type="button" value="글 작성"/></td>
				</tr>
			</table>
		</form>
	</body>
	<script>
	
	$("#save").click(function(){
		//editable에 있는 내용을 content의 value에 넣기 
        /* var val = $('#editable').val();
		console.log(val);
        $('#content').html(val); */
        $("#editable a").find("b").remove();
        $("#editable a").removeAttr('onclick');
        $("#content").val($("#editable").html()); 
        $("form").submit(); 
	});
	
	function fileUp() {
		window.open('uploadFormPet','file upload','width=400,height=100');
	}
	
	
	</script>
</html>