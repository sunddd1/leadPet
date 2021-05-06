<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset='utf-8'>
    <style>
        #cal ,#cal td {
        	margin: 5px;
            border: 2px solid;
            border-collapse: collapse;
        }
        #cal td {
        	table-layout:fixed;
        	font-size: 8pt;
        	text-overflow: ellipsis;
        	overflow: hidden;
        	white-space: nowrap;
        	width: 60px;
        	height: 60px;
        	max-height: 60px;
        	max-width: 60px;
        	text-align: justify;
        }
        .schedule{
        	font-size: 6pt;
        }
		#mainCal{
			float: right;
			margin: 50px;
		}
    </style>
</head>
<body>
	<table id="mainCal">
		<tr>
			<th>
	<p id="today"></p>
			</th>
		</tr>
		<tr>
			<th>
				<table id="cal">
				</table>
			</th>
		</tr>
	</table>
</body>
<script>
	
    var d = new Date();
    var nM = new Date();
    $(document).ready(function () {
        cal();
    });
    
    var session = "${sessionScope.loginId}";
	console.log("세션 확인 "+session);

    function cal() {
        $('#cal').html('');    
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
		
		
		console.log("로그인 확인 "+session);
		if(session!=''){
	    	$.ajax({
	    		type:'get'
	    		,url:'scheduler'
	    		,data:{
	    			"year":d.getFullYear()
	    			,"smonth":d.getMonth()+1
	    		}
	    		,dataType:'json'
	    		,success : function(data) {
	    			
					var overCnt=0;
	
					for (var i = 0; i < data.vacc.length; i++) {//일정을 달력에 넣어줌.
						var d_day = data.vacc[i].d_day;
						var dyear = d_day.substring(0,4);
						var dmont = d_day.substring(5,7);
						var ddate = d_day.substring(8,10);
						//console.log("스게 //"+dyear+"/"+dmont+"/"+ddate);
				    	//console.log("스게 //"+d.getMonth()+1 +"///"+dmont +"///"+ nM.getFullYear() +"///"+ dyear+"//"+Number(ddate));
						if(d.getFullYear() == dyear && dmont==d.getMonth()+1 && (overCnt)<55){	
							$('#'+Number(ddate)).append('<div class="schedule">'+data.vacc[i].pet_name+"/"+data.vacc[i].vacc_name+'</div>');
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
		

    }



   function fa(e){
	   location.href="./calendar";
   }
   
</script>

</html>