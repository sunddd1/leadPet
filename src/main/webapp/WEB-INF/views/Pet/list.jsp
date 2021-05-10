<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>반려동물 목록</title>
		<style>
			thead {
				font-weight: 600;
			}

			#note{
			padding-top : 150px ;
			padding-left : 400px;
			width: 800px;
			}
			
			#myPet{
			background-color: lightcoral;
			color: white;
			font-weight: bold;
			}
			
			#table{
				 float:left;
				 width : 4000px;
			}
			
			#button{
				padding-left : 40px;
			}
			
			td{
				align-content: left; 
			
			}
			
			img{
				position: relative;
				top: -10px;
			}
			
		</style>
	</head>
	<body>
		<jsp:include page="../main/top_Navi.jsp"/>
	<table>
		<tr>
			<td><jsp:include page="../main/side_myNavi.jsp"/></td>
			<b style="background-color: lightcoral">반려동물 목록</b>
			<td id="note">
			
			<button style="align : right;" onclick="location.href='./newPet'">반려동물
				등록</button>
			<hr/>
					<c:forEach items="${list}" var="dto">
						<table id="table" style="width: 50%;" >
						<tr>
							<td rowspan="20" >
							<img src="./petPhoto/${dto.newFileName}" style="width: 80px;">
							</td>
						<c:if test="${dto.delegate != 'N'}">
							<td id="star">
								<img src="https://img.icons8.com/office/30/000000/filled-like--v1.png"/>
								대표 반려동물
								<img src="https://img.icons8.com/office/30/000000/filled-like--v1.png"/>
							</td>
						</c:if> 
						
						</tr>
						<tr id="name">
							
							<td>${dto.pet_name}</td>
						</tr>
						
						<tr>
							<td>${dto.kind}</td>
						</tr>
						<tr>
							<td>${dto.bday}</td>
						</tr>
						<tr>
							<td>${dto.kg}</td>
						</tr>
						<tr>
							<td><c:forEach items="${dto.vaccList}" var="vacc">
								${vacc.vacc_name} : ${vacc.vacc_date}<br>
								</c:forEach></td>
						</tr>
						<tr>
							<td id="button">
							<c:if test="${dto.delegate == 'N'}">
									<button onclick="location.href='./star?pet_idx=${dto.pet_idx}'">대표로 설정</button>
							</c:if>
							<button onclick="location.href='./updatePetPage?pet_idx=${dto.pet_idx}'">수정</button>
							<button onclick="location.href='./deletePet?pet_idx=${dto.pet_idx}'">삭제</button>
							</td>
						</tr>
		
				</table>
					</c:forEach>
			</td>
		</tr>
	</table>
</body>
<script>
	
</script>
</html>