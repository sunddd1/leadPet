<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원탈퇴</title>
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<style>
			#interestPopupTable, #interestPopupTable td {
			}
			#interestPopupTable {
				background-color: white;
				position: absolute;
				top: 200px;
  				left: 200px;
  				z-index: 6;
  				border: 3px solid;
  				border-radius: 10px
			}
			#interestPopupTable td{
				padding: 10px;
			} 
		</style>
	</head>
	<body>
	<div id="interestPopupTable" style="display: none">
		<table>
			<tr>
				<td><a id="written" href="#">작성 글 보기</a></td>
			</tr>
			<tr>
				<td><a id="pet" href="#">반려동물 보기</a></td>
			</tr>
				<tr id="interestDiv"></tr>
			<tr>
				<td><a id="note" href="#">쪽지 보내기</a></td>
			</tr>
		</table>
	</div>
	</body>
	<script>
		
		var xPoint = 0;
		var yPoint = 0;
		
		$(document).mousemove(function(e) {
	    		xPoint = e.pageX;
				yPoint = e.pageY;
	    	}
		);
		
		$(document).click(function(e) {
				var $table = $("#interestPopupTable");
	
				var left = $table.position().left;
				var top = $table.position().top;
				var width = $table.innerWidth();
				var height = $table.innerHeight();
				
				if(left <= xPoint && xPoint <= left + width 
						&& top <= yPoint && yPoint <= top + height) {
					return;
				}
				
				$table.css({"display": "none"});
	    	}
		);

		function idClickPopup(nickname) {
			console.log("nickname : " + nickname);
			
			var $table = $("#interestPopupTable");
	    	$table.css({"display": ""});
			$table.css({"left": xPoint, "top": yPoint});
			
			// interestPopupTable안의 href 설정은 아래 함수에서 처리함.
			findIdByNickname(nickname);
		}
		
		// nickname으로 id 찾기
		function findIdByNickname(nickname) {
			$.ajax({
				type:'GET'
				,url:'find-id-by-nickname'
				,data:{'nickname' : nickname}
				,success:function(result) {
					var id = result;
					
					$("#written").attr("href", "./writeList?id=" + id);
					interestTag(id);
					$("#pet").attr("href", "./listPet?id=" + id);
					$("#note").attr("href", "./borderlist");
					
				},error:function(e) {
					console.log("비동기 에러");
				}
			})
		}
		
		// 관심유저 등록/취소  글자 결정.
		function interestTag(interestId) {
			$.ajax({
				type:'GET'
				,url:'has-interest-id'
				,data:{'interestId' : interestId}
				,dataType:'JSON'
				,success:function(result) {
					var tag = "<td><a href=\"javascript:addFriend(\'" + interestId + "\');\">관심유저 등록</a></td>";
					
					if(result) {
						tag = "<td><a href=\"javascript:deleteFriend(\'" + interestId + "\');\">관심유저 취소</a></td>";
					}

					$("#interestDiv").html(tag);
					
				},error:function(e) {
					console.log("비동기 에러");
				}
			})
		}
		
		// 관심유저 등록
		function addFriend(interestId) {
			$.ajax({
				type:'GET'
				,url:'insert-interest-id'
				,data:{'interestId' : interestId}
				,dataType:'JSON'
				,success:function(result) {
					var tag = "<td><a href=\"javascript:addFriend(\'" + interestId + "\');\">관심유저 등록</a></td>";
					
					if(result) {
						tag = "<td><a href=\"javascript:deleteFriend(\'" + interestId + "\');\">관심유저 취소</a></td>";
					}

					$("#interestDiv").html(tag);
					
				},error:function(e) {
					console.log("비동기 에러");
				}
			})
		}
		
		// 관심유저 취소
		function deleteFriend(interestId) {
			$.ajax({
				type:'GET'
				,url:'delete-interest-id'
				,data:{'interestId' : interestId}
				,dataType:'JSON'
				,success:function(result) {
					var tag = "<td><a href=\"javascript:deleteFriend(\'" + interestId + "\');\">관심유저 취소</a></td>";
					
					if(result) {
						tag = "<td><a href=\"javascript:addFriend(\'" + interestId + "\');\">관심유저 등록</a></td>";
					}

					$("#interestDiv").html(tag);
					
				},error:function(e) {
					console.log("비동기 에러");
				}
			})
		}
		
		
		
	</script>
</html>