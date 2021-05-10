<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>검색 결과 페이지</title>
		<!-- 제이쿼리 -->
		
		<!-- 부트 스트랩, 반응형 디자인을 위한 CSS/js 라이브러리 -->
		<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<style>
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
			#paging{
				text-align: center;
			}
		</style>
		
	</head>
	<body>
		<jsp:include page="../main/top_Navi.jsp"/>
		<jsp:include page="../Member/idClickPopup.jsp"/>
		<table id="rsTable">
			<tbody id="list">
			</tbody>
			<tr>
				<td id="paging" colspan="6">
					<!-- 플러그인 사용 -->
					<div class="container">
						<nav aria-label="page navigation" style="text-align: center;">
							<ul class="pagination" id="pagination"></ul>
						</nav>
					</div>
					<!-- //플러그인 사용 -->
				</td>
			</tr>
		</table>
	</body>
	
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
		<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
	<script>
   
	   var showPage = 1;
	   
	   //몇개를 보여줄 것인지 / 몇페이지
	   listCall(showPage);//시작하자마자 이 함수를 호출 (20개씩 1페이지씩 보여줘라)
	   
	   $("#pagePerNum").change(function(){//select box의 값을 변경 할 때 마다 실행
		   $('#pagination').twbsPagination('destroy');//이 구문이 없으면 페이지당 갯수 조정시 페이징 변경이 일어나지 않는다
	      listCall(showPage);
	   });
	   
	   function listCall(reqPage){
	      //restful service 는 ajax 를 통해 호출하여 사용하는 경우가 많지만
	      //그렇다고 restful service == ajax 라고 생각해서는 안된다.
	      var reqUrl = './list/'+$("#pagePerNum").val()+"/"+reqPage;
			var category= "${category}";
			var keyword = "${keyword}";
			if(category==''){
				category= $('select').first().val();
			}
			if(keyword==''){
				 keyword = $('#searchBar').val();
			}
			console.log(" 카테 : "+category+keyword);
	      $.ajax({
	         url:'searchBbs',
	         Type:'GET',
	         data:{
	        	 "category":category
	        	,"keyword":keyword
	        	,"pagePerCnt": 12
	        	,"page":reqPage
	         },
	         dataType:'JSON',
	         success:function(data){
	            console.log(data);
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
	      	      $("#rsTable").empty();
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

	        content += "<tr>"; 
	      for(var i=0;i<list.length;i++){
		        if(i%4==0){
					content += "<tr>";
		        }
			content += "<td>";
			content += "<table>";
			content += "<tr>";
			content += "<td><a href='./BoardDetail?bbs_idx="+list[i].bbs_idx+"'><img src='/photo/"+list[i].newFileName+"' alt='"+list[i].oriFileName+" ' width='300px' height='398px'/></a></td>" 
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