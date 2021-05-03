<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<style>
		#topNavi .firstBar{
			border-color: white;
		}
        #topNavi th{
        	border: 2px solid black;
            padding: 5px 10px;
            white-space: nowrap;
            border-top-color: black;
            border-radius: 10px;
        }
		#topNavi{
			width: max-content;    
            margin-right: 15%;
            margin-left: 15%;
		}
		#searchBar{
			width: 100%;
		}
		th select{
			width: max-content;
		}
		#right{
			text-align: right;
		}
		#topSearchBtn{
			border-radius: 10px;
		}
		
		#side_Navi,#side_Navi th{
			border: 1px solid;
      	 	padding: 5px 10px;
       	 	border-collapse: collapse;
		}
		
		#side_Navi{
			white-space: nowrap;
		}
		</style>
	</head>
	<body>		
	관리자 인가 ? : ${sessionScope.isMaganer} ---- ${sessionScope.loginId}

		<table id="topNavi">
			<tr>
				<th class="firstBar"></th>
				<td class="firstBar" id="right">
					<select>
						<option value="ALL">전체</option>
						<option value="living">리빙</option>
						<option value="play">놀이</option>
						<option value="food">사료간식영양제</option>
						<option value="park">공원</option>
						<option value="restaurant">식당</option>
						<option value="medical">의료</option>
					</select>
				</td>
				<th class="firstBar" colspan="2">
					<input id="searchBar" type="text"/>
				</th>
				<td class="firstBar">
					<button id="topSearchBtn">SEARCH</button>
				</td>
			    <c:if test="${sessionScope.loginId eq null}">
	                <th class="firstBar" onclick="location.href='./login-form'">로그인</th>
                </c:if>
                <c:if test="${sessionScope.loginId ne null}">
	                <th class="firstBar" onclick="location.href='./logout'">로그아웃</th>
                </c:if>
                <c:if test="${sessionScope.loginId eq null}">
	                <th class="firstBar" onclick="location.href='./registForm'">회원가입</th>
                </c:if>
                <c:if test="${sessionScope.loginId ne null}">
	                <th class="firstBar" onclick="location.href='./noteList'">쪽지함</th>
                </c:if>
			</tr>
			<tr>
				<th onclick="location.href='./BoardList'">댕냥노하우/경험기</th>
				<th onclick="location.href='./admin'">갤러리</th>
				<th onclick="location.href='./admin'">사료,간식,영양제 추천</th>
				<th onclick="location.href='./admin'">동반입장 식당 소개</th>
				<th onclick="location.href='./admin'">목줄 프리 공원</th>			
				<c:if test="${sessionScope.isMaganer eq null}">
					<th onclick="location.href='./admin'">마이페이지</th>
				</c:if>
				<c:if test="${sessionScope.isMaganer ne null}">
					<th onclick="location.href='./admin'">관리자페이지</th>	
				</c:if>			
				<th onclick="location.href='./gameMain'">미니게임</th>
                <th style="border-color: white;"></th>
                <th style="border-color: white;"></th>
                <th style="border-color: white;"></th>
                <th style="border-color: white;"></th>
			</tr>
		</table>
	</body>
	<script>
		$('#topSearchBtn').click(function() {
			var category= $('select').first().val();
			var keyword = $('#searchBar').val();
			console.log("검색 요청" + category+"/"+keyword);
			if(keyword!=""){
				location.href="./searchBbs?category="+category+"&keyword="+keyword;
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