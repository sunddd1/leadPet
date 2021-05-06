<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>
			ul.tabs{
				margin: 0px;
				padding: 0px;
				list-style: none;
			}
			ul.tabs li{
				background: none;
				color: #222;
				display: inline-block;
				padding: 10px 15px;
				cursor: pointer;
			}
			
			ul.tabs li.current{
				background: #ededed;
				color: #222;
			}
			
			.tab-content{
				display: none;
				background: #ededed;
				padding: 15px;
			}
			
			.tab-content.current{
				display: inherit;
			}
		</style>
	</head>
	<body>
		<ul class="tabs">
			<li data-tab="dog" class='tabmenu'>강아지</li>
			<li data-tab="cat" class='tabmenu'>고양이</li>
			<li data-tab="all" class='tabmenu current'>전체보기</li>
		</ul>
		<button onclick="location.href='writeForm?id=test1122' ">글쓰기</button>
			<table>
			<thead>
				<tr>
					<th>글번호</th>
					<th>사진</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
<!-- 					<th>삭제</th> -->
				</tr>
			</thead>
			<tbody id="list">
				
			</tbody>
			</table>

	</body>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script>
		var msg = "${msg}";
		console.log(msg)
		if(msg!=""){
			alert(msg);
		}	
	
		ListAll();
		
		function ListAll() {
			$.ajax({
				url:'./BoardTab/all'
				,type:'GET'
				,data:{}
				,dataType:'JSON'
				,success:function(data){
					console.log(data.tab);
					listPrint(data.tab);
				}
				,error:function(error){
					console.log(error);
				}
			});
		}
	
		$(function(){
			$('.tabmenu').click(function() {
				var activeTab = $(this).attr('data-tab');
				console.log(activeTab);
				$('ul.tabs li').removeClass('current');
				$(this).addClass('current');
				$.ajax({
						url:'./BoardTab/'+activeTab
						,type:'GET'
						,data:{}
						,dataType:'JSON'
						,success:function(data){
							console.log(data.tab);
							listPrint(data.tab);
						}
						,error:function(error){
							console.log(error);
						}
					});
			})
		})
/* 		
		function BoardDel(elem){
			$.ajax({
				url:'./BoardDel'
				,type:'GET'
				,data:{}
				,dataType:'JSON'
				,success:function(data){
					console.log(data.tab);
				}
				,error:function(error){
					console.log(error);
				}
			});
		} */
		

	  	var BoardDetail="BoardDetail"
		
		function listPrint(list){
			var content ="";
			console.log(list);
			
			for(var i=0; i<list.length; i++){
					content +="<tr>"
					content +="<td>"+list[i].bbs_idx+"</td>"
					content += "<td><a href='./BoardDetail?bbs_idx="+list[i].bbs_idx+"'><img src='/photo/"+list[i].newFileName+"' ' width='300px' 'height='398px'/></a></td>" 
					content +="<td><a href='./BoardDetail?bbs_idx="+list[i].bbs_idx+"'>"+list[i].bbs_subject+"</a></td>"
					content +="<td onclick='idClickPopup("+list[i].id+","+list[i].nickname+")'>"+list[i].nickname+"</td>"
					//java에서 가끔 날짜가 mileseconds로 나올경우...
					var date = new Date(list[i].reg_date);
					content +="<td>"+date.toLocaleDateString("ko-KR")+"</td>"
					/* content +="<td><a href='#' onclick='BoardDel(this)' '>x</a></td>" */
				content +="</tr>"
			}
			$("#list").empty();
			$("#list").append(content);
		}

	</script>
</html>