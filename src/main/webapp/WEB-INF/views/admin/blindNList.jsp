<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
		<title>관리자 목록</title>
		<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
	</head>
<style>
    a{
        text-decoration: none;
    }
    #search{
        text-align: center;
        margin-top: 7%;
    }
    input[type=text]{
        width: 500px;
        height: 22px;
    }
    select,input[type=submit]{
        height: 30px;
        width: 70px;
    }
    table {
        border-collapse: separate;
        border-spacing: 0;
        text-align: center;
        line-height: 1.5;
        border-top: 1px solid #ccc;
        border-left: 1px solid #ccc;
        margin : auto;
    }
    th {
        width: 120px;
        padding: 10px;
        font-weight: bold;
        vertical-align: top;
        border-right: 1px solid #ccc;
        border-bottom: 1px solid #ccc;
        border-top: 1px solid #fff;
        border-left: 1px solid #fff;
        background: #eee;
    }
    td {
        width: 150px;
        padding: 10px;
        vertical-align: top;
        border-right: 1px solid #ccc;
        border-bottom: 1px solid #ccc;
    }
    .table{
        margin-top: 10px;
    }
	h4{
		position: relative;
		left: 20%;
		float: left;
		z-index: 5;
		color: white;
		font-size: 25px;
		margin-top: 5px;
	}
	#radio{
		position: relative;
		left: 70%;
	}
</style>
<body>
<button onclick="location.href='admin'">관리자관리 리스트</button>
<button onclick="location.href='memberList'">회원관리 리스트 DEMO</button>
<button onclick="location.href='reportList'">글 신고 리스트 DEMO</button>
	
    <div id="search">
        <form action="blindNSearch" method="POST">
            <input type="text" value="${params.keyword}" name="keyword" placeholder="닉네임으로 검색">
            <input type="submit" value="검색">
        </form>
    </div>
    <div id="radio">
        <input type="radio" id="r1" name="radio" value="notFinish" checked="checked" OnClick="window.location.href='blindNList'"/>N
        <input type="radio" id="r2" name="radio" value="finish" OnClick="window.location.href='blindYList'"/>Y
    </div>
    <div class="table">
        <table>
            <tr>
               <th>글 번호</th>
               <th>닉네임</th>
                <th>블라인드 여부</th>
                <th>글쓰기 날짜</th>
                <th></th>
            </tr>
            <c:forEach items="${blindNList}" var="board">
	            <tr>
	            	<td><a href="#">${board.bbs_idx}</a></td>
	            	 <td>${board.nickname}</td> 
	                <td>${board.bbs_blind}</td> 
	                <td>${board.reg_date}</td>
	                <td>
	                	<button value="${board.bbs_idx}" onclick='toggleDisable(this)'>블라인드 추가</button>
	                </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
<script>
	var msg = "${msg}";
	if(msg != ""){
		alert(msg);
		window.close();
	}
	
	$('#type').change(function(){
		var type = $(this).val();
		console.log(type);
		$.ajax({ 
			type:'GET' 
			,url:'type'
			,data:{"type": type}
			,dataType: 'text' 
			,success: function(data){
				console.log(data);
			}
			,error: function(e){
				console.log(e);
			}
		});
	});
	
	
	$("#save").click(function(){
		var id = opener.oriWindow;
		console.log(id);
		var newPass = $("#newPass").val();
		var allData = {"newPass": newPass, "id": id };
			$.ajax({ 
				type:'GET' 
				,url:'change'
				,data:allData
				,dataType: 'tes' 
				,success: function(data){
					if(data == 1){
					alert("변경 완료");
					opener.parent.location.reload();
					window.close();
					}
				}
				,error: function(e){
					console.log(e);
				}
			});
	});
	
function toggleDisable(buttonObj) {
		
		var button = $(buttonObj);
		var flag = $("#"+buttonObj.value);
	
		console.log(button);
		console.log(flag);
		
		if(confirm('블라인드 처리 하시겠습니까?')){
			$.ajax({ 
				type:'GET' 
				,url:'blindY'
				,data: { "idx": buttonObj.value }
				,dataType: 'json' 
				,success: function(data){
					if(data == 1){
						alert('블라인드 완료');
						window.location.reload();
					}
				}
				,error: function(e){
					console.log(e);
				}
			});
	}else{
		alert("블라인드 취소");
	}
	};
</script>
</html>