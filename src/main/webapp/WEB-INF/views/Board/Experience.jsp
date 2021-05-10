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
			#exBBS{
				background-color: lightcoral;
				color: white;
				font-weight: bold;
			}
			#rsTable  {
				width: 60%;
				min-width : 1200px;
				margin-top: 50px;
				margin-left: 20%;
			}
			#rsTable td{
				padding: 5px 10px;
			}
			#rsTable td{
				max-width:400px;
				white-space: nowrap;
				overflow: hidden;
				text-overflow: ellipsis;
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
		<table id="rsTable">
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
		      var content="";

		        content += "<tr>"; 
		      for(var i=0;i<list.length;i++){
			        if(i%4==0){
						content += "<tr>";
			        }
				content += "<td>";
				content += "<table>";
				content += "<tr>";
				content += "<td><a href='./BoardDetail?bbs_idx="+list[i].bbs_idx+"'><img src='/photo/"+list[i].newFileName+"' alt='"+list[i].oriFileName+" ' width='300px' 'height='398px'/></a></td>" 
				content += "<tr>";
				content += "<td>"+list[i].category_name+ " &nbsp; &nbsp; &nbsp; &nbsp; 조회수 "+list[i].views+"</td>";
				content += "<tr>";
				content += "<td>추천 "+list[i].reco_count+"</td>";	
				content += "</tr>";
				content += "</tr>";
				content +="<td><a href='./BoardDetail?bbs_idx="+list[i].bbs_idx+"'>"+list[i].bbs_subject+"</a></td>"
				content += "<tr>";		
				content += "<td><a style='color: blue;' href=\"javascript:void(0)\" onclick=\"idClickPopup(\'" + list[i].nickname + "\')\">" + list[i].nickname + "</a></td>";
				content += "</tr>";
		        content += "</tr>";
				content += "</table>";
				content += "</td>";
		        if(i==3){
					content += "</tr>";
		        }
		      }

				content += "</tr>";
		      $("#list").empty();
		      $("#list").append(content);
		   }
	</script>
</html>