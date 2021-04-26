<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <title> 날짜 입력 </title>
    <meta charset='utf-8'>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <style>
        table,td,th {
            border: 2px solid;
            border-collapse: collapse;
        }

        td {
            width: 50px;
            height: 50px;
        }
    </style>
</head>

<body>
    <p id="today"></p>
    <button onclick="preMon()">이전</button>
    <button onclick="nextMon()">다음</button>
    <table>
    </table>
</body>
<script>
    var d = new Date();
    $(document).ready(function () {
        cal();
    });

    function cal() {
        var nM = new Date();
        $('table').html('');      
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
                    str += "<td onclick='fa(" + dda + ")'><span style='color: red;'>" + (dda++) + "</span></td>";
                } else {
                    str += "<td onclick='fa(" + dda + ")'>" + (dda++) + "</td>";
                }
            }
        }
        str += "</tr>";
        while (dda <= maxday) {
            str += "<tr>";
            for (let j = 0; j < 7; j++) {
                if (dda <= maxday) {
                    if (date == dda && nM.getMonth() + 1 == month && nM.getFullYear() == year) {
                        str += "<td onclick='fa(" + dda + ")'><span style='color: red;'>" + (dda++) + "</span></td>";
                    } else {
                        str += "<td onclick='fa(" + dda + ")'>" + (dda++) + "</td>";
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


    function nextMon() {
        d.setMonth(d.getMonth() + 1);
        cal();
    }
    function preMon() {
        d.setMonth(d.getMonth() - 1);
        cal();
    }

   function fa(e){
        console.log(e);
        window.open("./testshow.html","","width=100,height=100,left=100,top=50%");
   }
</script>

</html>