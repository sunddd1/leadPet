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
			table,td,th {
	            border: 2px solid;
	            border-collapse: collapse;
			}
	        td {
	        	font-size: 8pt;
	        	text-overflow: ellipsis;
	        	overflow: hidden;
	        	white-space: nowrap;
	        	width: 20px;
	        	height: 20px;
	        }
		</style>
	</head>
	<body>		
		<h3>캘린더 리스트</h3>
		<p id="today"></p>
	    <button onclick="preMon()">이전</button>
	    <button onclick="nextMon()">다음</button>
	    <table>
	    </table>
	    <div id="list">
 	    	<c:forEach items="#{vacc }" var="list">
	    	${list.name} / ${list.vacc_name}<br/>
	    	</c:forEach>
	    	<c:forEach items="${sche }" var="list">
	    	${list.subject}<br/>
	    	</c:forEach>
	    </div>
	</body>
	<script>
    $(document).ready(function () {
        cal();
    });
    var d = new Date();
    var nM = new Date();
    d.setFullYear("${year}")
    d.setMonth("${month}") 
    d.setDate("${date}")
	function cal() {
		$('table').html('');    
        var str = "<tr><th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th></tr>";
        var year = d.getFullYear();
        var month = d.getMonth() + 1;
        var date = d.getDate();
        var day = d.getDay();
        var maxday = 30;
        console.log(month+"//////");
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
                	
                    str += "<td id='"+dda+"' onclick='fa(" + dda + ")'><span style='color: red;'>" + (dda++) + "</span></td>";
                } else {
                    str += "<td id='"+dda+"' onclick='fa(" + dda + ")'>" + (dda++) + "</td>";
                }
            }
        }
        str += "</tr>";
        while (dda <= maxday) {
            str += "<tr>";
            for (let j = 0; j < 7; j++) {
                if (dda <= maxday) {
                    if (date == dda && nM.getMonth() + 1 == month && nM.getFullYear() == year) {
                        str += "<td id='"+dda+"' onclick='fa(" + dda + ")'><span style='color: red;'>" + (dda++) + "</span></td>";
                    } else {
                        str += "<td id='"+dda+"' onclick='fa(" + dda + ")'>" + (dda++) + "</td>";
                    }
                } else {
                    str += "<td></td>";
                }

            }
            str += "</tr>";
        }

        console.log(year+"년/"+month + "월/" + date + "일/" + day);
       $('table').append(str);
       
/*        $.ajax({
   		type:'get'
   		,url:'calendarList'
   		,data:{
   			"date":year+"/"+month+"/"+date
   		}
   		,dataType:'json'
   		,success : function(data) {
			}
   		,error : function(e) {
				console.log(e);
				console.log('에러라니11');
			} 
   		
   		}); */
       
       /*  $.ajax({
    		type:'get'
    		,url:'scheduler'
    		,data:{
    			"year":d.getFullYear()
    			,"smonth":d.getMonth()+1
    		}
    		,dataType:'json'
    		,success : function(data) {
				console.log(data.vacc);
				console.log(data.sche);
				console.log(data.vaccinList);
				
				for (var i = 0; i < data.vacc.length; i++) {
					var d_day = data.vacc[i].d_day;
					var dyear = d_day.substring(0,4);
					var dmont = d_day.substring(5,7);
					var ddate = d_day.substring(8,10);
					console.log("스게 //"+dyear+"/"+dmont+"/"+ddate);
			    	console.log("스게 //"+d.getMonth()+1 +"///"+dmont +"///"+ nM.getFullYear() +"///"+ dyear+"//"+Number(ddate));
					if(d.getFullYear() == dyear && dmont==d.getMonth()+1 ){	
						var link= data.vacc[i].vacc_sche_idx+",1";
						$('#list').append('<div class="schedule" onclick="detail('+link+')">'+data.vacc[i].name+"/"+data.vacc[i].vacc_name+'</div>');
					}
				}
				for (var i = 0; i < data.sche.length; i++) {
					console.log(data.sche[i].content);
					var d_day = data.sche[i].d_day;
					var dyear = d_day.substring(0,4);
					var dmont = d_day.substring(5,7);
					var ddate = d_day.substring(8,10);
					console.log(dyear+"/"+dmont+"/"+ddate);
			    	console.log(d.getMonth()+1 +"///"+dmont +"///"+ nM.getFullYear() +"///"+ dyear+"//"+Number(ddate));
					if(d.getFullYear() == dyear && dmont==d.getMonth()+1 ){		
						var link =data.sche[i].sche_idx+",2";
						$('#list').append('<div class="schedule" onclick="detail('+link+')">'+data.sche[i].subject+'</div>');
					}
				}
			}
    		,error : function(e) {
				console.log(e);
				console.log('에러라니');
			} 
    		
    	}); */
        
	}
	function fa(e) {
		 d.setDate(e);
		console.log((d.getMonth()+1) +"+++"+e+"+++"+d.getDate());
		
		var link = d.getFullYear()+"/"+(d.getMonth() +1)+"/"+e;
		
		console.log(link);
       window.open("./calendarList?date="+link,"_self");
		//window.open("./calendarListForm","","width=400,height=400,left=300,top=300");
	}
    function nextMon() {
        $('#list').html('');
    	d.setMonth(d.getMonth() + 1);
        cal();
        
    }
    function preMon() {
        $('#list').html('');
        d.setMonth(d.getMonth() - 1);
        cal();
    }
/* 	function detail(a,b) {
		console.log(a,b);
        window.open("./calendardetail?idx="+a+"&type="+b,"","width=600,height=300,left=700,top=300");
	} */
	</script>
</html>