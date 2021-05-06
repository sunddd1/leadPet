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
				width: 90%;
				height: 90%;
				padding: 10px;
			}
			th,td,input,select{			
				font-size: 8pt;
			}
			textarea {	
				font-size: 8pt;
				resize: vertical;
				width: 99%;
				height: 100px;
				border: 0px solid;
			}
			
			input[type='text']{
				margin: 10px;
				border: 1px solid;
				width: 100px;
			}
			input[type='number']{
				border: 1px solid;
				width: 50px;				
			}
		</style>
	</head>
	<body>
		<h3>백신등록 폼 </h3>
			<table>
				<tr>
					<td colspan="4"><textarea class="fix"    id="content">${vacc.content }</textarea></td>
					<th></th>
				</tr>
				<tr>					
					<th>
						<input type="text" class="fix"   id="vacc_name" placeholder="백신이름" value="${vacc.vacc_name }"/>
						<select>
							<option value="기초" <c:if test="${vacc.type eq '기초'}"> selected="selected"</c:if>>기초</option>
							<option value="추가" <c:if test="${vacc.type eq '추가'}"> selected="selected"</c:if>>추가</option>							
							<option value="보강" <c:if test="${vacc.type eq '보강'}"> selected="selected"</c:if>>보강</option>
						</select>
					</th>
					<th colspan="2">
						<input type="number"class="fix"  id="cycle" <c:if test="${vacc ne null}">value="${vacc.cycle}"</c:if> value="0" />주 마다
					</th>
					<th>	
						<input type="number"class="fix"  id="vacc_cnt" <c:if test="${vacc ne null}">value="${vacc.vacc_cnt}"</c:if>value="0" />회
					</th>
				</tr>
				<tr>	
					<th>						
						<input type="radio" name="dog_cat" value="강아지" <c:if test="${vacc.dog_cat eq '강아지'}"> checked </c:if>/> 강아지
						<input type="radio" name="dog_cat" value="고양이" <c:if test="${vacc.dog_cat eq '고양이'}"> checked </c:if>/> 고양이		
					</th>
					<th></th>
					<th></th>
					<th>
						<input type="button" id="btn" value="등록"/>
					</th>		
				<tr>
			</table>
			<input type="hidden" id="vacc_idx" value="${vacc.vacc_idx }"/>		
	</body>
	<script>
	console.log("개냥이 /// "+"${vacc.dog_cat}");
		$('#btn').click(function() {
			var content = $('#content').val();
			var vacc_name = $('#vacc_name').val()+"("+$('select').val()+")";
			var cycle = $('#cycle').val();
			var vacc_cnt = $('#vacc_cnt').val();
			var dog_cat = $('input[name="dog_cat"]:checked').val();
			var vacc_idx = $('#vacc_idx').val();
			if(vacc_idx==''){
				vacc_idx=0;
			};
			console.log("넘길 값 "+content+"/"+vacc_name+"/"+cycle+"/"+vacc_cnt+"/"+dog_cat+"/"+vacc_idx);
		
			$.ajax({
				type:'POST'
				,url:'regVacc'
				,data:{
					"content":content
					,"vacc_name":vacc_name
					,"cycle":cycle
					,"vacc_cnt":vacc_cnt
					,"dog_cat":dog_cat
					,"vacc_idx":vacc_idx
				}
				,dataType:'json'
				,success : function(data) {
					console.log(data);
					if(data.suc>0){
						opener.location.reload();
						window.close();
						return;
					}
					alert("등록 실패함 ");
				}
				,error : function(e) {
					console.log(e);
				}
			});
			
		});
	</script>
</html>