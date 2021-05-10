<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <title> 날짜 입력 </title>
    <meta charset='utf-8'>
    <style>
        #cal ,#cal td {
            border: 2px solid;
            border-collapse: collapse;
        }
        #cal td {
        	table-layout:fixed;
        	font-size: 8pt;
        	text-overflow: ellipsis;
        	overflow: hidden;
        	white-space: nowrap;
        	width: 100px;
        	height: 100px;
        	max-height: 100px;
        	max-width: 100px;
        	min-width: 100px;
        	text-align: justify;
        vertical-align: top;
        }
        
        #list{
			border: 1px solid black;
        	width: 200px;
        	height: 700px;
        	font-size: 8pt;
        	box-shadow: 5px 5px red;
        	padding: 10px;
        }
        .schedule{
        	font-size: 10pt;
        }
        #calendar{
        	background-color: lightcoral;
        }
        #calend{
        	width: 60%;
			margin: 25px;
			margin-left : 20%;
			padding: 50px;     
        }
		#left{
			float: left;
		}
		#left button{
			margin-bottom: 10px;
		}
		.Vaccschedule{
			color:blue;
		}
    </style>
</head>
<body>	
	<jsp:include page="../main/top_Navi.jsp"/>
				<jsp:include page="../main/side_myNavi.jsp"/>
	
<!-- 	<table style="height: 100%;">
		<tr>
			<th> -->
				<table id="calend">
					<tr>
						<th>
							<div id="left">
							    <button onclick="preMon()">이전</button> &nbsp;&nbsp;&nbsp;
							    <span id="today"></span>&nbsp;&nbsp;&nbsp;
							    <button onclick="nextMon()">다음</button>
						    <table id="cal">
						    </table>
							</div>							
						</th>
						<th>
							<div id="list">
								
							</div>
						</th>
					</tr>
				</table>
<!-- 			</th>
		</tr>
	</table>
 -->
    
