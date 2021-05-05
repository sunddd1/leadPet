<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
		<title>관리자 목록</title>
		<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
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
        <form action="pointListSearch" method="POST">
            <input type="text" value="${keyword}" name="keyword" placeholder="아이디를 입력하세요">
            <input type="submit" value="검색">
        </form>
    </div>
    <div class="table">
        <table>
            <tr>
                <th>아이디</th>
                <th>포인트</th>
                <th>획득처</th>
                <th>날짜</th>
            </tr>
            <c:forEach items="${pointList}" var="point">
	            <tr>
	                <td>${point.id}</td>
	                <td id="td">${point.pm_point}</td>
	                <td>${point.gain}</td>
	                <td>${point.reg_date}</td> 
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
<script>
var msg = "${msg}";
if(msg != ""){
	alert(msg);
	window.close();
}

var text ='${point.pm_point}';
var findPlus = "+";



if(text.indexOf(findPlus)) {

$('#td').html('+'+text);

}

else {

	$('#td').html('-'+text);

}
</script>
</html>