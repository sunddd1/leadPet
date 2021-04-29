<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
	<title>회원가입</title>
	<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
	<style>
		table, th, td {
			border : 1px solid black;
		}
	</style>
	</head>
	
	
	<body>
		<form id="registForm" action="regist" method="post">
			<table>			
				<tr>
					<th colspan="2">
						<h2>회원가입</h2>
					</th>
				</tr>
				<tr>
					<th>
						<label for="id">아이디</label>
					</th>
					<td>
						<input type="text" name="id" id="id" />
						<input type="button" value="중복 확인" onclick="isDuplicateId()" />
					</td>
				</tr>
				<tr>
					<th>
						<label>비밀번호</label><br/>
					</th>
					<td>
						<input type="password" name="password" id="password" onkeyup="checkPw()" width="400px"/>
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
						<input type="text" name="nickname" id="nickname"/>
						<input type="button" value="중복 확인" onclick="isDuplicateNickname()" />
					</td>
				</tr>
				<tr>
					<th>
						<label>이름</label>
					</th>
					<td>
						<input type="text" name="name"id="name" />
					</td>
				</tr>
				<tr>	
					<th>
						<label>나이</label>
					</th>
					<td>					
						<input type="number" min="1" max="130"name="age" id="age" />
					</td>
				</tr>
				<tr>
					<th>
						<label>성별</label> 
					</th>
					<td>
						<input type="radio" name="gender" value="남" id="male" checked/>남
						<input type="radio" name="gender" value="여" id="female" />여
					</td>
				</tr>
				<tr>
					<th>
						<label>이메일</label><br>
					</th>
					<td>
						<input type="hidden" name="email"/>
						<input type="text" id="prefixEmail"/>
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
						<input type="button" value="회원가입" onclick="regist()"/>
					</th>
				</tr>
			</table>
		</form>
	</body>
	<script>

	var validId = false;
	var validPw = false;
	var validNickname = false;
	
	function isDuplicateId() {
		var $id = $("#id");
		
		if($id.val() == "") {
			alert("아이디를 입력해주세요.");
			return;
		}
		
		$.ajax({
			type:'get'
			,url:'check-duplicate-id'
			,data:{"id":$("#id").val()}
			,dataType:'JSON'
			,success:function(result){
				var msg = "이미 사용중인 아이디입니다.";
				validId = false;
				
				if(result) {
					msg = "사용 가능한 아이디입니다.";
					validId = true;
				}
				
				alert(msg);
			}
			,error:function(e){
				console.log(e);
			}
		});
	}
	
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
		$.ajax({
			type:'get'
			,url:'check-duplicate-nickname'
			,data:{"nickname":$("#nickname").val()}
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

	// 비밀번호 불일치일 때, 글자 안띄우기
	
	
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
	function regist() {
		if(isAllValid()) {
			$('#registForm').submit();
		}
	}
	
	function isAllValid() {
		if(!isValidId()) {
			alert("아이디를 확인해주세요.");
			return false;
		}
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
	
	function isValidId() {
		return validId;
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
	
	/* var idChk = false;//ID 중복 체크 여부
	var emailChk = false;//이메일 중복체크
	var re = /^[a-zA-Z0-9]{4,15}$/; //ID 유효
	var re2 = /^[a-zA-Z0-9!@#$%^*+=-]{4,15}$/; //PW 유효
	var re3 = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; //이름 유효
	var re4 = /^[0-9]{1,3}$/; //나이 유효
	var re5 = /^[a-z0-9]{4,50}$/; //email 유효	 
	*/
		
	</script>

</html>

