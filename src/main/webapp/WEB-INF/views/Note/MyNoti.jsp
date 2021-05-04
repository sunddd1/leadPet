<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<style>
div .paginator {
	text-align: center; 
}
.table > tbody > tr > td > p {
	padding-top: 10px;
}
.btn {
	float: right;
	margin-bottom: 20px;
}
</style>
<body>
		<jsp:include page="../main/top_Navi.jsp"/>
	<table>
		<tr>
			<td><jsp:include page="../main/side_myNavi.jsp"/></td>
			<td width="70%"><!-- header -->
		
		<%@ include file="/WEB-INF/views/Member/header.jsp" %>
		
		<section>
		<h3>쪽지함</h3>
		<!-- board list -->
		<div class="notilist"></div>
		<table class="table">
			<thead>
				<tr>
					<th width="10%" nowrap>번호</th>
					<th></th>
					<th>내용</th>
				</tr>
			</thead>
				<tbody>
				<c:forEach var="note" items="${messageList}">
				
				<c:if test="${note.checked=='N'}"> 
					<tr class="active">
						<td width="8%" nowrap><p>${note.note_idx}</p></td>
						<td width="10%">${note.id} </td>
						<td>
							<a id="detail" href="./detailNoteList?note_idx=${note.note_idx}">${note.content}</a>
							<small><i>${noti.reg_date}</i></small>
							<small style="float: right; margin-left: 10px">
							<a id="del" href="./delMessageList?note_idx=${note.note_idx}">삭제</a></small>
							<small style="float: right;">안읽음</small>
							</td>
					</tr>
					</c:if>
					
					<c:if test="${note.checked=='Y'}">
					<tr>
						<td width="8%" nowrap><p>${note.note_idx}</p></td>
						<td width="10%">${note.id} </td> 
						<td>
									<a id="detail" href="./detailNoteList?note_idx=${note.note_idx}">${note.content}</a>
									<small><i>${noti.reg_date}</i></small>
									<small style="float: right; margin-left: 10px">
									<a id="del" href="./delMessageList?note_idx=${note.note_idx}">삭제</a></small>
									<small style="float: right;">읽음</small>
									</td>
						
					</tr>
					</c:if>
					
				</c:forEach>
				</tbody>
		</table>
		
		</section></td>
		</tr>
		
	</table>
		
	
	
</body>
</html>