<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>
			
			#profile,#profile td,#profile th{
					width: max-content;
					border: 1px solid black;
					border-collapse: collapse;
					padding: 5px 10px;
					text-align: center;
					margin-left: 14%;
					margin-top: 3%;
			}
			
			#reply{
				width: max-content;
				margin-left: 14%;
				margin-top: 3%;
			}
		</style>
	</head>
	<body>
	<jsp:include page="../main/top_Navi.jsp"/>
		<table id="profile">
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
                <td>${dto.id }</td>
                <!-- 임시 닉네임 지정 세션으,로 변경해야함  -->
                <c:if test="${dto.id eq sessionScope.loginId}">
	                <td colspan="3" style="text-align: left;">
	                	<button onclick="location.href='BoardUpdateForm?bbs_idx=${dto.bbs_idx}' ">수정하기</button>
	                	<button onclick="location.href='BoardDel?bbs_idx=${dto.bbs_idx}' ">삭제하기</button>
	                </td>
                </c:if>
                <c:if test="${dto.id ne sessionScope.loginId}">
	                <td>
			            <form action="BoardReportForm" method="POST" name="BoardReportForm" target="boardreport" style="display: none">
							<input type="text" name="id" value="${sessionScope.loginId}">
							<input type="text" name="id" onclick='idClickPopup()' value="${sessionScope.loginId}">
							<input type="text" name="bbs_idx" value="${dto.bbs_idx }">
							<input type="text" name="type" value="${dto.type }">
						</form>
	                	<button onclick="BoardreportForm()">신고하기</button>
	                </td>
                </c:if>
                
            </tr>
			<tr>
				<th>제목</th>
				<td colspan="11">${dto.bbs_subject }</td>
			</tr>
            <tr>
                <th>닉네임</th>
                <td>${dto.nickname }</td>
                <c:if test="${dto.pet_name ne null}">
	                <th>사진</th>
	                <td>
	                		<img src='/photo/${dto.pet_newfilename}' width='100px' height='100px'/>
	                </td>
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
				<td id="bbs_content" colspan="12">${dto.bbs_content }</td>
			</tr>
		</table>
		
		<table style="border-collapse: collapse;" id="reply">
			<tr>
				<td>
					<textarea id="reply_content" rows="4" cols="100" placeholder="댓글을 입력하시오"></textarea>
				</td>
				<td>
					<button onclick='replyButton()'>등록</button>
				</td>
			</tr>
			<tbody id="replyUpdate" style="border: 2px solid black">
				
			</tbody>
			<tbody id="replyList">
			
			</tbody>
		</table>
		<div id="moreReply" style="border: 2px solid black; text-align: center;" onclick="moreReply();" >더보기</div>
	
	</body>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script>
	
		var endNum = 5;
		
		$(document).ready(function(){
			$("#bbs_content a").find("b").remove();
			$("#editable a").removeAttr('onclick');
			$()
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
					id: '${sessionScope.loginId}'
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
			recoContent.id = '${sessionScope.loginId}';
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
			//로그인아이디로 변경해야함
			recoContent.id = '${sessionScope.loginId}';
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
			replyContent.endNum = endNum;
			console.log(replyContent)
			$.ajax({
				type:'POST'
				,url:'replyList'
				,data:replyContent
				,dataType:'JSON'
				,success:function(data){
						if(data){
							console.log(data.replyList)
							console.log(data.replyList.length);
							var replyDraw = ""
							if(data.replyList.length==0){
								replyDraw += "<tr><td>댓글이 없습니다.</td></tr>"
								$("#replyList").empty();
								$("#replyList").append(replyDraw);
								$("#moreReply").remove();
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
			console.log(list.length)
			var replyDraw = "";
			for(var i =0; i<list.length; i++){
				replyDraw +="<tr>"
				replyDraw +="<td><b>"+list[i].nickname+"</b></td>"
				var date = new Date(list[i].reg_date);
				replyDraw +="<td>"+date.toLocaleDateString("ko-KR")+"</td>"
				//로그인 아이디라면
				if(list[i].nickname== "${sessionScope.loginId}"){
				replyDraw +="<td><a href='#' onclick='replyUpdateForm("+list[i].reply_idx+")'>수정</a></td>"
				replyDraw +="<td><a href='#' onclick='replyDel("+list[i].reply_idx+")'>삭제</a></td>"
				}
				if(list[i].nickname != "${sessionScope.loginId}"){
				//로그인아이디
				replyDraw +="<td><a href='#' onclick='replyReport("+list[i].reply_idx+")'>신고</a></td>"
				}
				replyDraw +="</tr>"
				replyDraw +="<tr>"
				replyDraw +="<td>"+list[i].reply_content+"</td>"
				replyDraw +="</tr>"
				if(list.length<5){
					$("#moreReply").remove();
				}
			}
			$("#replyList").empty();
			$("#replyList").append(replyDraw);
		}
		//댓글 삭제
		function replyDel (reply_idx){
			$.ajax({
				url:'./replyDel/'+reply_idx
				,type:'GET'
				,data:{}
				,dataType:'JSON'
				,success:function(data){
					if(data>0){
						$('#reply_content').val('');
						$("#replyUpdate").empty();
						replyList();
					}else{
						console.log("댓글블라인드 실패입니다")
					}
				}
				,error:function(error){
					console.log(error);
				}
			});
			
		}
		
		
		//댓글 등록
		function replyButton(){
			var replyContent ={}
			replyContent.reply_content = $('#reply_content').val();
			replyContent.bbs_idx = '${dto.bbs_idx}';
			//로그인아이디로 변경해야함
			replyContent.id = '${sessionScope.loginId}';
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
		//댓글 수정
		function replyUpdateForm(reply_idx){
			console.log(reply_idx)
			var replyContent ={}
			replyContent.reply_idx = reply_idx;
			$.ajax({
				type:'GET'
				,url:'replyUpdateForm'
				,data:replyContent
				,dataType:'JSON'
				,success:function(data){
						console.log(data.replyUpdate)
						replyUpdateFormDraw(data.replyUpdate);
				}
				,error:function(e){
					console.log(e);
				}
			})
				
		}
		//reply updateform 그리기
		function replyUpdateFormDraw(map){
			var replyDraw = "";
			replyDraw +="<tr>"
			replyDraw +="<td><b>"+map.nickname+"</b></td>"
			var date = new Date(map.reg_date);
			replyDraw +="<td>"+date.toLocaleDateString("ko-KR")+"</td>"
			replyDraw +="</tr>"
			replyDraw +="<tr>"
			replyDraw +="<td><input type='text' id='reply_update' value="+map.reply_content+"/></td>"
			replyDraw +="<td><button onclick='replyUpdateButton("+map.reply_idx+")'>수정</button></td>"
			replyDraw +="</tr>"
			$("#replyUpdate").empty();
			$("#replyUpdate").append(replyDraw);
		}
		
		//댓글 수정하기
		function replyUpdateButton(reply_idx){
			var replyContent ={}
			replyContent.reply_content = $('#reply_update').val();
			replyContent.reply_idx = reply_idx;
			//로그인아이디로 변경해야함
			replyContent.id = '${sessionScope.loginId}';
			console.log(replyContent.reply_content,replyContent.reply_idx,replyContent.id);

			$.ajax({
				type:'POST'
				,url:'replyUpdate'
				,data:replyContent
				,dataType:'JSON'
				,success:function(data){
						if(data){
							console.log(data)
							replyList();
							$('#reply_content').val('');
							$("#replyUpdate").empty();
						}else{
							console.log("댓글쓰기 실패입니다")
						}
				}
				,error:function(e){
					console.log(e);
				}
			})
		}
		//댓글 더보기
		function moreReply() {
			var replyContent ={}
			endNum = endNum +5;
			console.log(endNum)
			replyContent.bbs_idx = '${dto.bbs_idx}';
			replyContent.endNum = endNum;
			console.log(replyContent)
			$.ajax({
				type:'POST'
				,url:'replyList'
				,data:replyContent
				,dataType:'JSON'
				,success:function(data){
						if(data){
							console.log(data.replyList)
							console.log(data.replyList.length);
							var replyDraw = ""
							replyListDraw(data.replyList);
							if(data.replyList.length<endNum){
								$("#moreReply").remove();
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
	 	//게시판 신고하기 
		function BoardreportForm(){
			window.open('about:blank','boardreport','width=600, height=300');
			document.BoardReportForm.submit();
		} 
		
		//댓글 신고하기
		function replyReport(reply_idx){
			window.open('reply_report/'+reply_idx+'/com','replyReport','width=600, height=300');
			
		} 
		function sendMsg(msg){
			alert(msg);
		}
			
		
	</script>
</html>