<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	</head>
	<style>
		table,th,td{
			border: 1px solid;
			border-collapse: collapse;
			padding: 5px 10px;
			text-align: center;
		}
		table{
			margin-left: auto; 
			margin-right: auto;
		}
		h3{
			text-align: center;
		}
		button{
			margin-left: auto; 
			margin-right: auto;
		}
	</style>
	<body>
	<div id="member">
			<h3>회원 상세보기</h3>
				<input type="radio" id="r1" name="radio" value="member" checked="checked" OnClick="window.location.href='detailMember'"/>회원
		        <input type="radio" id="r2" name="radio" value="pet" OnClick="window.location.href='detailPet?id=${dto.id}'"/>반려동물
			<table>
				<tr>
					<th>아이디</th>
					<td>${dto.id}</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${dto.name}</td>
				</tr>
				<tr>
					<th>나이</th>
					<td>${dto.age}</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>${dto.gender}</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${dto.email}</td>
				</tr>
				<tr>
					<th>가입일</th>
					<td>${dto.reg_date}</td>
				</tr>
				<tr>
					<th>블랙 여부</th>
					<td id="${dto.id}">${dto.black}</td>
				</tr>
				
				<tr>
					<th>탈퇴 여부</th>
					<td>${dto.withdraw}</td>
				</tr>
				<tr>
					<th>블랙 횟수</th>
					<td>
						${dto.black_cnt}
					</td>
					<!-- <input type="text" name="black_cnt" value="0" readonly="readonly"/> -->
				</tr>
				<tr>
					<th>상태 변경일</th>
					<td>${dto.change_date}</td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td>${dto.nickname}</td>
				</tr>
				<tr>
					<th>포인트</th>
					<td>${dto.point}</td>
				</tr>
				<tr>
					<th>등급</th>
					<td>${dto.grade}</td>
				</tr>
				<tr>
				<td colspan="2">
					<c:if test="${dto.black == 'y' || dto.black == 'Y'}">
						<button value="${dto.id }" onclick='toggleDisable(this)'>블랙 해제</button>
					</c:if>
					<c:if test="${dto.black == 'n' || dto.black == 'N'}">
						<button value="${dto.id }" onclick='toggleDisable(this)'>블랙 추가</button>
					</c:if>
				</td>
			</tr>
			</table>
		</div>
	</body>
	<script>
	function toggleDisable(buttonObj) {
		
		var button = $(buttonObj);
		var flag = $("#"+buttonObj.value);
		var black = '${dto.black_cnt}';
		
		console.log(button);
		console.log(flag);
		
		$.ajax({
			type:'GET'
			,url:'toggleMemberDisable'
			,data:{'id' : buttonObj.value, 'black' : black}
			,dataType:'text'
			,success:function(data) {
				if(data == "Y") {
					/* flag.html("Y");
					button.html("블랙 추가"); */
					location.reload();
				}else {
					/* flag.html("N");
					button.html("블랙 해제"); */
					location.reload();
				}
			},error:function(e) {
				console.log(e);
				console.log("활성화/비활성화 버튼 비동기 에러");
			}
		})	
	};
	</script>
</html>