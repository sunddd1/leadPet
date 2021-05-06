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
		<form action="petPlus?id=${sessionScope.loginId}" method="post">
		<div>
		<table>
			<thead>
			
				<tr >
					<td colspan="2">
						<input type="text" id="photo" placeholder="프로필 사진 등록(최대 10MB)" value="${photoList.newFileName}"/>
						<input type="button" value="파일 업로드" onclick="fileUp()"/>
					</td>
					
				</tr>
				<tr>
					<td colspan="2">이름<br/>
						<input type="text" name="pet_name" value=""/>
					</td>
				</tr>
				<tr>
				</tr>
				<tr>
					<td colspan="2">생년월일 <br/>
					 	<select name="birth1">
					       <%for(int i=2021; i>=1930; i--){ %>
					       <option value="<%=i %>"><%=i %></option>
					       <%} %>
					     </select>년&nbsp;
					     <select name="birth2">
					       <%for(int i=1; i<=12; i++){ %>
					       <option value="<%=i %>"><%=i %></option>
					       <%} %>
					     </select>월
					     <select name="birth3">
					       <%for(int i=1; i<=31; i++){ %>
					       <option value="<%=i %>"><%=i %></option>
					       <%} %>
					     </select>일<br><br>
					</td>
				</tr>
				<tr>
					<td colspan="2">
					<input type="radio" name="dog_cat" value="dog" id="dog" checked/>강아지
					<input type="radio" name="dog_cat" value="cat" id="cat" />고양이
					</td>
				</tr>
				<tr>
					<td colspan="2">품종<br/>
						<input type="text" name="kind" value=""/>
					</td>
				</tr>
				<tr>
					<td colspan="2">체중<br/>
						<input type="text" name="kg" value=""/>
					</td>
				</tr>
				<tr>
					<td colspan="2">예방접종<br/></td>
				</tr>
				</thead>
				<tbody class="selected">
					
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
			</div>
		</form>
	</body>
	<script>
	
	$(document).ready(function(){
		
		var checkArr = [];//ArrayList 값 받을 변수 
		//개/고양이 선택시 
		$("input:radio").on('click',function(){
			var sel = $('input:radio[name=dog_cat]:checked').val();//선택 값 
			console.log(sel);
			$this = $(this);
			
			//checked 일 때 
			if($this.prop('checked')){
				$this.addClass("selected");
				checkArr.push($this.val());
			}else{
				$this.removeClass("selected");
				checkArr.pop($this.val());
			}
			
					console.log(checkArr);
			$.ajax({
				url : 'newPet',
				type : 'POST',
				dataType : 'JSON',
				data : {
					valueArr : checkArr
				},
				success : function(data) {
					//var result = data.json;
					
					/* $.each(result,functon(idx,val){
						console.log(idx+""+val.title);
					}); */
				},
				error:function(e){
					console.log(e);
				}
			})
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
		
		
	});

	$("#plus").click(function(){
		
        $("form").submit(); 
        //location.href='./petPlus?id=${sessionScope.loginId}';
	});
	
	function fileUp() {
		window.open('uploadFormPet','file upload','width=400,height=100');
	};
	
	
	
	
	
	
	</script>
</html>