</body>
<script>
	
    var d = new Date();
    var nM = new Date();
    $(document).ready(function () {
        cal();
    });
    


    function cal() {
        $('#cal').html('');    
        $('#list').html('');
        var str = "<tr><th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th></tr>";
        var year = d.getFullYear();
        var month = d.getMonth() + 1;
        var date = d.getDate();
        var day = d.getDay();
        var maxday = 30;
        $('#today').html(year+"년 "+month+"월");
        if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12) {
            maxday = 31;
        } else if (month == 2) {
            maxday = 28;
            if ((d.getFullYear() % 4) == 0) {
                maxday = 29;
            }
        }
        var fDay = day - (date % 7 - 1);
        if (fDay < 0) {
            fDay = 7 + fDay;
        }
        var dda = 1;
        str += "<tr>";
        for (let i = 0; i < 7; i++) {
            if (i < fDay) {
                str += "<td></td>";
            } else {
                if (date == dda && nM.getMonth() + 1 == month && nM.getFullYear() == year) {
                	
                    str += "<td class='con' id='"+dda+"' onclick='fa(" + dda + ")'><span style='color: red;'>" + (dda++) + "</span></td>";
                } else {
                    str += "<td class='con' id='"+dda+"' onclick='fa(" + dda + ")'>" + (dda++) + "</td>";
                }
            }
        }
        str += "</tr>";
        while (dda <= maxday) {
            str += "<tr>";
            for (let j = 0; j < 7; j++) {
                if (dda <= maxday) {
                    if (date == dda && nM.getMonth() + 1 == month && nM.getFullYear() == year) {
                        str += "<td style='color: red;border-color: black;' class='con' id='"+dda+"' onclick='fa(" + dda + ")'>" + (dda++) + "</td>";
                    } else {
                        str += "<td class='con' id='"+dda+"' onclick='fa(" + dda + ")'>" + (dda++) + "</td>";
                    }
                } else {
                    str += "<td></td>";
                }

            }
            str += "</tr>";
        }

        console.log(year+"년/"+month + "월/" + date + "일/" + day);
        $('#cal').append(str);
       
		console.log("아작스 요청 : "+d.getFullYear()+"//"+(d.getMonth()+1));
    	$.ajax({
    		type:'get'
    		,url:'scheduler'
    		,data:{
    			"year":d.getFullYear()
    			,"smonth":d.getMonth()+1
    		}
    		,dataType:'json'
    		,success : function(data) {
    			
    			for (var i = 0; i < data.vaccinList.length; i++) {					
    				console.log(data.vaccinList[i]);
    				$('#list').append('<h2 style="color:red;">필수 예방접종 리스트</h2>');
    				$('#list').append("<span onclick='vaccDetail("+data.vaccinList[i].vac_idx+")'>"+data.vaccinList[i].pet_name+"/"+data.vaccinList[i].vacc_name+"</span><br/>");
				}


    			
				var overCnt=0;

				for (var i = 0; i < data.vacc.length; i++) {//일정을 달력에 넣어줌.
					var d_day = data.vacc[i].d_day;
					var dyear = d_day.substring(0,4);
					var dmont = d_day.substring(5,7);
					var ddate = d_day.substring(8,10);
					//console.log("스게 //"+dyear+"/"+dmont+"/"+ddate);
			    	//console.log("스게 //"+d.getMonth()+1 +"///"+dmont +"///"+ nM.getFullYear() +"///"+ dyear+"//"+Number(ddate));
					if(d.getFullYear() == dyear && dmont==d.getMonth()+1 && (overCnt)<55){	
						$('#'+Number(ddate)).append('<div class="Vaccschedule">'+data.vacc[i].pet_name+"/"+data.vacc[i].vacc_name+'</div>');
					}	
					

				}
				
					for (var j = 0; j < data.sche.length; j++) {//일정을 달력에 넣어줌.
						var d_day = data.sche[j].d_day;
						var dyear = d_day.substring(0,4);
						var dmont = d_day.substring(5,7);
						var ddate = d_day.substring(8,10);
						//console.log(dyear+"/"+dmont+"/"+ddate);
				    	//console.log(d.getMonth()+1 +"///"+dmont +"///"+ nM.getFullYear() +"///"+ dyear+"//"+Number(ddate));
						if(d.getFullYear() == dyear && dmont==d.getMonth()+1 && (overCnt)<55){		
							$('#'+Number(ddate)).append('<div class="schedule">'+data.sche[j].subject+'</div>');
						}
						

					}
	    			for (var i = 1; i < dda; i++) {
						console.log(i+"번 째 "+$('#'+i).find('div').length);
						if($('#'+i).find('div').length>6){
							for (var a = 3; a < $('#'+i).find('div').length; a++) {
								console.log("지운다 : "+i +"/"+ a);
								console.log($('#'+i).find('div').eq(a).html(''));
							}
							$('#'+i).append("<div style='float:right;'>더보기...</div>");
						}
					}
				
			}
    		,error : function(e) {
				console.log(e);
				console.log('에러라니');
			}
    		
    	});

    }


    function nextMon() {
        d.setMonth(d.getMonth() + 1);
        cal();
    }
    function preMon() {
        d.setMonth(d.getMonth() - 1);
        cal();
    }

   function fa(e){
       console.log(d.getFullYear()+"/"+(d.getMonth() +1)+"/"+(e));
       var link =d.getFullYear()+"/"+(d.getMonth() +1)+"/"+(e)
        window.open("./calendarList?date="+link,"","width=400,height=500,left=300,top=300");   
   }
   
   function vaccDetail(a) {
		console.log(a);
		//href='./vaccinDetail?idx=  vacc_sche_idx=${list.vacc_sche_idx}&vac_idx=
		window.open("./vaccinDetail?vacc_sche_idx=0&vac_idx="+a,"","width=600,height=200,left=800,top=300");   
	}
   
   function setData(data) {
		console.log("----------"+data);
		console.log(data.substring(0,4));
		console.log(data.substring(5,7)-1);
		d.setFullYear(data.substring(0,4));
		d.setMonth(data.substring(5,7)-1);
		cal();
	}
   
</script>

</html>