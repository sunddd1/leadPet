<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
	#writeForm,#writeForm td,#writeForm th{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 5px 10px;
		text-align: center;
	}
	
	input[type='text']{
		width: 100%;
	}	
	
	#writeForm{
		width:60%;
		margin-top: 100px;
		margin-left: 20%;
	}
	
	#editable{
		width: 99%;
		height: 500px;
		border: 1px solid gray;
		text-align: left;
		overflow: auto;
		margin:5px;
		padding:5px;
	}

</style>
</head>
<body>
<jsp:include page="../main/top_Navi.jsp"/>
<h3>글쓰기</h3>
<form action="write" method="post">
	<table id="writeForm">
		<tr>
			<th>작성자</th>
			<td colspan="3"><input type="text" name="nickname" value="${dto.nickname}" readonly/></td>
			<c:if test="${dto.dog_cat ne null}">
				<td colspan="2">
					<input type="text" name="dog_cat" value="${dto.dog_cat}" readonly/></td>
					<input type="text" name="pet_idx" value="${dto.pet_idx}" style="display: none"/>
					<input type="text" name="type" value="tip" style="display: none"/>
				</td>
			</c:if>
		</tr>
		<tr>
			<th>카테고리</th>
			<td>
				<select name="category_name">
				    <option value="food">food</option>
				    <option value="park">park</option>
				    <option value="restaurant">restaurant</option>
				    <option value="living">living</option>
				    <option value="play">play</option>
				    <option value="medical">medical</option>
				</select>
			</td>
			<td>${dto.pet_name}</td>
			<td>${dto.kind }</td>
			<td>${dto.bday}</td>
			<td>${dto.kg }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="5"><input type="text" name="bbs_subject" value=""/></td>
		</tr>
		<tr>
			<th>내용</th>
			<td  colspan="5">
				<div id="editable" contenteditable="true"></div>
				<input id="bbs_content" type="hidden" name="bbs_content" value=""/>
			</td>
		</tr>
		<tr>
			<th >파일첨부</th>
			<td colspan="5">
				<input type="button" value="사진 업로드" onclick="fileUp()"/>
			</td>
		</tr>
		<tr>
			<td colspan="6">
				<input id="save" type="button" value="글작성"/>
				<input id="cancle" type="button" value="취소" onclick="location.href='BoardList'" style="margin-left: 50px"/>
			</td>
		</tr>	
	</table>
</form>
</body>
<script>

$("#save").click(function(){
	//editable 에 있는 내용을 content  의  value 에 넣기
	/* $("#editable a").find("b").remove(); */
	/* $("#editable a").removeAttr('onclick'); */
	$("#bbs_content").val($("#editable").html());
	$("form").submit();
});


function fileUp(){
	window.open('uploadForm','file upload','width=400, height=100');
}

function del(elem){
	console.log(elem);
	var newFileName = elem.id.substring(elem.id.lastIndexOf("/")+1);
	console.log(newFileName);

	$.ajax({
		url:'fileDelete',
		type:'get',
		data:{"newfileName":newFileName},
		dataType:'json',
		success:function(d){
			console.log(d);
			if(d.success == 1){
				//2. 파일 삭제 요청이 완료 되면 화면에 나타난 사진 삭제				
				$(elem).remove();//이미지와 X버튼 삭제
			}
		},
		error:function(e){
			console.log(e);
		}
	});
	
}



</script>
</html>