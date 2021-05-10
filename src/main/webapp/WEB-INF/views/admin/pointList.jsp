<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
		<title>관리자 목록</title>
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	</head>
<style>
    #search2{
    	margin-left: 150px;
    }
    input[type=text]{
        width: 500px;
        height: 22px;
    	margin-bottom: 10px;
    }
    select,input[type=submit]{
        height: 30px;
        width: 70px;
    }
    #pointTable {
        border-collapse: separate;
        border-spacing: 0;
        text-align: center;
        line-height: 1.5;
        border-top: 1px solid #ccc;
        border-left: 1px solid #ccc;
        margin : auto;
    }
    #pointTable th {
        width: 120px;
        padding: 10px;
        font-weight: bold;
        vertical-align: top;
        border-right: 1px solid #ccc;
        border-bottom: 1px solid #ccc;
        border-top: 1px solid #fff;
        border-left: 1px solid #fff;
        background: #eee;
    }
    #pointTable td {
        padding: 10px;
        vertical-align: top;
        border-right: 1px solid #ccc;
        border-bottom: 1px solid #ccc;
    }
    .table{
        margin-top: 100px;
        margin-left: 20%;
        width: 60%;
        white-space: nowrap;
    }
	#radio{
		float: right;
	}
	#pointDoc{
		background-color: lightpink;
	}
</style>
<body>
<jsp:include page="../main/top_Navi.jsp"/>
<jsp:include page="../main/side_adminNavi.jsp"/>
<!-- <button onclick="location.href='admin'">관리자관리 리스트</button>
<button onclick="location.href='memberList'">회원관리 리스트</button>
<button onclick="location.href='reportList'">글 신고 리스트</button>
<button onclick="location.href='replyList'">댓글 신고 리스트</button>
<button onclick="location.href='blindNList'">블라인드 리스트</button>
<button onclick="location.href='pointList'">포인트 내역 리스트</button> -->
    <div class="table">
    <span id="search2">
        <input type="text" id="pointSearch" value="${keyword}" name="keyword" placeholder="아이디를 입력하세요">
            <button id="searchBtn">검색</button>
    </span>
        <table id="pointTable">
         <thead>
			 <tr>
                <th>아이디</th>
                <th>포인트</th>
                <th>획득처</th>
                <th>날짜</th>
            </tr>
			</thead>
			<tbody id="list">
				<!-- 불러온 데이터 뿌리는 영역 -->
			</tbody>
            
            <%-- <c:forEach items="${pointList}" var="point">
	            <tr>
	                <td>${point.id}</td>
	                <td id="td">
	                	<input type="hidden" id="pm_point" value="${point.pm_point}"/>
	                	${point.pm_point}
	                </td>
	                <td>${point.gain}</td>
	                <td>${point.reg_date}</td> 
                </tr>
            </c:forEach> --%>
            
            <tr>
					<td id="paging" colspan="4">
						<div class="container">
							<nav aria-label="page navigation" style="text-align:center">
								<ul class="pagination" id="pagination"></ul>
							</nav>
						</div>
					</td>
				</tr>
				
				
        </table>
    </div>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
    <script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
</body>
<script>

var msg = "${msg}";
if(msg != ""){
	alert(msg);
	window.close();
}

$('#searchBtn').click(function() {
	var pointSearch = $('#pointSearch').val();
	console.log(pointSearch);
	location.href="./pointList?keyword="+pointSearch;
});
	
	var showPage = 1;//현재 페이지
	
	//몇개를 보여줄 것인지/몇페이지
	listCall(showPage);//시작하자마자 이 함수를 호출

	function listCall(reqPage){
		var keyword = "${keyword}";
		if(keyword==''){
			 keyword = $('#pointSearch').val();
		}
		console.log(" keyword : "+keyword);
			$.ajax({
				url:'pointListSearch',
				type:'GET',
				data:{"keyword":keyword, "pagePerCnt": 15, "page":reqPage},
				dataType:'JSON',
				success:function(data){
					console.log(data);
					showPage = data.currPage;
					listPrint(data.list);
					/*  pagePrint(data.range);  */
					//플러그인 사용
					$("#pagination").twbsPagination({
						startPage:data.currPage,//시작 페이지
						totalPages:data.range,//생성 가능 최대 페이지
						visiblePages:5,//5개씩 보여주겠다.(1~5)
						onPageClick:function(evt,page){//각 페이지를 눌렀을 경우
							console.log(evt);
							console.log(page);
							listCall(page);
						}
					});
				},
				error:function(error){
					console.log(error);
				}
			});
		}
	
	function listPrint(list){
		var content="";
		for(var i=0;i<list.length;i++){
			content += '<tr>';
			content += '<td onclick=detail("'+list[i].id+'")>';
			content += list[i].id+'</td>';
			content += '<td>'+list[i].pm_point+'</td>';
			content += '<td>'+list[i].gain+'</td>';
			var date = new Date(list[i].reg_date);
			content +="<td>"+date.toLocaleDateString("ko-KR")+"</td>"
			content += '</tr>';
		}
		$("#list").empty();//리스트를 비우고 그 위에 리스트 추가
		$("#list").append(content);
	}
	
		function detail(id){
		window.open('detailMember?id='+id, 'detailMember', 'width=800, height=600, top=100, left=400');
	}
		
</script>
</html>