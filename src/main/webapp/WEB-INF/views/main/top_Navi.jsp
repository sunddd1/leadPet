<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<style>
		#topNavi{
			list-style-type:none;
			margin: 10px;
        	white-space: nowrap;
		}
		#topNavi li{
			display: inline;
			border: 2px solid black;
			padding: 10px;
			border-radius: 20px;
			font-size: 13pt;
		}
		#searchBar{
			width: 90%;
			margin: 10px;
		}
		th select{
			width: max-content;
		}
		#right{
			text-align: right;
		}
		#topSearchBtn{
			margin: 10px;
			border-radius: 10px;
		}
		
		#side_Navi li{
			border: 1px solid;
      	 	padding: 10px 20px;
      	 	border-radius: 20px;
      	 	list-style-type:none;
      	 	text-align: center;
		}
		
		#side_Navi{
			font-size: 12pt;
			white-space: nowrap;
			position: absolute;
			top: 30%;
			left : 3%;
		}
		
		#topSch{
			width: 100%;
			margin-bottom: 5px;
        	white-space: nowrap;
        	min-width: 600px;
		}
		#topSch th, #topSch td{
			widows: 100%;
		}
		#topBox{
			width: 70%;
			min-width: 1200px;
		}
		#mainImg{
		 	width: 100px;
		 	height: 100px;
		 	float: right;
		}
		.loginbox{
			width: 100px;
		}
		.searchBar{
			width: 300px;
			min-width: 300px;
			max-width: 300px;
		}	
		a{
			text-decoration: none;			
			color : black;
		}
		a:hover {		
			color: gray;
		}
		</style>
	</head>
	<body>		
		<table style="margin-top: 10px;">
			<tr>
				<td style="width:30%;">
					<a href="./"><img src="https://i.postimg.cc/kM0WzZwg/image.png" id="mainImg" alt="메인페이지"/></a>
				</td>
				<td>
		<div id="topBox">
		<table id="topSch">
			<tr>
				<td class="firstBar" id="right">
					<select>
						<option value="ALL"<c:if test="${category eq 'ALL' }"> selected</c:if>>전체</option>
						<option value="living"<c:if test="${category eq 'living' }"> selected</c:if>>리빙</option>
						<option value="play"<c:if test="${category eq 'play' }"> selected</c:if>>놀이</option>
						<option value="food"<c:if test="${category eq 'food' }"> selected</c:if>>사료간식영양제</option>
						<option value="park"<c:if test="${category eq 'park' }"> selected</c:if>>공원</option>
						<option value="restaurant"<c:if test="${category eq 'restaurant' }"> selected</c:if>>식당</option>
						<option value="medical"<c:if test="${category eq 'medical' }"> selected</c:if>>의료</option>
					</select>
				</td>
				<th class="searchBar" colspan="2">
					<input id="searchBar" type="text" value="${keyword }"/>
				</th>
				<td class="firstBar">
					<button id="topSearchBtn">SEARCH</button>
				</td>
			    <c:if test="${sessionScope.loginId eq null}">
	                <th class="loginbox" onclick="location.href='./login-form'">로그인</th>
                </c:if>
                <c:if test="${sessionScope.loginId ne null}">
	                <th class="loginbox" onclick="location.href='./logout'">로그아웃</th>
                </c:if>
                <c:if test="${sessionScope.loginId eq null}">
	                <th class="loginbox" onclick="location.href='./registForm'">회원가입</th>
                </c:if>
                <c:if test="${sessionScope.loginId ne null}">
	                <th class="loginbox" onclick="location.href='./noteList'">쪽지함</th>
                </c:if>
			</tr>
		</table>
		<ul id="topNavi">
				<li id="exBBS" onclick="location.href='./BoardList'">댕냥노하우/경험기</li>
				<li onclick="location.href='./admin'">갤러리</li>
				<li onclick="location.href='./admin'">사료,간식,영양제 추천</li>
				<li onclick="location.href='./admin'">동반입장 식당 소개</li>
				<li onclick="location.href='./admin'">목줄 프리 공원</li>			
				<c:if test="${sessionScope.isMaganer eq null}">
					<li id="myNavi" onclick="location.href='./member-detail?id=${sessionScope.loginId}'">마이페이지</li>
				</c:if>
				<c:if test="${sessionScope.isMaganer ne null}">
					<li id="adNavi" onclick="location.href='./admin'">관리자페이지</li>	
				</c:if>			
				<li onclick="location.href='./gameMain'">미니게임</li>
		</ul>
		</div>
				</td>
			</tr>
		</table>
		
	</body>
	<script>
		$('#topSearchBtn').click(function() {
			var category= $('select').first().val();
			var keyword = $('#searchBar').val();
			console.log("검색 요청" + category+"/"+keyword);
			if(keyword!=""){
				location.href="./topsearch?category="+category+"&keyword="+keyword;
			}
			/* $.ajax({
				type:'get'
				,url:'search'
				,data:{
					
				}
				,dataType:'json'
				,success : function(data) {
					console.log(data);
				}
				,error : function(e) {
					console.log(e);
				}
				
			}); */
			
		});
	</script>
</html>