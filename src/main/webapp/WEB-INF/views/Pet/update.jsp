<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
	<head>
		<meta charset="UTF-8">
		<title>반려동물 수정</title>
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<style>
			#table{
			margin-left : 20%;
			width : 60%;
			margin-top : 100px;
			padding: 5px 10px;
			text-align:center;
			}
			
			input[type='text']{
			width:40%;
			}
			
			
			
			#myPet{
			background-color: lightcoral;
			color: white;
			font-weight: bold;
			}
		</style>
	</head>
	<body>
		<jsp:include page="../main/top_Navi.jsp"/>
		<jsp:include page="../main/side_myNavi.jsp"/>
		
		<h3>반려동물 수정</h3>
		<hr/>
		<div>
		<table id="table">
			<thead>
				<tr>
					<td colspan="2">
						<input id="pet_image"type="file" name="image">
					</td>
				</tr>
				<tr>
					<td colspan="2">이름<br/>
						<input type="hidden" id="pet_idx" value="${info.pet_idx}"/>
						<input type="text" id="pet_name" name="pet_name" value="${info.pet_name}"/>
					</td>
				</tr>
				<tr>
				</tr>
				<tr>
					<td colspan="2">생년월일 <br/>
					 	${info.bday}
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<!-- 강아지 고양이  -->
						${info.dog_cat}
					</td>
				</tr>
				<tr>
					<td colspan="2">품종<br/>
						<input type="text" id="kind" name="kind" value="${info.kind}"/>
					</td>
				</tr>
				<tr>
					<td colspan="2">체중<br/>
						<input type="text" id="kg" name="kg" value="${info.kg}"/>
					</td>
				</tr>
				<tr>
					<td colspan="2">예방접종<br/></td>
				</tr>
				</thead>
				<tbody id="vaccTbody">
					<c:forEach var="vacc" items="${info.vaccList}">
						<tr class="vacc__list" data-vaccIdx="${vacc.vacc_idx}">
						
							<td>${vacc.vacc_name}</td>
							<td>
								 <c:if test='${vacc.checked == "N"}'>
									<select class="vaccOption" name="checked">
										<option value="Y">접종 완료</option>
										<option value="N"selected>미접종</option>
									</select>
									<input class="vaccDate"type="date" name="vacc_date" value=""/>
								</c:if>
								<c:if test='${vacc.checked == "Y"}'>
									<select class="vaccOption" name="checked">
										<option>접종 완료</option>
									</select>
									<input class="vaccDate"type="date" name="vacc_date" value="${vacc.vacc_date}" readonly="readonly"/>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
				
				<tr>
					<td colspan="2"><input id="update" type="button" value="수정"/></td>
				</tr>
			</table>
			
			</div>
	</body>
	<script>
		
		
	$(document).ready(function(){
		 //접종날짜 적힌 애들 가져오고 , 미접종인 애들은 그냥 뿌려야하나 
		
		
	});
	
	
	$("#update").click(function(){
		
		
		
		//사진,무게,품종 
		var reqData = new FormData();
		
		if($("#pet_image")[0].files[0]!=null){
			reqData.append("image",$("#pet_image")[0].files[0]);	
		}
		
		reqData.append("kind",$('#kind').val());
		reqData.append("kg",$('#kg').val());
		reqData.append("pet_idx",$('#pet_idx').val());
		reqData.append("pet_name",$('#pet_name').val());
		
		
		
		//접종 여부,날짜 
		var vaccList = [];
		$('.vacc__list').each(function(){
			var checked = $(this).find('.vaccOption').val();
			if(checked=='Y'){
				var vacc = {};
			    vacc.vacc_idx = Number($(this).attr('data-vaccIdx'));
			    vacc.checked = checked;
			    vacc.vacc_date = $(this).find('.vaccDate').val();
			    vacc.expected_date = Number($(this).find('.vaccDate').val().substring(0,4))+1+$(this).find('.vaccDate').val().substring(4,$(this).find('.vaccDate').val().length)
			    vaccList.push(vacc);
			}
		});
		reqData.append("vaccListJson",JSON.stringify(vaccList));
		
		 $.ajax({
		    url: 'updatePet',
		    type: 'post',
		    enctype: 'multipart/form-data',
		    processData: false, //데이터를 쿼리 문자열로 변환하는 jQuery 형식 방지
		    contentType: false,
		    dataType: 'json',
		    cache: false,
		    mimeType: "multipart/form-data",
		    data: reqData,
		    success: function (data) {
		    	if(data.ok){
		    		location.href='./listPet';
		    	}
		    },
		    error: function (err) {
		        
		    }
		});		
		
        $("form").submit(); 
	});
	
	
	</script>
</html>