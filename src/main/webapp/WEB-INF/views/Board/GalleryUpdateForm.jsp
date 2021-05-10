<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
	table,td, th{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 5px 10px;
		text-align: center;
	}
	
	input[type='text']{
		width: 100%;
	}	
	
	table{
		width:100%;
	}
	
	#editable{
		width: 100%;
		height: 200px;
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
<hr/>
<form action="BoardUpdate" method="post">
	<table>
		<tr>
			<th>작성자</th>
			<input type="text" name="bbs_idx" value="${dto.bbs_idx }" style="display: none"/>
			<input type="text" name="type" value="gal" style="display: none"/>
			<td colspan="3"><input type="text" name="nickname" value="${dto.nickname}" readonly/></td>
			<c:if test="${dto.dog_cat ne null}">
				<td colspan="2">
					<input type="text" name="dog_cat" value="${dto.dog_cat}" readonly/></td>
					<input type="text" name="pet_idx" value="${dto.pet_idx}" style="display: none"/>
					<input type="text" name="type" value="gal" style="display: none"/>
				</td>
			</c:if>
		</tr>
		<tr>
			<th>카테고리</th>
			<td>
				<select name="category_name" value="${dto.category_name }">
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
			<td colspan="5"><input type="text" name="bbs_subject" value="${dto.bbs_subject }"/></td>
		</tr>
		<tr>
			<th>내용</th>
			<td  colspan="5">
				<textarea  id="bbs_content" name="bbs_content" rows="10" cols="100" style="resize: none; width: 100%; text-align: left;">
					${dto.bbs_content}
				</textarea>
			</td>
		</tr>
		<tr>
			<th>사진</th>
			<td style="border-right: 0px;"><div id="editable" contenteditable="false"><a href='#'  id ="/photo/${dto.newFileName}" onclick="del(this)"><br/><img src="/photo/${dto.newFileName}" width='250'/><b>X</b></a></div></td>
		</tr>
		<tr>
			<th >파일첨부</th>
			<td colspan="5">	
				<input type="button" value="사진 업로드" onclick="fileUp()"/>
			</td>
		</tr>
		<tr>
			<td colspan="6">
				<input id="save" type="button" value="수정하기"/>
				<input id="cancle" type="button" value="취소" onclick="location.href='GalleryDetail/${dto.bbs_idx}'" style="margin-left: 50px"/>
			</td>
		</tr>	
	</table>
</form>
<a></a>
</body>
<script>

console.log("${sessionScope.fileList}")

$("#save").click(function(){
	//editable 에 있는 내용을 content  의  value 에 넣기
	/* $("#editable a").find("b").remove(); */
	/* $("#editable a").removeAttr('onclick'); */
 	var editable = $('#editable');
	console.log(editable.html())
 	if(editable.html()==""){
		alert("사진은 한개이상 있어야합니다");
	}else{	
	$("form").submit();
	}
});



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
				console.log(elem)
				elem.remove();//이미지와 X버튼 삭제
			}
		},
		error:function(e){
			console.log(e);
		}
	});
	
}

function fileUp(){
	var editable = $('#editable');
	console.log(editable.html())
	if(editable.html()==""){	
		var session ="${sessionScope.loginId}";
		console.log(session);
		window.open('uploadForm','file upload','width=400, height=100');
	}else{
		alert("사진이 한개 존재합니다.")
	}
}



</script>
</html>