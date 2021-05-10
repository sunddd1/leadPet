<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>작성글</title>
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<style>
			.table{	
				padding-left : 20%;
				width : 90%;
			}
			
			#wirte{
			background-color: lightcoral;
			color: white;
			font-weight: bold;
			}
			
			h3{
				padding-top : 4%;	
				padding-left : 20%;
				
			}
			
			#tr > td {
				padding-top : 10px;
				text-align : center;
			}
			tbody{
			}
			#tr1 {
			  border-right: 1px solid;
			  border-left: 1px solid;
			  background: lightcoral;
			  padding: 10px;
			  font-weight: bold;
			  vertical-align: top;
			  color: #fff;
			}
			
			#del{
				color : #337AB7;
			}
		</style>
	</head>
	<body>
	<jsp:include page="../main/top_Navi.jsp"/>
	<jsp:include page="../main/side_myNavi.jsp"/>
	
		
		<h3>작성글</h3>
		 <table class="table">
		 	<thead>
                <tr id="tr1">
                    <th>번호</th>
                    <th>제목</th>
                    <th>게시판</th>
                    <th>추천수</th>
                    <th>조회수</th>
                    <th>작성일</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="write" items="${write}">
                	<tr id="tr">
                		<td>${write.bbs_idx}</td>
                		<td><a id="detail" href="./BoardDetail?bbs_idx=${write.bbs_idx}">${write.bbs_subject}</a></td>
                		<td>${write.category_name}</td>
                		<td> ${write.reco_count}</td>
                		<td>${write.views}</td>
                		<td>${write.reg_date}</td>
                		<c:forEach var="nickname" items="${nickNameId}">
                		<c:if test="${nickname == sessionScope.loginId}">
                		<td><a href="./BoardDel?bbs_idx=${write.bbs_idx}" id="del">삭제</a></td>
                		</c:if>
                		</c:forEach>
                	</tr>
                </c:forEach>
             </tbody>
           </table>
	
	</body>
	<script>
		
	</script>
</html>
