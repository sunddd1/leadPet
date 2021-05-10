<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    #top{
        text-align: right;
    }
    a{
        text-decoration: none;
    }
    #search2{
        text-align: center;
        margin-top: 7%;
    }
    input[type=text]{
        width: 500px;
        height: 22px;
    }
    select,input[type=submit]{
        height: 30px;
        width: 70px;
    }
    #blindTable table {
        border-collapse: separate;
        border-spacing: 0;
        text-align: center;
        line-height: 1.5;
        border-top: 1px solid #ccc;
        border-left: 1px solid #ccc;
        margin : auto;
    }
    #blindTable th {
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
    #blindTable td {
        width: 150px;
        padding: 10px;
        vertical-align: top;
        border-right: 1px solid #ccc;
        border-bottom: 1px solid #ccc;
    }
    .table{
        margin-top: 10px;
        margin-left: 20%;
        width: 60%;
    }
	h4{
		position: relative;
		left: 20%;
		float: left;
		z-index: 5;
		color: white;
		font-size: 25px;
		margin-top: 5px;
	}
	#radio{
		position: relative;
		left: 70%;
	}
</style>
<body>
<jsp:include page="../main/top_Navi.jsp"/>
<jsp:include page="../main/side_adminNavi.jsp"/>
<button onclick="location.href='admin'">관리자관리 리스트</button>
<button onclick="location.href='memberList'">회원관리 리스트 DEMO</button>
<button onclick="location.href='reportList'">글 신고 리스트 DEMO</button>
	
    <div id="search">
        <input type="text" id="YSearch" value="${keyword}" name="keyword" placeholder="닉네임을 입력하세요">
            <button id="searchBtn">검색</button>
    </div>
    <div id="radio">
        <input type="radio" id="r1" name="radio" value="notFinish" OnClick="window.location.href='blindNList'"/>N
        <input type="radio" id="r2" name="radio" value="finish" checked="checked" OnClick="window.location.href='blindYList'"/>Y
    </div>
    <div class="table">
        <table id="blindTable">
        <thead>
	         <tr>
               <th>글 번호</th>
               <th>닉네임</th>
                <th>블라인드 여부</th>
                <th>글쓰기 날짜</th>
                <th></th>
            </tr>
	        </thead>
	        <tbody id="list">
				<!-- 불러온 데이터 뿌리는 영역 -->
            <tr>
					<td id="paging" colspan="6">
						<div class="container">
							<nav aria-label="page navigation" style="text-align:center">
								<ul class="pagination" id="pagination"></ul>
							</nav>
						</div>
					</td>
				</tr>
			</tbody>
            
            <%-- <c:forEach items="${blindYList}" var="board">
	            <tr>
	            	<td><a href="#">${board.bbs_idx}</a></td>
	            	 <td>${board.nickname}</td> 
	                <td>${board.bbs_blind}</td> 
	                <td>${board.reg_date}</td>
	                <td>
	                	<button value="${board.bbs_idx}" onclick='toggleDisable(this)'>블라인드 해제</button>
	                </td>
                </tr>
            </c:forEach> --%>
            
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
		var YSearch = $('#YSearch').val();
		console.log(YSearch);
		location.href="./blindYList?keyword="+YSearch;
	});
		
		var showPage = 1;//현재 페이지
		
		//몇개를 보여줄 것인지/몇페이지
		listCall(showPage);//시작하자마자 이 함수를 호출
	
		function listCall(reqPage){
			var keyword = "${keyword}";
			if(keyword==''){
				 keyword = $('#YSearch').val();
			}
			console.log(" keyword : "+keyword);
				$.ajax({
					url:'blindYListSearch',
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
				content +='<td><a href="replyprocY?field='+list[i].bbs_idx+'">'+list[i].bbs_idx+'</a></td>';
				content += '<td>'+list[i].nickname+'</td>';
				content += '<td>'+list[i].bbs_blind+'</td>';
				var date = new Date(list[i].reg_date);
				content +="<td>"+date.toLocaleDateString("ko-KR")+"</td>"
				content +="<td><button value='"+list[i].bbs_idx+"' onclick='toggleDisable(this)'>블라인드 해제</button>"
				content += '</tr>';
			}
			$("#list").empty();//리스트를 비우고 그 위에 리스트 추가
			$("#list").append(content);
		}
		
			function detail(id){
			window.open('detailMember?id='+id, 'detailMember', 'width=800, height=600, top=100, left=400');
		}
			function detailReply(field){
				window.open('detailReply?field='+field, 'detailReply', 'width=800, height=600, top=100, left=400');
			}
	
function toggleDisable(buttonObj) {
		
		var button = $(buttonObj);
		var flag = $("#"+buttonObj.value);
	
		console.log(button);
		console.log(flag);
		
		if(confirm('블라인드 해제 하시겠습니까?')){
			$.ajax({ 
				type:'GET' 
				,url:'blindN'
				,data: { "idx": buttonObj.value }
				,dataType: 'json' 
				,success: function(data){
					if(data == 1){
						alert('해제 완료');
						window.location.reload();
					}
				}
				,error: function(e){
					console.log(e);
				}
			});
	}else{
		alert("취소");
	}
	};
</script>
</html>