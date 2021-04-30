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
			.pop{
				border: 5px solid coral;
				position: absolute;
				background-color: white;
				box-sizing:content-box;
				font-size: 9pt;
				white-space: nowrap;
				padding: 0px 15px;
			}
			.pop div{				
				padding: 2%;
			}
			.pop button{
				margin-left: 10px;
			}
		</style>
	</head>
	<body>	
	</body>
	<script>
	var cookiedata = document.cookie;
	console.log("쿠키 쿠키"+cookiedata);
	$(document).ready(function () {
			var to = new Date();
			var todate = to.getFullYear()+"/"+ Number(to.getMonth() + 1)+"/"+ to.getDate();
			to.setDate(to.getDate()+3);
			var ladate =to.getFullYear()+"/"+ Number(to.getMonth() + 1)+"/"+ to.getDate();
			console.log(todate +"==="+ladate);
			$.ajax({
				type:'POST'
				,url:'popup'
				,data:{
					"todate" : todate
					,"ladate" : ladate
				}
				,dataType:'json'
				,success : function(data) {
					console.log(data.list);
					if(data!=null){
						var list = data.list;
						for (var i = 0; i < list.length; i++) {
							
							if(cookiedata.indexOf('pop'+i)< 0){
								var addPop ="";
								addPop+= "<div class='pop' id='pop"+i+"' style='left: "+i+1*300+"px; top: "+i+1*200+"px; z-index: 5"+i+";'>";
								addPop+= "<div>";
								addPop+= list[i].name+"(이)의 <br/>" +list[i].vacc_name +" 접종 예방이 "+"<br/><b style='color:red;'>" +list[i].d_day.substring(0,10)+"</b>에 있습니다.";
								addPop+="</div>";
								addPop+="<a href='#' >3일 동안 보지 않기 X</a>"
								addPop+="<button value="+i+"> 닫기 </button>";
								addPop+="</div>";
								$('body').append(addPop);	
							}
							
						 	$('button').click(function() {
								console.log("닫기 : "+$(this).val());
								$('#pop'+$(this).val()).remove();
							});
						 	$('a').click(function() {
						 		console.log($(this).next().val());
						 		TodayPopup($(this).next().val());
							});
		
						}
					}
				}
				,error : function(e){
					console.log(e);
				}
				
			});		  
		});
	  
		function setCookie(name, value, expirehours) {
			var todayDate = new Date();
			todayDate.setHours(todayDate.getHours() + expirehours);
			document.cookie = name + "=" + escape(value) + "; path=/; expires="
					+ todayDate.toGMTString() + ";"
		}

		function TodayPopup(i) {
			setCookie("pop"+i, "done", 72);
			$('#pop'+i).remove();
		}

		

	</script>
</html>