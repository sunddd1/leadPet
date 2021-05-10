<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>쪽지 전송</title>
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<style>
			#send{
			padding-top : 150px ;
			padding-left : 240px;
			}
			
		</style>
	</head>
	<body>
	<jsp:include page="../main/top_Navi.jsp"/>
	<table>
		<tr>
			<td><jsp:include page="../main/side_myNavi.jsp"/></td>
			<td id="send">
		
		<h3>쪽지 보내기</h3>
		<c:if test="${sessionScope.loginId != null }">
    
     
    <p>쪽지</p>
    <form action="noteSend" method="post">
    <input type= "text" name ="content" id="content"> 
    <select name="receiving_id" >
    <c:forEach var="receiving_id" items="${receiving_id}">
    <c:if test="${receiving_id != sessionScope.loginId }">
        <option>${receiving_id}</option>
    </c:if> 
    </c:forEach>
    </select>
    <input type="submit" value="쪽지 보내기" >
    </form>
    
        <p><a href="noteList" >쪽지함</a></p>
        
  	</c:if>
  	</td>
		</tr>
		
	</table>
	</body>
	<script></script>
</html>