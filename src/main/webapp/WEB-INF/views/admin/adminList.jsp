<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
		<title>관리자 목록</title>
		<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	</head>
<style>
    #top{
        text-align: right;
    }
    a{
        text-decoration: none;
    }
    #search{
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
    table {
        border-collapse: separate;
        border-spacing: 0;
        text-align: center;
        line-height: 1.5;
        border-top: 1px solid #ccc;
        border-left: 1px solid #ccc;
        margin : auto;
    }
    th {
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
    td {
        width: 150px;
        padding: 10px;
        vertical-align: top;
        border-right: 1px solid #ccc;
        border-bottom: 1px solid #ccc;
    }
    .table{
        margin-top: 10px;
    }
    .pageArea{
		width:800px;
		text-align: center;
		margin: 10px;
		margin-top: 50px;
		position: relative;
		float: left;
		left: 30%
	}
	.pageArea span{
		font-size: 18px;
		border : 1px solid lightgray;
		padding: 2px 10px;		
		margin: 5px;		
		color : white;
	}
	#page{
		font-weight: 600;
		color: red;
	}
	#insert{
		position: relative;
		left: 80%
	}
</style>
<body>
<jsp:include page="../main/top_Navi.jsp"/>
<jsp:include page="../main/side_adminNavi.jsp"/>
<button onclick="location.href='admin'">관리자관리 리스트</button>
<button onclick="location.href='memberList'">회원관리 리스트</button>
<button onclick="location.href='reportList'">글 신고 리스트</button>
<button onclick="location.href='replyList'">댓글 신고 리스트</button>
<button onclick="location.href='blindNList'">블라인드 리스트</button>
<button onclick="location.href='pointList'">포인트 내역 리스트</button>
    <div id="search">
        <form action="search" method="GET">
            <select id="select" name="search">
                <option ${(search == "id")? "selected" : ""} value="id">아이디</option>
                <option ${(search == "nickname")? "selected" : ""} value="nickname">닉네임</option>
            </select>
            <input type="text" id="adminSearch" value="${keyword}" name="keyword" placeholder="검색어를 입력하세요">
            <input type="submit" value="검색">
        </form>
    </div>
    <div id="insert">
    	<button onclick="adminInsert()">관리자 등록</button>
    </div>
    <div class="table">
        <table>
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
					<td id="paging" colspan="6">
						<div class="container">
							<nav aria-label="page navigation" style="text-align:center">
								<ul class="pagination" id="pagination"></ul>
							</nav>
						</div>
					</td>
				</tr>
				
				
        </table>
    </div>
</body>
		<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
		<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<script>
var msg = "${msg}";
if(msg != ""){
	alert(msg);
	window.close();
}
	
	var showPage = 1;//현재 페이지
	
	//몇개를 보여줄 것인지/몇페이지
	listCall(showPage);//시작하자마자 이 함수를 호출

	function listCall(reqPage){
		var keyword = "${keyword}";
		var search = "${search}";
		if(keyword==''){
			 keyword = $('#adminSearch').val();
		}
		if(keyword==''){
			 keyword = $('#select').val();
		}
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
			content +="<td>"
			content += "<button value='"+list[i].admin_id+"'onclick='changePass(this)'>비밀번호 수정</button>"
			content += "<button onclick="
			content +="<button onclick='delAdmin("+list[i].admin_id+")'>삭제</botton>";
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
	
	/* function pagePrint(range){
		console.log("생성가능 페이지:"+range);
		console.log("현재 페이지:"+showPage);
		var content="";
		var start=1;
		var end= range>=5?5:range;
		//이전(5페이지가 넘어갔을 때 나타나는 녀석)
		if(showPage>5){
			end = Math.ceil(showPage/5)*5
			if(end>range){
				end = range;
			}
			start= end-4;
			content +=" | <a href='#' onclick='listCall("+(start-1)+")'>이전</a> | ";
		}
		//1~5
		for(var i=start;i<=end;i++){
			if(i==showPage){
				content += " <b style='color:red'>"+i+"</b> ";
			}else{
				content +=" <a href='#' onclick='listCall("+i+")'>"+i+"</a> ";
			}
		}
		//다음(range가 더 있을경우 나타나는 녀석)
		if(end<range){
			content +=" | <a href='#' onclick='listCall("+(end+1)+")'>다음</a> |"
		}
		$("#paging").empty();
		$("#paging").append(content);
	} */
	
	
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