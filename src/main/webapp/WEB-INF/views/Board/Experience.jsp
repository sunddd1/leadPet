<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>
			#main{
				border: 3px solid red;
				width: 80%;
				margin-left:10%;
			}
			#main th{
			}
		
			ul.tabs{
			width: max-content;    
			margin-top:5%;
            margin-right: 13%;
            margin-left: 13%;
			}
			
			ul.tabs li{
				width: max-content;
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
			#writebutton_div{
				text-align:right;
				padding-right: 25%;
			}
			#list{
				width: 80%;
				margin-top:1%;
				margin-left: 14%;
			}
			
			
		</style>
	</head>
	<body>
		<jsp:include page="../main/top_Navi.jsp"/>
		<jsp:include page="../Member/idClickPopup.jsp"/>
		<ul class="tabs">
			<li data-tab="dog" class='tabmenu'>강아지</li>
			<li data-tab="cat" class='tabmenu'>고양이</li>
			<li data-tab="all" class='tabmenu current'>전체보기</li>
		</ul>
		<div id = "writebutton_div">
			<button onclick="location.href='writeForm?id=${sessionScope.loginId}' ">글쓰기</button>
		</div>
		<div id="list">
			
		</div>
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
					content +="<table style='float:left; margin-right:5%; margin-top:1%;'>"
					content +="<tr>"
					content += "<td colspan='3'><a href='./BoardDetail?bbs_idx="+list[i].bbs_idx+"'><img src='/photo/"+list[i].newFileName+"' ' width='200px' 'height='200px'/></a></td>" 
					content +="<tr><td>"+list[i].category_name+"</td>"
					content +="<td>"+list[i].views+"</td>"
					content +="<td>"+list[i].reco_count+"</td></tr>"
					content +="<tr><td><a href='./BoardDetail?bbs_idx="+list[i].bbs_idx+"'>"+list[i].bbs_subject+"</a></td></tr>"
					content +="<td>"+list[i].nickname+"</td>"
					content +="<td>"+list[i].bbs_idx+"</td>"
					//content +="<td onclick='idClickPopup("+list[i].id+","+list[i].nickname+")'>"+list[i].nickname+"</td>"
					//java에서 가끔 날짜가 mileseconds로 나올경우...
					var date = new Date(list[i].reg_date);
					content +="<td>"+date.toLocaleDateString("ko-KR")+"</td>"
					/* content +="<td><a href='#' onclick='BoardDel(this)' '>x</a></td>" */
					content +="</tr>"
					content +="</table>"
			}
			$("#list").empty();
			$("#list").append(content);
		}

	</script>
</html>