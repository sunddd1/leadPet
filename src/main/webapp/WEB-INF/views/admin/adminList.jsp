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
</style>
<body>
    <div id="search">
        <form action="search" method="GET">
            <select id="select" name="search">
                <option ${(search == "id")? "selected" : ""} value="id">아이디</option>
                <option ${(search == "nickname")? "selected" : ""} value="nickname">닉네임</option>
            </select>
            <input type="text" value="${keyword}" name="keyWord" placeholder="검색어를 입력하세요">
            <input type="submit" value="검색">
        </form>
    </div>
    <div class="table">
        <table>
            <tr>
                <th>아이디</th>
                <th>비밀번호</th>
                <th>닉네임</th>
                <th>관리자 등록일</th>
                <th></th>
            </tr>
            <c:forEach items="${adminList}" var="admin">
	            <tr>
	                <td><a href="#">${admin.admin_id}</a></td>
	                <td>${admin.password}</td>
	                <td>${admin.nickname}</td>
	                <td>${admin.reg_date}</td> 
					<td>
						<input type="button" value="수정" onclick="changePass()"/>
						<button onclick="location.href='adminDelete'">삭제</button>
	                </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
<script>
function changePass(){
	window.open('changePass','file upload','width=300, height=100, top=300, left=900')
}
</script>
</html>