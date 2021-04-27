<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		left: 70%
	}
</style>
<body>
<button onclick="location.href='admin'">관리자관리 리스트</button>
<button onclick="location.href='memberList'">회원관리 리스트 DEMO</button>
    <div id="search">
        <form action="memberSearch" method="GET">
            <select id="select" name="search">
                <option ${(search == "id")? "selected" : ""} value="id">아이디</option>
                <option ${(search == "nickname")? "selected" : ""} value="nickname">닉네임</option>
            </select>
            <input type="text" value="${keyword}" name="keyword" placeholder="검색어를 입력하세요">
            <input type="submit" value="검색">
        </form>
    </div>
    <div id="radio">
        <input type="radio" id="r1" name="radio" value="normal" checked="checked" OnClick="window.location.href='memberList'"/>전체 회원
        <input type="radio" id="r2" name="radio" value="black" OnClick="window.location.href='blackList'"/>블랙 회원
        <input type="radio" id="r3" name="radio" value="withdraw" OnClick="window.location.href='withdrawList'"/>탈퇴 회원
    </div>
    <div class="table">
        <table>
            <tr>
                <th>아이디</th>
                <th>닉네임</th>
                <th>성별</th>
                <th>회원가입일</th>
            </tr>
            <c:forEach items="${memberList}" var="member">
	            <tr>
	                <td><a href="#">${member.id}</a></td>
	                <td>${member.nickname}</td>
	                <td>${member.gender}</td>
	                <td>${member.reg_date}</td> 
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
	
</script>
</html>