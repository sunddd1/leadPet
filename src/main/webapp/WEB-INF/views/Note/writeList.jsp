<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>작성글</title>
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<style></style>
	</head>
	<body>
		<h3>[작성글]</h3>
            <table>
                <tr>
                    <th>번호</th>
                    <th>내용</th>
                    <th>닉네임</th>
                    <th>작성일</th>
                    
                </tr>
                <c:forEach var = "write" items="${writeList}">
                	<tr>
                		<td>${write.bbs_idx}</td>
                		<td>${write.bbs_subject}</td>
                		<td> ${write.category_name}</td>
                		<td>${write.reg_date}</td>
                	</tr>
                </c:forEach>
            </table>
	</body>
	<script>
		
	</script>
</html>
