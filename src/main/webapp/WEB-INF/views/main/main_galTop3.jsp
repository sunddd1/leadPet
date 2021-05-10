<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<style>
			#galTop3{
				float: right;
				margin-right: 150px;
			}
		</style>
	</head>
	<body>
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
					content+="<tr><td><h2>베스트 포토 탑 3</h2></td></tr>";
					content+="<tr onclick='console.log("+list[i].bbs_idx+")'>";
					
					content+="<td id='photo"+i+"' onclick='boardDetail("+list[i].bbs_idx+")'>";
					content+="<img src=/photo/"+list[i].newFileName+" alt="+list[i].oriFileName+" width='300px' 'height='398px'/>";
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
	
	function boardDetail(idx) {

		window.open('GalleryDetail/'+idx,'GalleryDetailpop','width=800, height=600');
		location.href="./GalleryList";
	}
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