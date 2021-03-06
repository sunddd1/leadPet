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
    #adminTable {
        border-collapse: separate;
        border-spacing: 0;
        text-align: center;
        line-height: 1.5;
        border-top: 1px solid #ccc;
        border-left: 1px solid #ccc;
        margin : auto;
    }
    #adminTable th {
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
    #adminTable td {
        width: 200px;
        padding: 10px;
        vertical-align: top;
        border-right: 1px solid #ccc;
        border-bottom: 1px solid #ccc;
    }
    .table{
    	width : 60%;
    	margin-left:20%;
        margin-top: 100px;
        white-space: nowrap;       
    }
	#insert{
		float: right;
	}
	.adbtn{
		margin-right : 10px;
	}
	#adManage{
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
	            <select id="adSearch" name="search">
	                <option <c:if test="${search eq 'id'}"> selected </c:if> value="id">아이디</option>
	                <option <c:if test="${search eq 'nickname'}"> selected </c:if> value="nickname">닉네임</option>
	            </select>
	            <input type="text" id="adminSearch" value="${keyword}" name="keyword" placeholder="검색어를 입력하세요">
	            <button id="searchBtn">검색</button>
	    </span>
	    <span id="insert">
	    	<button onclick="adminInsert()">관리자 등록</button>
	    </span>
        <table id="adminTable">
            <thead>
				<tr>
					<th>아이디</th>
	                <th>비밀번호</th>
	                <th>닉네임</th>
	                <th>관리자 등록일</th>
	                <th></th>
				</tr>
			</thead>
			<tbody id="list">
				<!-- 불러온 데이터 뿌리는 영역 -->
			</tbody>
			
			
            <%-- <c:forEach items="${adminList}" var="admin">
	            <tr>
	                <td id="id">${admin.admin_id}</td>
	                <td>${admin.password}</td>
	                <td>${admin.nickname}</td>
	                <td>${admin.reg_date}</td> 
					<td>
						<button value="${admin.admin_id}" onclick='changePass(this)'>비밀번호 수정</button>
						<button onclick="location.href='adminDelete?id=${admin.admin_id}'">삭제</button>
	                </td>
                </tr>
            </c:forEach> --%>
            
            
            	<tr>
					<td id="paging" colspan="5">
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
	var text = $('#adminSearch').val();
	var adSearch = $('#adSearch').val();
	console.log(text+"/"+adSearch);
	location.href="./admin?keyword="+text+"&search="+adSearch;
});
	
	var showPage = 1;//현재 페이지
	
	//몇개를 보여줄 것인지/몇페이지
	listCall(showPage);//시작하자마자 이 함수를 호출

	function listCall(reqPage){
		var keyword = "${keyword}";
		var search = "${search}";
		if(keyword==''){
			 keyword = $('#adminSearch').val();
		}
		if(search==''){
			search = $('#adSearch').val();
		}
		console.log(search);
		console.log(" keyword : "+keyword);
			$.ajax({
				url:'adminList',
				type:'GET',
				data:{"search":search, "keyword":keyword, "pagePerCnt": 15, "page":reqPage},
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
			content +="<tr>"
			content +="<td>"+list[i].admin_id+"</td>"
			content +="<td>"+list[i].password+"</td>"
			content +="<td>"+list[i].nickname+"</td>"
			//java에서 가끔 날짜가 millisecond로 나올때가 있다.
			var date = new Date(list[i].reg_date);
			content +="<td>"+date.toLocaleDateString("ko-KR")+"</td>"
			content +="<td>"
			content += "<button class='adbtn' value='"+list[i].admin_id+"'onclick='changePass(this)'>비밀번호 수정</button>"
			content +="<button onclick=delAdmin('"+list[i].admin_id+"')>삭제</button>";
			content +="</td>"
			content +="</tr>"
		}
		$("#list").empty();//리스트를 비우고 그 위에 리스트 추가
		$("#list").append(content);
	}
		
		function delAdmin(admin_id) {
			console.log("admin_id : "+admin_id);
			location.href="adminDelete?id="+admin_id;
		}
	
	
	var oriWindow;
	
function changePass(buttonObj){
	var button = $(buttonObj);
	var flag = $("#"+buttonObj.value);
	oriWindow = buttonObj.value;
	 window.open('changePass?id='+oriWindow,'Change Password','width=500, height=300, top=300, left=900')
}

function adminInsert(){
	window.open('adminInsert','Insert Admin','width=500, height=400, top=300, left=900')
}
</script>
</html>