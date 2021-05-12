<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<style>
			#draw ,#draw td,#draw th {
				margin: 5px;
	            border: 1px solid;
	            border-collapse: collapse;
			}
	        #draw td {
	        	font-size: 8pt;
	        	text-overflow: ellipsis;
	        	overflow: hidden;
	        	white-space: nowrap;
	        	width: 20px;
	        	height: 20px;
	        }
	        #list {
	        	width: 80%;
	        	font-size: 8pt;
	        }
	        #list td{
	    	    width: 80%;
	        	max-width: 80%;
	        	text-overflow: ellipsis;
	        	overflow: hidden;
	        	white-space: nowrap;
	        }
	        #btn{
	        	margin-left: 30px;
	        }
		</style>
	</head>
	<body>		
		<h3>캘린더 리스트</h3>
		<p id="today"></p>
	    <button onclick="preMon()">이전</button>
	    <button onclick="nextMon()">다음</button>
	    <button id="btn" onclick="reg()">등록</button>
	    <table id="draw">
	    </table>
	    <table id="list">	    	
 	    	<c:forEach items="${vacc }" var="list">
 	    		<tr>
 	    			<td>
			    		<span onclick='window.open("./vaccinDetail?vacc_sche_idx=${list.vacc_sche_idx}&vac_idx=${list.vac_idx}","","width=600,height=400,left=800,top=300")'>${list.pet_name} / ${list.vacc_name}</span>
 	    			</td>
 	    			<th>
			    		<a onclick="del(1,${list.vacc_sche_idx},${list.vac_idx})" >삭제</a>
 	    			</th>
	    		</tr>
	    	</c:forEach>
	    	<c:forEach items="${sche }" var="list">
 	    		<tr>
 	    			<td>
			    		<span onclick='window.open("./calendardetail?idx=${list.sche_idx}","","width=600,height=400,left=800,top=300")'>${list.subject}</span>
			 		</td>
 	    			<th>
			    		<a  onclick="del(2,${list.sche_idx},0)">삭제</a>
 	    			</th>
	    		</tr>
	    	</c:forEach>
	    </table>
	    <button id="prePage" style="visibility: hidden;">이전 페이지</button>
	    <button id="nextPage" style="visibility: hidden;">다음 페이지</button>
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
		$('#draw').html('');    
        var str = "<tr><th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th></tr>";
        var year = d.getFullYear();
        var month = d.getMonth() + 1;
        var date = d.getDate();
        var day = d.getDay();
        var maxday = 30;
        console.log(month+"//////");
        
        console.log($('#today').html());
        $('#today').html(year+"년 "+month+"월"+"${day}"+"일");

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

        console.log(year+"년/"+month + "월/" + date + "일/" );
        $('#draw').append(str);
		
       if($('#list tr').length>5){
    	   $('#nextPage').css("visibility","visible");
       }
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
    	console.log(data);
		d.setFullYear(data.substring(0,4));
		d.setMonth(data.substring(5,7)-1);
		console.log(data.substring(8,10));
		d.setDate(data.substring(8,10));
		fa(data.substring(8,10));
    	opener.setData(data);
    }
	
    
    var list=[];
	var start = 0;
	var end = 5;
	
		for (var i =0 ; i <$('#list tr').length ;i++) {
	   		//$('#list tr').eq(i).css("visibility","hidden");
	   		list[i] = $('#list tr').eq(i).html();
	 	}    		
		for (var i = $('#list tr').length; i >5 ; i--) {
	   		$('#list tr').eq(i).remove();			
		}
		console.log(list);

	 	if(list.length<5){
	 		$('#nextPage').css("visibility","hidden");
	 	}
	$('#nextPage').click(function() {
		$('#prePage').css("visibility","visible");
		if(end<list.length){
			$('#list').empty();			
			start += 5;
			end += 5;
			for (var i = start; i < end; i++) {
				var cont="<tr>"+list[i]+"</tr>"
				$('#list').append(cont);
			}					
		}
		if(end>list.length){
	 		$('#nextPage').css("visibility","hidden");
		}
		console.log(start+"/"+end);
	});
	$('#prePage').click(function() {

 		$('#nextPage').css("visibility","visible");
		if(start>4){
			$('#list').empty();		
			start -= 5;
			end -= 5;
			for (var i = start; i < end; i++) {
				var cont="<tr>"+list[i]+"</tr>"
				$('#list').append(cont);		
			}			
		}
		if(start<5){
	 		$('#prePage').css("visibility","hidden");			
		}
		console.log(start+"/"+end);
	});
    //visible
    function reg() {//location.href='./regScheForm'
    	window.open("./regScheForm","","width=600,height=400,left=800,top=300");
	}
    function del(a,b,c) {
		console.log(a+"/"+b+"/"+c);
		

		$.ajax({
			type:'get'
			,url:'deleteSche'
			,data:{
				"idx":b
				,"type":a
				,"pet":c
			}
			,dataType:'json'
			,success : function(data) {
				console.log(data);
				if(data.suc>0){
					console.log("${sche[0].d_day }");
					var thisDay="${sche[0].d_day }";
					if(thisDay==""){
						thisDay="${vacc[0].d_day}";
					}
					thisDay=thisDay.substring(0,thisDay.lastIndexOf("00:00:00")-1)
					console.log("-------------"+thisDay);
					location.reload();
					opener.setData(thisDay);
								
				}
				if(data.suc==0){
					alert("완료한 일정 삭제하거나 수정 할 수 없습니다.");
				}
			}
			,error : function(e){
				console.log(e);
			}
			
		});
	}
    
	</script>
</html>