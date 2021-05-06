<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>반려동물 등록</title>
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<style>
			table, td{
			border: 1px solid black;
			border-collapse: collapse;
			padding: 5px 10px;
			text-align:center;
			}
			
			input[type='text']{
			width:40%;
			}
			
			table{
			width:100%;
			}
			
			#photo{
				
			}
		</style>
	</head>
	<body>
		<h3>반려동물 등록</h3>
		<hr/>
		<div>
		<%-- <form action="petPlus?id=${sessionScope.loginId}" method="post"> --%>
		<table>
			<thead>
				<tr >
					<td colspan="2">
						<input id="pet_image"type="file" name="image">
					</td>
					
				</tr>
				<tr>
					<td colspan="2">이름<br/>
						<input id="pet_name" type="text" name="pet_name" value=""/>
					</td>
				</tr>
				<tr>
				</tr>
				<tr>
					<td colspan="2">생년월일 <br/>
					 	<select id="birth1" name="birth1">
					       <%for(int i=2021; i>=1930; i--){ %>
					       <option value="<%=i %>"><%=i %></option>
					       <%} %>
					     </select>년&nbsp;
					     <select id="birth2" name="birth2">
					       <%for(int i=1; i<=12; i++){ %>
					       <option value="<%=i %>"><%=i %></option>
					       <%} %>
					     </select>월
					     <select id="birth3" name="birth3">
					       <%for(int i=1; i<=31; i++){ %>
					       <option value="<%=i %>"><%=i %></option>
					       <%} %>
					     </select>일<br><br>
					</td>
				</tr>
				<tr>
					<td colspan="2">
					<input type="radio" name="dog_cat" value="강아지" id="dog" checked/>강아지
					<input type="radio" name="dog_cat" value="고양이" id="cat" />고양이
					</td>
				</tr>
				<tr>
					<td colspan="2">품종<br/>
						<input type="text" id="kind" name="kind" value=""/>
					</td>
				</tr>
				<tr>
					<td colspan="2">체중<br/>
						<input type="text" id="kg" name="kg" value=""/>
					</td>
				</tr>
				<tr>
					<td colspan="2">예방접종<br/></td>
				</tr>
				</thead>
				<tbody id="vaccTbody">
					<!-- <tr class="list">
						<td class="vaccName">컨넬코프</td>
						<td>
							<select id="option" name="checked" onchange="select()">
								<option value="Y" selected>접종 완료</option>
								<option value="N">미접종</option>
							</select>
							<input type="text" name="vacc_date" value="2020.01.20"/>
						</td>
					</tr> -->
				</tbody>
				
				<%-- 
				<tbody>
				<c:forEach var="vac" items="${vac}">
				
				<c:if test="${vac.dog_cat=='dog'}"> 
					<tr>
						<td width="8%" nowrap><p>${vac.vacc_name}</p></td>
						<td width="10%">${vac.vacc_idx} </td>
					</tr>
					</c:if>
				</c:forEach>
				</tbody>
				 --%>
				<%-- <!-- 강아지 선택 -->
				<tbody id="vac_dog">
					<c:forEach var = "dog" items="${dog}">
					<tr>
						<td><input type="text" name="vacc_name" value="${dog.vacc_name}" readOnly/></td>
						<td>
							<select id="option" name="checked" onchange="select()">
								<option value="Y" selected>접종 완료</option>
								<option value="N">미접종</option>
							</select>
							<input type="text" name="vacc_date" value=""/>
						</td>
					</tr>
					</c:forEach>
				</tbody>
				<!-- 고양이 선택 -->
				<tbody id="vac_cat">
					<c:forEach var = "cat" items="${cat}">
					    <tr>
						<td><input type="text" name="vacc_name" value="${cat.vacc_name}" readOnly/>
						</td>
						<td>
							<select id="option" name="checked" onchange="select()">
								<option value="Y" selected>접종 완료</option>
								<option value="N">미접종</option>
							</select>
							<input type="text" name="vacc_date" value=""/>
						</td>
					</tr>
					</c:forEach>
				</tbody> --%>
				<tr>
					<td colspan="2"><input id="plus" type="button" value="추가"/></td>
				</tr>
			</table>
			<!-- </form> -->
			</div>
	</body>
	<script>
	
	$(document).ready(function(){
		 
		//개/고양이 선택시 
		$("input:radio").on('click',function(){
			var sel = $('input:radio[name=dog_cat]:checked').val();//선택 값 
			console.log(sel);
			$this = $(this);
			
			
			$.ajax({
				url : 'petVaccList',
				type : 'POST',
				dataType : 'JSON',
				data : {
					//valueArr : checkArr,
					chk : sel
				},
				success : function(data) {
					console.log(data);
					var temp;
					for(var i = 0 ; i < data.length ; i++){
						temp += `
							<tr class="vacc__list" data-vaccIdx="\${data[i].vacc_idx}">
								<td>\${data[i].vacc_name}</td>
								<td>
									<select class="vaccOption" name="checked">
										<option value="Y" >접종 완료</option>
										<option value="N" selected>미접종</option>
									</select>
									<input class="vaccDate"type="text" name="vacc_date"/>
								</td>
							</tr>
						`;
					}
					
					$('#vaccTbody').html(temp);
					
					
				},
				error:function(e){
					console.log(e);
				}
			});
		}); 
		
		/* //값 입력 후 
		//값을 가져온다. 
		var vacc_name = $("#vacc_name").val();
		
		//name이 같은 값들을 배열에 담는다.
		var vaccList = [];
		vacc_name.each(function(i) {
			vaccList.push($(this).val());
		});
		console.log(vaccList);
		 */
		
		$('#dog').click();
	});
	
	$("#plus").click(function(){
		
		
		var bday = $('#birth1').val()+"-"+$('#birth2').val()+"-"+$('#birth3').val();
		
		var reqData = new FormData();	
		
		if($("#pet_image")[0].files[0]!=null){
			reqData.append("image",$("#pet_image")[0].files[0]);	
		}
		
		reqData.append("pet_name",$('#pet_name').val());
		reqData.append("bday",bday);
		reqData.append("kind",$('#kind').val());
		reqData.append("kg",$('#kg').val());
		
		
		var vaccList = [];
		$('.vacc__list').each(function(){
			var checked = $(this).find('.vaccOption').val();
			if(checked=='Y'){
				var vacc = {};
			    vacc.vacc_idx = Number($(this).attr('data-vaccIdx'));
			    vacc.checked = checked;
			    vacc.vacc_date = $(this).find('.vaccDate').val();
			    vaccList.push(vacc);
			}
		});
		reqData.append("vaccListJson",JSON.stringify(vaccList));
		
		$.ajax({
		    url: 'petPlus',
		    type: 'post',
		    enctype: 'multipart/form-data',
		    processData: false, //데이터를 쿼리 문자열로 변환하는 jQuery 형식 방지
		    contentType: false,
		    dataType: 'json',
		    cache: false,
		    mimeType: "multipart/form-data",
		    data: reqData,
		    success: function (data) {
		    },
		    error: function (err) {
		        
		    }
		});		
		
        $("form").submit(); 
        //location.href='./petPlus?id=${sessionScope.loginId}';
	});
	
	
	
	
	
	
	
	
	</script>
</html>