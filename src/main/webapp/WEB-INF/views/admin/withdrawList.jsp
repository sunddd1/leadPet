<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
		<title>관리자 목록</title>
		<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
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
    #withdrawTable {
        border-collapse: separate;
        border-spacing: 0;
        text-align: center;
        line-height: 1.5;
        border-top: 1px solid #ccc;
        border-left: 1px solid #ccc;
        margin : auto;
    }
    #withdrawTable th {
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
    #withdrawTable td {
        width: 200px;
        padding: 10px;
        vertical-align: top;
        border-right: 1px solid #ccc;
        border-bottom: 1px solid #ccc;
    }
    .table{
        margin-top: 10px;
    }
	#insert{
		position: relative;
		left: 80%
	}
	#radio{
		position: relative;
		left: 70%
	}
</style>
<body>
<jsp:include page="../main/top_Navi.jsp"/>
<jsp:include page="../main/side_adminNavi.jsp"/>
<button onclick="location.href='admin'">관리자관리 리스트</button>
<button onclick="location.href='memberList'">회원관리 리스트 DEMO</button>
<button onclick="location.href='reportList'">신고 리스트 DEMO</button>
    <div id="search">
        <select id="withSearch" name="search">
                <option <c:if test="${search eq 'id'}"> selected </c:if> value="id">아이디</option>
                <option <c:if test="${search eq 'nickname'}"> selected </c:if> value="nickname">닉네임</option>
            </select>
            <input type="text" id="withdrawSearch" value="${keyword}" name="keyword" placeholder="검색어를 입력하세요">
            <button id="searchBtn">검색</button>
    </div>
    <div id="radio">
        <input type="radio" id="r1" name="radio" value="normal" OnClick="window.location.href='memberList'"/>전체 회원
        <input type="radio" id="r2" name="radio" value="black" OnClick="window.location.href='blackList'"/>블랙 회원
        <input type="radio" id="r3" name="radio" value="withdraw" checked="checked" OnClick="window.location.href='withdrawList'"/>탈퇴 회원
    </div>
    <div class="table">
        <table id="withdrawTable">
            <tr>
                <th>아이디</th>
                <th>닉네임</th>
                <th>성별</th>
                <th>회원가입일</th>
                <th></th>
            </tr>
            <c:forEach items="${withdrawList}" var="member">
	            <tr>
	                <td>
		                <a href="detailMember?id=${member.id}" 
		                onclick="window.open(this.href, 'detailMember', 'width=800, height=600, top=100, left=400'); return false;">
		               	 	${member.id}
		                </a>
		                <input type="hidden" id="id" value="${member.id}">
	                </td>
	                <td>${member.nickname}</td>
	                <td>${member.gender}</td>
	                <td>${member.reg_date}</td> 
	                <td>
	                	<button id="withdraw">회원 복구</button>
	                </td>
                </tr>
            </c:forEach>
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
	
	$("#withdraw").click(function(){
		if(confirm('탈퇴 회원을 복구하시겠습니까?')){
			var id = $("#id").val();
				$.ajax({ 
					type:'GET' 
					,url:'restoreWithdraw'
					,data: { "id": id }
					,dataType: 'json' 
					,success: function(data){
						if(data == 1){
							alert('복구 완료');
							window.location.reload();
						}
					}
					,error: function(e){
						console.log(e);
					}
				});
		}else{
			alert("복구 취소");
		}
	});
</script>
</html>