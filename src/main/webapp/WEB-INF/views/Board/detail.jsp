<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<table>
            <tr>
                <th>조회수 </th>
                <td>${dto.views }</td>
                <th>추천</th>
                <td>${dto.reco_count }</td>
                <td id="reco"></td>
                <th>댓글갯수</th>
                <td></td>
                <th>작성일</th>
                <td>${dto.reg_date }</td>
            </tr>
			<tr>
				<th>제목</th>
				<td>${dto.bbs_subject }</td>
			</tr>
            <tr>
                <th>닉네임</th>
                <td>${dto.nickname }</td>
                <c:if test="${dto.pet_name ne null}">
	                <th>사진</th>
	                <td>${dto.pet_newfilename }</td>
	                <th>이름</th>
	                <td>${dto.pet_name }</td>
	                <th>품종</th>
	                <td>${dto.kind }</td>
	                <th>생년월일</th>
	                <td>${dto.bday }</td>
	                <th>무게</th>
	                <td>${dto.kg }</td>
                </c:if>
            </tr>
			<tr>
				<th>내용</th>
				<td>${dto.bbs_content }</td>
			</tr>
		</table>
		
		<table>
			<thead>
			<tr>
				<td>
					<textarea id="reply_content" rows="4" cols="100" placeholder="댓글을 입력하시오"></textarea>
				</td>
				<td>
					<button onclick='replyButton()'>등록</button>
				</td>
			</tr>
			</thead>
			<tbody id="replyList">
			
			</tbody>
		</table>
	</body>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script>
		$(document).ready(function(){
			replyList();
			recoConfirm();
		});

	
		// 시작하자마자 reco 여부 검사
		
		//추천검사
		function recoConfirm(){
			$.ajax({
				type:'GET'
				,url:'recoConfirm'
				,data:{
					id: 'test1122'
					,bbs_idx: '${dto.bbs_idx}'
				}
				,dataType:'JSON'
				,success:function(data){
						var content = "";
						if(data){
							content+=" <button style='display: none; font-size:15px;'>♡ </button>"
							content+=" <button onclick='recoButton(this)' style='display: ; font-size:15px;'>❤️</button>"
							$("#reco").empty();
							$("#reco").append(content);	
						}
						else{
							content+=" <button onclick='norecoButton(this)' style='display: ; font-size:15px;'>♡ </button>"
							content+=" <button style='display:none ; font-size:15px;'>❤️</button>"
							$("#reco").empty();
							$("#reco").append(content);
						}
				}
				,error:function(e){
					console.log(e);
				}
			})
		}
		
		function norecoButton(elem){
			var recoContent ={}
			recoContent.bbs_idx = '${dto.bbs_idx}';
			recoContent.id = 'test1122';
			console.log(recoContent.bbs_idx,recoContent.id);
			
			$.ajax({
				type:'GET'
				,url:'recoUp'
				,data:recoContent
				,dataType:'JSON'
				,success:function(data){
						if(data){
							console.log(data)
							recoP();
						}else{
							console.log("추천 실패입니다")
						}
				}
				,error:function(e){
					console.log(e);
				}
			})
		}
		
		function recoButton(elem){
			var recoContent ={}
			recoContent.bbs_idx = '${dto.bbs_idx}';
			recoContent.id = 'test1122';
			console.log(recoContent.bbs_idx,recoContent.id);
			
			$.ajax({
				type:'GET'
				,url:'recoDown'
				,data:recoContent
				,dataType:'JSON'
				,success:function(data){
						if(data){
							console.log(data)
							recoM();
						}else{
							console.log("추천취소 실패입니다")
						}
				}
				,error:function(e){
					console.log(e);
				}
			})
		}
		
		
		function recoP(){
			//조회수,좋아요 개수 넣고 기존꺼 지우고 뿌려준다.
			var content = "";
			content+="<button  style='display: none; font-size:15px;'>♡ </button>"
			content+="<button onclick='recoButton(this)' style='display: ; font-size:15px;'>❤️</button>"
			$("#reco").empty();
			$("#reco").append(content);
		}
		
		function recoM(){
			var content = "";
			content+="<button onclick='norecoButton(this)'  style='display: ; font-size:15px;'>♡ </button>"
			content+="<button  style='display: none; font-size:15px;'>❤️</button>"
			$("#reco").empty();
			$("#reco").append(content);
		}
		//댓글리스트
		function replyList(){
			var replyContent ={}
			replyContent.bbs_idx = '${dto.bbs_idx}';
			replyContent.id = 'test1122';
			$.ajax({
				type:'POST'
				,url:'replyList'
				,data:replyContent
				,dataType:'JSON'
				,success:function(data){
						if(data){
							console.log(data.replyList.length);
							console.log(data.replyList.nickname);
							var replyDraw = ""
							if(data.replyList.length==0){
								replyDraw += "<tr><td>댓글이 없습니다.</td></tr>"
								$("#replyList").empty();
								$("#replyList").append(replyDraw);
							}else{
								replyListDraw(data.replyList);
							}
						}else{
							console.log("댓글리스트 불러오기 실패")
						}
				}
				,error:function(e){
					console.log(e);
				}
			})
		}
		
		//댓글리스트 그리기
		function replyListDraw(list){
			var replyDraw = "";
			for(var i =0; i<list.length; i++){
				replyDraw +="<tr>"
				replyDraw +="<td>"+list[i].nickname+"</td>"
				replyDraw +="<td>"+list[i].reg_date+"</td>"
				replyDraw +="<td><a href='#'>수정</a></td>"
				replyDraw +="<td><a href='#'>삭제</a></td>"
				replyDraw +="</tr>"
				replyDraw +="<tr>"
				replyDraw +="<td>"+list[i].reply_content+"</td>"
				replyDraw +="</tr>"
			}
			$("#replyList").empty();
			$("#replyList").append(replyDraw);
		}
		
		//댓글 등록
		function replyButton(){
			var replyContent ={}
			replyContent.reply_content = $('#reply_content').val();
			replyContent.bbs_idx = '${dto.bbs_idx}';
			replyContent.id = 'test1122';
			console.log(replyContent.bbs_idx,replyContent.id,replyContent.reply_content);
			
			$.ajax({
				type:'POST'
				,url:'replyWrite'
				,data:replyContent
				,dataType:'JSON'
				,success:function(data){
						if(data){
							console.log(data)
							replyList();
							$('#reply_content').val('');
						}else{
							console.log("댓글쓰기 실패입니다")
						}
				}
				,error:function(e){
					console.log(e);
				}
			})
			
		}
		
		
	</script>
</html>