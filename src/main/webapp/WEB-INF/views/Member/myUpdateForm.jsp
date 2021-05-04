<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
	<title>회원가입</title>
	<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
	<style>
		#updateTable{
			width: 60%;
			margin-left: 20%;
		}
		#updateTable, #updateTable th, #updateTable td {
			border : 1px solid black;
		}
	</style>
	</head>
	
	
	<body>
		<form id="updateForm" action="member-update" method="post">
			<table id="updateTable">			
				<tr>
					<th colspan="2">
						<h2>회원 정보 수정</h2>
					</th>
				</tr>
				<tr>
					<th>
						<label for="id">아이디</label>
					</th>
					<td>
						<input type="text" name="id" id="id" value="${member.id }" readonly />
					</td>
				</tr>
				<tr>
					<th>
						<label>비밀번호</label><br/>
					</th>
					<td>
						<input type="password" name="password" id="password" onkeyup="checkPw()"/>
					</td>
				<tr>
					<th>
						<label>비밀번호 확인</label>
					</th>
					<td>
						<input type="password" id="checkPassword" onkeyup="checkPw()" />
						<br/>
						<span id="checkPasswordMsg"><font color=red>비밀번호 불일치</font></span>
					</td>
				</tr>
				<tr>
					<th>
						<label>닉네임</label>
					</th>
					<td>
						<input type="text" name="nickname" id="nickname" value="${member.nickname }" onkeyup="updateNickname()"/>
						<input type="button" value="중복 확인" onclick="isDuplicateNickname()" />
					</td>
				</tr>
				<tr>
					<th>
						<label>이름</label>
					</th>
					<td>
						<input type="text" name="name"id="name" value="${member.name }"/>
					</td>
				</tr>
				<tr>	
					<th>
						<label>나이</label>
					</th>
					<td>					
						<input type="number" min="1" max="130"name="age" id="age" value="${member.age }" />
					</td>
				</tr>
				<tr>
					<th>
						<label>성별</label> 
					</th>
					<td>
						<c:if test="${member.gender eq '남' }">
						<input type="radio" name="gender" value="남" id="male" checked />남
						<input type="radio" name="gender" value="여" id="female" />여	
					</c:if>
					<c:if test="${member.gender eq '여' }">
						<input type="radio" name="gender" value="남" id="male"/>남
						<input type="radio" name="gender" value="여" id="female" checked />여	
					</c:if>
					</td>
				</tr>
				<tr>
					<th>
						<label>이메일</label><br>
					</th>
					<td>
						<input type="hidden" id="email" name="email" />
						<input type="text" id="prefixEmail" value="${fn:split(member.email,'@')[0]}"/>
						@
						<input type="text" id="suffixEmail"/>
						<select
							id="emailOption" onchange="emailSelect()">
							<option value="직접 입력" selected>직접 입력</option>
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="daum.net">daum.net</option>
							<option value="nate.com">nate.com</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<th colspan="2">
						<input type="button" value="정보 수정" onclick="update()"/>
					</th>
				</tr>
			</table>
		</form>
	</body>
	<script>

	var validPw = false;
	var validNickname = false;
	
	//비밀번호 일치 확인
	function checkPw() {
		var pw = $('#password').val();
		var pwCheck = $('#checkPassword').val();
		var tag = '<font color=red>비밀번호 불일치</font>';
		validPw = false;
		
		if( pw != ''
			&& pwCheck != ''
			&& pw === pwCheck) {
			
			tag = "<font color=blue>비밀번호 일치</font>";
			validPw = true;
		}
		
		$('#checkPasswordMsg').html(tag);
	}

	function isDuplicateNickname() {
		var nickname = $("#nickname").val();
		if("${member.nickname }" === nickname) {
			validNickname = true;
			alert("사용 가능한 닉네임입니다.");
			return;
		}
		
		$.ajax({
			type:'get'
			,url:'check-duplicate-nickname'
			,data:{"nickname": nickname}
			,dataType:'JSON'
			,success:function(result){
				var msg = '이미 사용중인 닉네임입니다.';			
				validNickname = false;
				
				if(result) {
					msg = "사용 가능한 닉네임입니다.";
					validNickname = true;
				}
				alert(msg);
			}
			,error:function(e){
				console.log(e);
			}
		});
	}
	
	function updateNickname() {
		validNickname = false;
	}
	
	function emailSelect() {
		var option = $('#emailOption').val();
		var $suffix = $('#suffixEmail');
		
		if(option == "직접 입력") {
			$suffix.val("");
			$suffix.removeAttr("readonly");
			return;
		}
		
		$('#suffixEmail').attr("readonly","readonly");
		$('#suffixEmail').val(option);
	}
	
	// 등록 버튼
	function update() {
		if(isAllValid()) {
			$('#updateTable').submit();
		}
	}
	
	function isAllValid() {
		if(!isValidPw()) {		
			alert("비밀번호를 확인해주세요.");
			return false;
		}
		if(!isValidNickname()) {
			alert("닉네임을 확인해주세요.");
			return false;	
		}
		if(!isValidname()) {
			alert("이름은 영어와 한글만 사용 가능합니다.");
			return false;
		}
		if(!isValidAge()) {
			alert("나이를 확인해주세요");
			return false;
		}
		if(!isValidEmail()) {
			alert("이메일을 확인해주세요");
			return false;
		} 
		
		return true;
	}

	function isValidPw() {
		return validPw;
	}

	function isValidNickname() {
		return validNickname;
	}
	
	function isValidname() {
		// var reg = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
		var reg = /^[가-힣]{2,4}|[a-zA-Z]/;
		var name = $("#name").val();
		return reg.test(name);
	}
	
	function isValidAge() {
		var reg = /^[0-9]{1,3}$/;
		var age = $("#age").val();
		return reg.test(age);
	}
	
	function isValidEmail() {
		if($('#prefixEmail').val() == ""
			|| $('#suffixEmail').val() == "") {
			return false;
		}
		
		completeEmailString();
		return true;
	}
	
	//email 옵션 선택 후 주소완성 
	function completeEmailString() {
		var prefix = $('#prefixEmail').val();
		var suffix = $('#suffixEmail').val();	
		var email = prefix + "@" + suffix;
		
		$("#email").val(email);
		return email;
	}

	</script>

</html>

