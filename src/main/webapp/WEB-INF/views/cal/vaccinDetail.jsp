<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>백신 상세창</title>
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
			input[type='text']{
				margin: 10px;
				border: 0px solid;
			}
		</style>
	</head>
	<body>
		<h3>상세보기 ${vacc.vacc_idx }// ${vacc.vac_idx }//${vacc_sche_idx }//2</h3>
			<table>
				<tr>
					<td colspan="3">${vacc.content }</td>
					<th></th>
				</tr>
				<tr>	
					<th>${vacc.vacc_name }</th>
					<th colspan="2">주기 : ${vacc.cycle } 주 마다</th>
				</tr>
				<tr>	
					<th>접종날짜 설정</th>
					<th>					
						<input type="date" id="date" <c:if test="${check ne null}"> value="${check.d_day.substring(0,10)}" </c:if>value="${vacc.expected_date}"/>
					</th>
					<c:if test="${check.executed ne 'Y'}">
						<th><input type="button" id="btn" value="등록"/></th>			
					</c:if>
				</tr>
				<c:if test="${check.executed ne 'Y'}">
					<tr>
						<th colspan="3">
							<input type="button" id="checkBtn" value="일정완료"/>
						</th>
					</tr>
				</c:if>
			</table>
			<input type="hidden" id="vac_idx" value="${vacc.vac_idx }"/>
			<input type="hidden" id="vacc_idx" value="${vacc.vacc_idx }"/>
		
	</body>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

	<script>
		var toDay = new Date();
		var comDay = new Date("${check.d_day}");
		toDay =moment(toDay).format('YYYY MM DD');
		comDay =moment(comDay).format('YYYY MM DD');
		console.log(toDay + "////" + comDay);
		if(toDay != comDay){
			console.log("날짜 달라서 버튼 지움");
			$('#checkBtn').remove();
		}
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
						opener.setData($('input[type="date"]').val());
						window.close();	
					};
				}
				,error : function(e){
					console.log(e);
				}
				
			});
		});
	
		$('#btn').click(function() {
			console.log("에이작스 시작"+$('#vacc_idx').val()+"//"+$('#vac_idx').val());
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