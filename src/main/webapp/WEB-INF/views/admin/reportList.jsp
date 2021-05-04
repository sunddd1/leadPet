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
        <form action="reportSearch" method="POST">
        <select id="type" name="type">
	    	<option value="">타입</option>
	    	<option value="tip">팁</option>
	    	<option value="gal">갤러리</option>
	    	<option value="fed">사료</option>
	    	<option value="run">산책</option>
	    	<option value="res">식당</option>
	    </select>
            <input type="text" value="${params.keyword}" name="keyword" placeholder="아이디로 검색">
            <input type="submit" value="검색">
        </form>
    </div>
    <div id="radio">
        <input type="radio" id="r1" name="radio" value="notFinish" checked="checked" OnClick="window.location.href='reportList'"/>미처리
        <input type="radio" id="r2" name="radio" value="finish" OnClick="window.location.href='finishList'"/>처리
    </div>
    <div class="table">
        <table id="report">
            <tr>
               <th>신고자</th>
                <th>신고 글 번호</th>
                <th>사유</th>
                <th>신고일</th>
                <th>처리유무</th>
            </tr>
            <c:forEach items="${reportList}" var="report">
	            <tr>
	                <td>
		                <a href="detailMember?id=${report.id}" 
		                onclick="window.open(this.href, 'detailMember', 'width=800, height=600, top=100, left=400'); return false;">
		               	 	${report.id}
		                </a>
	                </td>
	                <td><a href="#">${report.field}</a></td>
	                <td>${report.reason}</td>
	                <td>${report.reg_date.substring(0,10)}</td>
	                <td>${report.proc_ex}</td> 
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
	
	function detail(id){
		window.open('detailMember?id='+id, 'detailMember', 'width=800, height=600, top=100, left=400');
	}
	
	
	$('#type').change(function(){
		var type = $(this).val();
		console.log(type);
		$.ajax({ 
			type:'GET' 
			,url:'type'
			,data:{"type": type}
			,dataType: 'json' 
			,success: function(data){
				console.log(data);
				var list = data.reportList;
			 	$("#report").html('');
				for(var i=0;i<list.length;i++){
					var content = '';
					if(i==0){
						content += '<tr> <th>신고자</th> <th>신고 글 번호</th><th>사유</th><th>신고일</th><th>처리유무</th></tr>';
					}
					content += '<tr>';
					content += '<td onclick=detail("'+list[i].id+'")>';
					content += list[i].id+'</td>';
					content += '<td>'+list[i].field+'</td>';
					content += '<td>'+list[i].reason+'</td>';
					content += '<td>'+list[i].reg_date.substring(0,10)+'</td>';
					content += '<td>'+list[i].proc_ex+'</td>';
					content += '</tr>';
					$("#report").append(content);
				}
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
</script>
</html>