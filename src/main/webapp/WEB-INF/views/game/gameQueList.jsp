<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/main/top_Navi.jsp" %>
<%@ include file="/WEB-INF/views/main/side_adminNavi.jsp" %>        
<html>
	<head>
		<meta charset="UTF-8">
		<title>GameQuestionList</title>
		<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<style>
			#conBody{
				margin-left : 20%;
				width: 60%;
				margin-top: 100px;
			}
			h2{
				text-align: center;
			}
			#selec{
				float: right;
			}
			#padding{
				width: 100%;
			}
			#quizTitle,#quiz{
				display: inline;
			}
			#nemoTitle,#nemo{
				display: none;
			}
			#quizTable th, #quizTable td, #nemoTable th, #nemoTable td{
				text-align: center;
				border: 2px solid darkgrey;
				border-collapse: collapse;
				padding: 2%;
				min-width: 100px;
			}
			#quizTable, #nemoTable{
				width: 100%;
				margin-top: 2%;
			}
			#quizTable th, #nemoTable th{
				border-bottom: 3px double darkgrey;
			}
			a:link, a:visited, a:active{
				color:darkslategrey;
				text-decoration: none;
				font-size: 15px;
				font-weight: 600;
			}
			.container{
				margin-left: 15%;
			}
			#gameManage{
				background-color: lightpink;
			}
			#adNavi{
				background-color: lightcoral;
				color: white;
				font-weight: bold;
			}
		</style>
	</head>
	<body>
		<div id="conBody">
			<div  id="quizTitle">
				<h2>상식퀴즈 문제 목록</h2>
			</div>
			<div	id="nemoTitle">
				<h2 >네모로직</h2>
			</div>	
			<div id="selec">
				상식퀴즈&nbsp;&nbsp;<input type="radio" id="quizId" name="toggle" value="상식퀴즈" checked="checked"/>
				네모로직&nbsp;&nbsp;<input type="radio" id="nemoId" name="toggle" value="네모로직"/>
			</div>	
			<div id="padding">
				<div id="quiz">
					<button id="quizInsert" onclick="location.href='./insertQuizForm'">상식퀴즈 게임등록</button>			
					<table id="quizTable">
						<tr>
							<th>퀴즈번호</th><th>문제</th><th>블라인드</th>
						</tr>
						<tbody id="quizList"></tbody>
					</table>
				</div>
				<div id="nemo">
					<button id="nemoInsert" onclick="location.href='./insertNemoForm'">네모로직 게임등록</button>			
					<table id="nemoTable">
						<tr>
							<th>네모로직 문제번호</th><th>네모로직 제목</th>
						</tr>
						<tbody id="nemoList"></tbody>
					</table>
				</div>
			</div>
		</div>	
		<div class="container">
			<nav aria-label="page navigation" style="text-align: center;">
				<ul class="pagination" id="pagination"></ul>
			</nav>
		</div>
	</body>
	<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
	<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
	<script>
		 var showPage = 1;
		 //몇개를 보여줄 것인지 / 몇페이지
		 listCall(showPage);//시작하자마자 이 함수를 호출 (15개씩 1페이지씩 보여줘라)
		   
		   $("#selec").change(function(){//selec 의 값을 변경 할 때 마다 실행
			   $('#pagination').twbsPagination('destroy');//이 구문이 없으면 페이지당 갯수 조정시 페이징 변경이 일어나지 않는다
		      listCall(showPage);
		   });
		   
		   function listCall(reqPage){
		      $.ajax({
		         url:'gameGetList',
		         Type:'GET',
		         data:{
		        	"pagePerCnt":10
		        	,"page":reqPage
		         },
		         dataType:'JSON',
		         success:function(data){
		            console.log(data);
		            console.log(data.currPage);
		            console.log(data.quizRange);
		            console.log(data.nemoRange);
		            console.log($('input[checked="checked"]').val());
		            if($('input[checked="checked"]').val() == "상식퀴즈"){
						showPage = data.currPage;
				   		listPrint(data.quizList);
				   		$('#pagination').twbsPagination({
				       		startPage:data.currPage,//시작 페이지
				         	totalPages:data.quizRange,//생성 가능 최대 페이지
				           	visiblepages:5,//5개씩 보여주겟다.
				           	onPageClick: function(evt,page){
				            	console.log(evt);
				            	console.log(page);
				            	listCall(page);
				            }
				    	});
			  		}else if($('input[checked="checked"]').val() == "네모로직"){
				      	showPage = data.currPage;
			           	listPrint(data.nemoList);
			           	$('#pagination').twbsPagination({
				       		startPage:data.currPage,//시작 페이지
				         	totalPages:data.nemoRange,//생성 가능 최대 페이지
				           	visiblepages:5,//5개씩 보여주겟다.
				           	onPageClick: function(evt,page){
				            	console.log(evt);
				            	console.log(page);
				            	listCall(page);
				            }
				    	});
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
			for(var i=0;i<list.length;i++){
				content += "<tr>";
				content += "<td>"+list[i].quiz_idx +"</td>";
				content += "<td><a href='./quizDetail?idx="+list[i].quiz_idx+"'>"+list[i].quiz_question+"</a></td>" ;
				content += "<td><a href='./quizBlind?idx="+list[i].quiz_idx+"' style='color: #1B4F72; font-family: cursive;'>Blind</a></td>" ;
				content +="<tr>";
			}		    	
	 		$("#quizList").empty();
			$("#quizList").append(content);
			    
			content="";
			for(var i=0;i<list.length;i++){
				content += "<tr>";
				content += "<td>"+list[i].nemo_idx +"</td>";
				content += "<td><a href='./nemoDetail?idx="+list[i].nemo_idx+"'>"+list[i].nemo_subject+"</a></td>" ;
				content +="<tr>";
			}
			$("#nemoList").empty();
			$("#nemoList").append(content);		    	
		}
		 
		 $('input[type="radio"]').click(function(){
				if($(this).val() == "상식퀴즈"){
					$('#quiz').css({"display":"inline"});
					$('#quizTitle').css({"display":"inline"});
					$('#nemo').css({"display":"none"});
					$('#nemoTitle').css({"display":"none"});
					
					$('#quizId').attr({'checked':true});
					$('#nemoId').attr({'checked':false});
					listCall(1);
				} else if($(this).val() == "네모로직"){
					$('#quiz').css({"display":"none"});
					$('#quizTitle').css({"display":"none"});
					$('#nemo').css({"display":"inline"});
					$('#nemoTitle').css({"display":"inline"});
					
					$('#quizId').attr({'checked':false});
					$('#nemoId').attr({'checked':true});
					listCall(1);
				}
			});
	</script>
</html>	