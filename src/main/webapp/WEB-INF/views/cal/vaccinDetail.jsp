<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<style>
			table,td{
				border: 1px solid navy;
				padding: 15px 10px;
			}
			table{
				width: 80%;
				height: 80%;
			}
			th,td,input{			
				font-size: 8pt;
			}
		</style>
	</head>
	<body>
		<h3>상세보기 폼</h3>
		
			<table>
				<tr>
					<td colspan="3">${vacc.content }</td>
					<th></th>
				</tr>
				<tr>	
					<th>${vacc.vacc_name }</th>
					<th colspan="2">주기 : ${vacc.cycle }</th>
				</tr>
				<tr>	
					<th>접종날짜 설정</th>
					<th><input type="date" id="date" value="${vacc.expected_date }"/></th>
					<c:if test="${vacc.added ne 'N'}">
						<th><input type="button" id="btn" value="등록"/></th>			
					</c:if>
				</tr>
				<c:if test="${vacc.added ne 'N'}">
					<tr>
						<th colspan="3">
							<input type="button" id="checkBtn" value="일정완료" />
						</th>
					</tr>
				</c:if>
			</table>
			<input type="hidden" id="vac_idx" value="${vacc.vac_idx }"/>
			<input type="hidden" id="vacc_idx" value="${vacc.vacc_idx }"/>
		
	</body>
	<script>
		$('#checkBtn').click(function() {
			console.log("${vacc.vac_idx }");
			$.ajax({
				type:'POST'
				,url:'executed'
				,data:{
					"vac_idx":"${vacc.vac_idx }"
					,"vacc_idx":$('#vacc_idx').val()
					,"date": $('#date').val()
				}
				,dataType:'json'
				,success : function(data) {
					console.log(data);
					if(data.suc>0){
						location.reload();			
					};
				}
				,error : function(e){
					console.log(e);
				}
				
			});
		});
	
		$('#btn').click(function() {
			console.log("에이작스 시작");
			$.ajax({
				type:'POST'
				,url:'regVaccin'
				,data:{
					"vac_idx":$('#vac_idx').val()
					,"vacc_idx":$('#vacc_idx').val()
					,"date": $('#date').val()
				}
				,dataType:'json'
				,success : function(data) {
					console.log(data.suc);
					if(data.suc>0){
						opener.setData($('input[type="date"]').val());
						window.close();						
					}
					if(data.suc==0){
						alert("완료한 일정 삭제하거나 수정 할 수 없습니다.");
					}
				}
				,error : function(e){
					console.log(e);
				}
				
			});
		});
	</script>
</html>