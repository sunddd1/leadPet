<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>쪽지 전송</title>
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<style></style>
	</head>
	<body>
		<h3>쪽지 보내기</h3>
		<%-- <c:if test="${sessionScope.id != null }"> --%>
    
     
    <p>쪽지</p>
    <form action="noteSend" method="post" onsubmit="return formCheck();" >
    <input type="hidden" name="id" value="${sessionScope.id }">
    <input type= "text" name ="note" id="note"> 
    <select name="receiving_id_id" >
    <c:forEach var="receiving_id_id" items="${customerList }">
    <c:if test="${receiving_id_id.custid != sessionScope.id }">
        <option>$receiving_id.custid }</option>
    </c:if> 
    </c:forEach>
    </select>
    <input type="submit" value="쪽지 보내기" >
    </form>
    
        <p><a href="noteList?s_id=${sessionScope.id}" >쪽지함</a></p>
        
    <%-- </c:if> --%>
	</body>
	<script></script>
</html>