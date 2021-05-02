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
			}
			table{
				width: 80%;
				height: 80%;
				padding: 10px;
			}
			tr{
			}
			th,td,input{			
				font-size: 8pt;
			}
			textarea {	
				font-size: 8pt;
				resize: vertical;
				width: 100%;
				height: 100px;
				border: 0px solid;
			}
			input[type='text'],input[type='number']{
				border: 0px solid;
			}
		</style>
	</head>
	<body>
		<h3>상세보기 폼</h3>
			<table>
				<tr>
					<td colspan="3"><textarea class="fix"  <c:if test="${sche ne null}">  readonly="readonly"</c:if>   id="content">${sche.content }</textarea></td>
					<th></th>
				</tr>
				<tr>					
					<th><input type="text" class="fix"   id="subject"  placeholder="제목을 넣어주세요"  <c:if test="${sche ne null}"> readonly="readonly"  value="${sche.subject }"</c:if>/></th>
					<th colspan="2">주기 : <input type="number"class="fix"  id="cycle"  <c:if test="${sche ne null}"> readonly="readonly" value="${sche.cycle }"</c:if>value="0" /> (주)</th>
				</tr>
				<tr>	
					<th>날짜 설정</th>
					<th>
						<input type="date" id="d_day" <c:if test="${sche eq null}">value="${time }" </c:if><c:if test="${sche ne null}"> value="${sche.d_day }" </c:if>/>
					</th>
					<c:if test="${sche.executed ne 'Y' }">
						<th>
							<input type="button" id="btn" value="등록"/>
						</th>		
						<c:if test="${sche.executed eq 'N' }">
						<tr>
							<th colspan="3">
								<input type="button" id="checkBtn" value="일정완료" />
							</th>
						</tr>	
						</c:if>
					</c:if>
				</tr>				
			</table>
			<input type="hidden" id="sche_idx" value="${sche.sche_idx }"/>		
	</body>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
	<script>
		var toDay = new Date();
		var comDay = new Date("${sche.d_day }");
		toDay =moment(toDay).format('YYYY MM DD');
		comDay =moment(comDay).format('YYYY MM DD');
		console.log(toDay + "////" + comDay);
		if(toDay != comDay){
			console.log("날짜 달라서 버튼 지움");
			$('#checkBtn').remove();
		}
		$('#checkBtn').click(function() {
			console.log("${vacc.vac_idx }");
			var content ="${sche.content }";
			var subject = "${sche.subject }";
			var cycle ="${sche.cycle }" ;
			var d_day = "${sche.d_day }";
			$.ajax({
				type:'POST'
				,url:'executed'
				,data:{
					"vac_idx":"${sche.sche_idx }"
					,"vacc_idx":"0"
					,"date": "0"
					,"content":content
					,"subject":subject
					,"cycle":cycle
					,"d_day":d_day
				}
				,dataType:'json'
				,success : function(data) {
					console.log(data.suc);
					if(data.suc>0){
						opener.location.reload();
						window.close();
					};
				}
				,error : function(e){
					console.log(e);
				}
				
			});
		});
	
	$('.fix').dblclick(function() {
		console.log("수정");
		$(this).removeAttr('readonly');
	});
	
	
	$('#btn').click(function() {
		console.log("에이작스 시작");
		if($('#sche_idx').val()==''){
			$('#sche_idx').val(0);
		}
		var params={
				"content":$('#content').val()
				,"subject":$('#subject').val()
				,"cycle":$('#cycle').val()
				,"d_day":$('#d_day').val()
				,"sche_idx":$('#sche_idx').val()
				
		}
		console.log(params);
		  $.ajax({
			type:'POST'
			,url:'regSchedule'
			,data:params
			,dataType:'json'
			,success : function(data) {
				console.log($('input[type="date"]').val());
				opener.setData($('input[type="date"]').val());
				
				window.close();
			}
			,error : function(e){
				console.log(e);
			}
			
		});
	});
	</script>
</html>