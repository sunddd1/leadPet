<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>백신 리스트</title>
		<!-- 부트 스트랩, 반응형 디자인을 위한 CSS/js 라이브러리 -->
		
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<style>

			#vacc, #vacc td, #vacc th{
				font-size: 10pt;
				border: 2px solid lightgray;
				padding: 5px 10px;
			}
			#vacc{
				width: 100%;
			}
			.vaccContent{
				max-width: 200px;
				overflow: hidden;
				text-overflow: ellipsis;
				white-space: nowrap;				
			}
			#vaccSearchbar{
				border: 2px solid lightgray;
				margin: 25px;
				padding: 50px;
				box-shadow: 0 4px 4px -4px black;				
				width: 60%;
				margin-left: 20%;
			}
			
			#vaccinManage{
				background-color: lightpink;
			}		
		</style>
	</head>
	<body>
		<jsp:include page="../main/top_Navi.jsp"/>
		<jsp:include page="../main/side_adminNavi.jsp"/>
		<div id="vaccSearchbar">
			백신 이름 검색 : <input type="text" id="VaccSearch" value="${vaCkeyword }" /><button id="searchBtn">SEARCH</button>
			<button style="margin: 5px; float: right;" onclick='window.open("./regVaccForm","","width=600,height=400,left=300,top=300")'>등록</button>	
			<div id="notRs"></div>
			<table id="vacc">
				<tbody id="list">
				</tbody>
			</table>
		</div>
		<div class="container">
			<nav aria-label="page navigation" style="text-align: center;">
				<ul class="pagination" id="pagination"></ul>
			</nav>
		</div>
		
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
		<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
	</body>	
	<script>
		$('#searchBtn').click(function() {
			var text = $('#VaccSearch').val();
			console.log(text);
			location.href="./reqVaccSearch?keyword="+text;
		});
		
		 var showPage = 1;
		   
		   //몇개를 보여줄 것인지 / 몇페이지
		   listCall(showPage);//시작하자마자 이 함수를 호출 (20개씩 1페이지씩 보여줘라)
		   
	
		   
		   function listCall(reqPage){
				var keyword = "${keyword}";
				if(keyword==''){
					 keyword = $('#VaccSearch').val();
				}
				
				console.log(" keyword : "+keyword);
		      $.ajax({
		         url:'VaccSearch',
		         Type:'GET',
		         data:{
		        	"keyword":keyword
		        	,"pagePerCnt": 15
		        	,"page":reqPage
		         },
		         dataType:'JSON',
		         success:function(data){
		            console.log(data);
		            console.log(data.currPage);
		            console.log(data.range);
		            if(data.list.length>0){
			            showPage = data.currPage;
			            listPrint(data.list);
			            //pagePrint(data.range);
			            //플러그인 페이징 처리
			            $('#pagination').twbsPagination({
			            	startPage:data.currPage,//시작 페이지
			            	totalPages:data.range,//생성 가능 최대 페이지
			            	visiblepages:5,//5개씩 보여주겟다.
			            	onPageClick: function(evt,page){
			            		console.log(evt);
			            		console.log(page);
			            		listCall(page);
			            	}
			            });
		            	
		            }else{
		      	      $("#vacc").empty();
		    	      $("#notRs").append('<h1>검색 결과가 없습니다.</h1>');
		            }
		         },
		         error:function(error){
		            console.log(error);
		         }
		      });
		      
		   }
		   
		 function listPrint(list){
		    var content="";
		    console.log("리스트 사이즈 : "+list.length);
		    //"./regVaccDetail?vacc_idx=${vacc.vacc_idx}","","width=600,height=400,left=300,top=300"
			for(var i=0;i<list.length;i++){
		    	  
				content += "<tr>";
				content += "<td>"+list[i].vacc_name +"</td>";
				content += "<td class='vaccContent'>"+list[i].content+"</td>" ;
				console.log(list[i].vacc_name.indexOf('기초'));
				if(list[i].vacc_name.indexOf('기초')>-1){
					content += "<td>생후 "+list[i].cycle+" 주 이후</td>" ;					
				}else{
					content += "<td>"+list[i].cycle+" 주 마다</td>" ;					
				}
				content += "<td>"+list[i].vacc_cnt+" 회</td>" ;			
				content +="<td style='width: 120px;'>";
				content +="<button onclick='regVacc("+list[i].vacc_idx+")'>수정</botton>";
				content +="<button style='margin: 5px;' onclick='delVacc("+list[i].vacc_idx+")'>삭제</botton>";
				//content +="<button onclick='location.href="./deleteVacc?vacc_idx=${vacc.vacc_idx}"'> 삭제</button>";
				content +="</td>";
		        content += "</tr>";
		    }
		    $("#list").empty();
		    $("#list").append(content);
		}
		 
		function regVacc(vacc_idx) {
			console.log("vacc_idx : "+vacc_idx);
			window.open("./regVaccDetail?vacc_idx="+vacc_idx,"","width=600,height=400,left=300,top=300");
		}
		function delVacc(vacc_idx) {
			console.log("vacc_idx : "+vacc_idx);
			location.href="./deleteVacc?vacc_idx="+vacc_idx;
		}
	</script>
</html>