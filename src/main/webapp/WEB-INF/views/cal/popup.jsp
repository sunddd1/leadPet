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
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
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
					console.log(data);
					if(data.list !=null){
						var list = data.list;
						for (var i = 0; i < list.length; i++) {
							
							if(cookiedata.indexOf('pop'+i)< 0){
								
								var toDay = new Date();
								var comDay = new Date(list[i].d_day.substring(0,10));
								toDay =moment(toDay).format('YYYY MM DD');
								comDay =moment(comDay).format('YYYY MM DD');
								console.log(toDay + "////" + comDay);
								var  vacc_sche_idx = list[i].vacc_sche_idx;
								var addPop ="";
								var size = (i+1)*100;
								addPop+= "<div class='pop' id='pop"+i+"' style='left: "+size+"px; top: "+size+"px; z-index: 5"+i+";'>";
								addPop+= "<div>";
								if(toDay==comDay){
									addPop+= list[i].pet_name+"(이)의 <br/>" +list[i].vacc_name +" 접종 예방이 "+"<br/><b style='color:red;'> 오늘 </b> 있습니다.";
								}else{
									addPop+= list[i].pet_name+"(이)의 <br/>" +list[i].vacc_name +" 접종 예방이 "+"<br/><b style='color:red;'>" +list[i].d_day.substring(0,10)+"</b>에 있습니다.";
								}
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
						 		console.log(vacc_sche_idx);
						 		TodayPopup($(this).next().val(),vacc_sche_idx);
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

		function TodayPopup(i,vacc_sche_idx) {
			setCookie("pop"+i+vacc_sche_idx, "done", 72);
			$('#pop'+i).remove();
		}

		

	</script>
</html>