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
		<h2>베스트 포토 탑 3</h2>
		<table id="galTop3">
		</table>
	</body>
	<script>
	var imgContain = [];
	$(document).ready(function () {
		console.log("탑5 요청");
		$.ajax({
			type:'post'
			,url:'mainTop'
			,data:{
			"type":'gal'
			}
			,dataType:'json'
			,success : function(data) {
				console.log(data);
				var list = data.list;
				for (var i = 0; i < list.length; i++) {					
					var content="";
					content+="<tr onclick='console.log("+list[i].bbs_idx+")'>";
					
					content+="<td id='photo"+i+"'>";
					content+="<img src=/photo/"+list[i].newFileName+" alt="+list[i].oriFileName+"/>";
					content+="</td>";
					
					content+="</tr>";
					imgContain[i]= content;
					console.log(imgContain[i]);
				}
				$('#galTop3').append(imgContain[0]);
			}
			,error : function(e) {
				console.log(e);
			}
		});
		imgMove();
	});
	
	function imgMove() {
			console.log("이미지 움직이기");
			var i = 1;
			setInterval(() => {
				console.log("i 값은 : "+i)
				$('#galTop3').html('');
				$('#galTop3').append(imgContain[i]);
				i++;
				if(i==2){
					i=0;
				}
			}, 5000);
	}
	</script>
</html>