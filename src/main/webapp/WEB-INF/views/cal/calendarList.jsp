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
	        div{
	        	font-size: 8pt;
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
	    		<div onclick='window.open("./vaccinDetail?idx=${list.vacc_sche_idx}","","width=600,height=400,left=800,top=300")'>${list.name} / ${list.vacc_name}</div>
	    	</c:forEach>
	    	<c:forEach items="${sche }" var="list">
	    		<div onclick='window.open("./calendardetail?idx=${list.sche_idx}","","width=600,height=400,left=800,top=300")'>${list.subject}</div>
	    	</c:forEach>
	    </div>
	</body>
	<script>
    $(document).ready(function () {
        cal();
    });
    var d = new Date();
    var nM = new Date();
    d.setFullYear("${year}");
    d.setMonth("${month}"-1);
    console.log("---------------"+d.getMonth());
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

        
	}
	function fa(e) {
		 d.setDate(e);
		console.log((d.getMonth()+1) +"+++"+e+"+++"+d.getDate());
		
		var link = d.getFullYear()+"/"+(d.getMonth() +1)+"/"+e;
		
		console.log(link);
       window.open("./calendarList?date="+link,"_self");
	}
    function nextMon() {
        $('#list').html('');
    	d.setMonth(d.getMonth() + 1);
    	console.log("무슨달이야 ? "+ d.getMonth());
        cal();
        
    }
    function preMon() {
        $('#list').html('');
        d.setMonth(d.getMonth() - 1);
        cal();
    }

    function setData(data) {
    	
    	opener.setData(data);
    }
    
    
	</script>
</html>