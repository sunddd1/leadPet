<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<!-- 제이쿼리 -->
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		
		<!-- 부트 스트랩, 반응형 디자인을 위한 CSS/js 라이브러리 -->
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
		<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		
		
		<!-- 페이징 라이브러리(제이쿼리 플로그인이라 반드시 필요, 버전도 맞아야함.) -->
		<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
		<style>
			#rsTable  {
				width: 60%;
				margin-top: 10px;
				max-width: 900px;
				margin-left: 20%;
			}
			#rsTable ,#rsTable td{
				border: 1px solid;
				border-collapse: collapse;
				padding: 5px 10px;
			}
			#rsTable td{
				max-width:200px;
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
		<h3>List Page</h3>
		<div id="notRs"></div>
		<table id="rsTable">
			<thead>
				<tr>
					<td>글번호</td>
					<td>사진</td>
					<td>제목</td>
					<td>작성자</td>
					<td>작성일</td>
				</tr>
			</thead>
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
	        	,"pagePerCnt": 15
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
	      
	      for(var i=0;i<list.length;i++){
			content += "<tr>";
			content += "<td>"+list[i].bbs_idx +"</td>";
			content += "<td><a href='./BoardDetail?bbs_idx="+list[i].bbs_idx+"'><img src='/photo/"+list[i].newFileName+"' alt='photo/"+list[i].oriFileName+" ' width='300px' 'height='398px'/></a></td>" 
			content +="<td><a href='./BoardDetail?bbs_idx="+list[i].bbs_idx+"'>"+list[i].bbs_subject+"</a></td>"
			content += "<td>"+list[i].nickname+"</td>";
			var date = new Date(list[i].reg_date);
			content +="<td>"+date.toLocaleDateString("ko-KR")+"</td>"
			//java 에서 가끔 날짜가 milliseconds 로 나올 경우...
			//content += "<td>"+list[i].category_name+"</td>";
	        //content += "<td>"+list[i].views +"</td>";
	        //content += "<td>"+list[i].reco_count +"</td>";
	        //content += "<td>"+list[i].bbs_content+"</td>";
	        content += "</tr>";
	      }
	      $("#list").empty();
	      $("#list").append(content);
	   }
	   
/* 	   //정석적인 방법(요즘 잘 안씀)
	   function pagePrint(range){
	      console.log("생성가능 페이지 : "+range);
	      console.log("현재 페이지 : "+showPage);
	      var content="";
	      var start = 1;
	      var end = range>=5 ? 5 : range;
	      
	      //이전(5페이지가 넘어갔을때 나타나는 녀석)
	      if(showPage>5){
	         end = Math.ceil(showPage/5)*5;
	         if(end>range){
	        	 end=range;
	         }
	         
	         start = end-4;
	         content += " <a href='#' onclick='listCall("+(start-1)+")'>이전</a> |"
	      }
	      
	      //1~5
	      for(var i=start; i<=end; i++){
	         if(i==showPage){
	            content += " <b style='color:red'>"+i+"</b> ";
	         }else{
	            content += " <a href='#' onclick='listCall("+i+")'>"+i+"</a> ";//페이지 링크처리 및 나타내기
	         }
	      }
	      
	      //다음(ragne 가 현재 마지막 페이지(5) 보다 더있을 경우 나타나는 녀석)
	      if(end<range){
	         content += "| <a href='#' onclick='listCall("+(end+1)+")'>다음</a>"//다음 페이지로 넘어가기위해 end+1 , 즉 6페이지로 넘어감
	      }
	      
	      $("#paging").empty();
	      $("#paging").append(content);
	   } */
      
   </script>
</html>