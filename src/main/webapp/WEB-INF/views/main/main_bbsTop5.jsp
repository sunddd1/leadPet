<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<style>
			#bbsTop5{
				width: 100%;
				border: 1px solid;
				padding : 10px;
				box-shadow: 0 4px 4px -4px black;		
			}
			#bbsTop5 th{
				text-align:center; 
				white-space: nowrap;
				overflow: hidden;
				text-overflow: ellipsis;
			}
		</style>
	</head>
	<body>
		<h2>베스트 게시물 탑 5</h2>
		<table id="bbsTop5">
			<tr>
				<th>제목</th>
				<th>작성자</th>
			</tr>
			<tr>
				<td colspan="2"><hr/></td>
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
					// ./BoardDetail?bbs_idx="+list[i].bbs_idx+
					content+="<th onclick='boardDetail("+list[i].bbs_idx+")'>";
					content+=list[i].bbs_subject;
					content+="</th>";
					
					content+="<th>";
					content+=list[i].nickname;
					content+="</th>";
					
					content+="</tr>";
					$('#bbsTop5').append(content);
				}
			}
			,error : function(e) {
				console.log(e);
			}
		});
		
	});
	
	function boardDetail(idx) {
		location.href="./BoardDetail?bbs_idx="+idx;
	}
	</script>
</html>