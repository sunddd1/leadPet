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
				text-align: center;
			}

			#note{
			padding-top : 150px ;
			padding-left : 240px;
		}
		</style>
	</head>
	<body>
		<jsp:include page="../main/top_Navi.jsp"/>
	<table>
		<tr>
			<td><jsp:include page="../main/side_myNavi.jsp"/></td>
			<td id="note">
		
	<b>반려동물 목록</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<button onclick="location.href='./newPet'">반려동물
		등록</button>
	<hr />
	<table>
		<thead>
			<tr>
				<td>img</td>
				<td>품종</td>
				<td>생년월일</td>
				<td>이름</td>
				<td>체중</td>
				<td>대표여부</td>
				<td>접종</td>
				<td>수정</td>
				<td>삭제</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="dto">
				<tr>
					<td><img src="./petPhoto/${dto.newFileName}"
						style="width: 130px;"></td>
					<td>${dto.kind}</td>
					<td>${dto.bday}</td>
					<td>${dto.pet_name}</td>
					<td>${dto.kg}</td>
					<td><c:if test="${dto.delegate != 'N'}">
							<button>대표인애</button>
						</c:if> <c:if test="${dto.delegate == 'N'}">
							<button onclick="location.href='./star?pet_idx=${dto.pet_idx}'">대표로
								설정</button>
						</c:if></td>
					<td><c:forEach items="${dto.vaccList}" var="vacc">
						${vacc.vacc_name} : ${vacc.vacc_date}<br>
						</c:forEach></td>
					<td><a href="./updatePetPage?pet_idx=${dto.pet_idx}">수정</a></td>
					<td><a href="./deletePet?pet_idx=${dto.pet_idx}">삭제</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</td>
		</tr>
		
	</table>
</body>
<script>
	
</script>
</html>