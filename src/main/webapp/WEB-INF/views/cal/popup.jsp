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
				border: 3px solid coral;
				position: absolute;
				background-color: white;
				box-sizing:content-box;
				height: content-box;
				
			}
			.pop div{				
				font-size: 10pt;
				padding: 10%;
			}
		</style>
	</head>
	<body>
	</body>
	<script>
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
					console.log(data.list.vacc_name);
					if(data!=null){
						var list = data.list;
						for (var i = 0; i < list.length; i++) {
							var addPop ="";
							addPop+= "<div class='pop' id='pop"+i+"' style='left: "+i+1*5+"%; top: "+i+1*5+"%; z-index: 5"+i+";'>";
							addPop+= "<div>";
							addPop+= list[i].name+"(이)의 " +list[i].vacc_name +" 접종 예방이 "+"<br/>" +list[i].d_day.substring(0,10)+"에 있습니다.";
							addPop+="</div>";
							addPop+="<button value="+i+">닫기</button>";
							addPop+="</div>";
							$('body').append(addPop);
							
							
						 	$('button').click(function() {
								console.log("닫기 : "+$(this).val());
								$('#pop'+$(this).val()).remove();
							});
						 	
		
						}
					}
				}
				,error : function(e){
					console.log(e);
				}
				
			});		  
		});
		function closePop(i) {
			console.log("닫기 : "+i);
		}
	  
	  $('button').click(function() {
			console.log("닫기 : ");
		});
	</script>
</html>