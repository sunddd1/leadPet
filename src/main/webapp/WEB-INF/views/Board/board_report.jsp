<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>
			table,td, th{
				border: 1px solid black;
				border-collapse: collapse;
				padding: 5px 10px;
				text-align: center;
			}
			#report_content{
				width: 100%;
			}	
		</style>
	</head>
	<body>
		<h3>게시글 신고</h3>
		<form action="BoardReport" method="post">
			<input id="report_bbs_idx" name="bbs_idx" value="${map.bbs_idx}" style="display: none"/>
			<input id="report_type" name="type" value="${map.type}"  style="display: none" />
			<table>
				<tr>
					<th>신고자</th>
					<td><input id="loginId" name="loginId" value="${map.id}" readonly/></td>
				</tr>
				<tr>
					<td>신고 사유</td>
					<td cospan="5">
						<textarea name="reason" rows="10" cols="50" style="resize: none;"></textarea>
					</td>
				</tr>
			</table>
			<input type="button" value="신고하기"/>
		</form>
	</body>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script>
		var msg = "${msg}";
		console.log(msg)
		if(msg!=""){
			alert(msg);
			self.close();
		}
		
		
		$("input[type='button']").click(function(){
			opener.sendMsg("신고가 되었습니다");
			$('form').submit();
			window.close();
		})
	</script>
</html>