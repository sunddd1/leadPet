<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<style>
			#bbsTop5{
				width: 100%;
				text-align: left;
			}
		</style>
	</head>
	<body>
		<table id="bbsTop5">
			<tr>
				<td colspan="2">
					<h2>베스트 게시물 탑 5</h2>
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>작성자</td>
			</tr>
		</table>
	</body>
	<script>
	$(document).ready(function () {
		console.log("탑5 요청");
		$.ajax({
			type:'post'
			,url:'mainTop'
			,data:{
				"type":'bbs'
			}
			,dataType:'json'
			,success : function(data) {
				console.log(data);
				var list = data.list;
				for (var i = 0; i < list.length; i++) {					
					var content="";
					content+="<tr onclick='console.log("+list[i].bbs_idx+")'>";
					
					content+="<td>";
					content+=list[i].bbs_subject;
					content+="</td>";
					
					content+="<td>";
					content+=list[i].nickname;
					content+="</td>";
					
					content+="</tr>";
					$('#bbsTop5').append(content);
				}
			}
			,error : function(e) {
				console.log(e);
			}
		});
		
	});
	</script>
</html>