<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Map"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
   <!-- include libraries(jQuery, bootstrap) --> 
   <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"> 
   <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 
   <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <!-- include summernote css/js--> 
   
</head>
<style>
.menu {
	float: right;
}
.notlogin {
	padding-bottom: 10px;
}
.help-block {
        color: red;
        font-size: 12px;
    }
h1 > a {
	color: black;
}	
</style>
<body>
	<!-- <div class="container"> -->
		<header>
			<h1>반려 헬스 케어</h1>
			
			<%-- <div class="notlogin">
			<!-- login false -->
			<c:if test="${}">
				<a class="menu" href="./registForm">[회원가입]</a>
				<a class="menu" href="./login-form">[로그인]</a>
			</c:if>
			</div>--%>
			<!-- login true -->
			<%-- <c:if test="${}"> --%>
				<!-- 새로운 쪽지 있을 경우 -->
				<c:if test="${!notiCheck}">			
				<a class="menu" href="./noteList">[<i class="fa fa-bell" style="font-size:14px; color: grey;"></i>쪽지]</a>
				</c:if>
				<!-- 새로운 쪽지 없을 경우 -->
				<c:if test="${notiCheck}">			
				<a class="menu" href="./noteList">[<i class="fa fa-bell-o" style="font-size:14px">쪽지</i>]</a>
				</c:if>
				<a class="menu" href="./logout">[로그아웃]</a>
				<c:set var="myId" value="${sessionScope.myId}"></c:set>
					<c:if test="${!empty myId}">
					<p><strong id="nickname">회원${messageList.note.id}</strong>님, 반가워요.</p>
					</c:if>
			<%-- </c:if> --%>
			
		</header>
		<hr>
</body>
</html>