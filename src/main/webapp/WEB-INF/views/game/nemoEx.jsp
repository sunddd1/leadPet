<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv='X-UA-Compatible' content='IE=edge'>
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js">
            // j쿼리 라이브러리 불러오기// 1 링크 , 2 다운로드해서 쓰기
        </script>
		<style>
			td{
                background-color: lightcoral;
                width: 100px;
                height: 100px;
                color: chartreuse;
                text-align: right;
            }
            th{      
                background-color: burlywood;
                width: 100px;
                height: 100px;
                font-size: 20pt;
            }
            table{
                margin: 20px;
                display: flex;
                justify-content: space-evenly;
                
            }
            #정답{
                display: flex;
                justify-content: space-evenly;
            }
            .btn{
                margin-top: 50px;
                box-sizing: border-box;
                width: 100px;
                height: 60px;
                white-space: nowrap;
                border: 3px solid gray;
                padding: 0 10px 0 10px;
                font-size: 17pt;
                font-weight: 800;
                float: right;
            }
            #bgc{
                width: 700px;
                height: 800px;
                }
		</style>
	</head>
	<body>
		<div id="bgc">
            <div id="정답">
                <button class="btn">정답!</button>
                <p>남은 힌트 : 1</p>
                <button class="btn">힌트!</button>
            </div>
        <table>
            <tr>
                <th></th>
                <th class="done">2</th>
                <th class="done">1<br>1</th>
                <th class="done">1<br>1</th>
                <th class="done">1<br>1</th>
                <th class="done">2</th>
            </tr>
            <tr>
                <th>1 1</th>
                <td class="false"></td>
                <td class="false"></td>
                <td class="false"></td>
                <td class="false"></td>
                <td class="false"></td>
            </tr>
            <tr>
                <th>1 1 1</th>
                <td class="false"></td>
                <td class="false"></td>
                <td class="false"></td>
                <td class="false"></td>
                <td class="false"></td>
            </tr>
            <tr>
                <th>1 1</th>
                <td class="false"></td>
                <td class="false"></td>
                <td class="false"></td>
                <td class="false"></td>
                <td class="false"></td>
            </tr>
            <tr>
                <th>1 1</th>
                <td class="false"></td>
                <td class="false"></td>
                <td class="false"></td>
                <td class="false"></td>
                <td class="false"></td>
            </tr>
            <tr>
                <th>1</th>
                <td class="false"></td>
                <td class="false"></td>
                <td class="false"></td>
                <td class="false"></td>
                <td class="false"></td>
            </tr>
        </table>
        </div>
	</body>
	<script>
		var click=0;
	    var num=0;
	    $('td').click(function(){
	        var a= $(this).attr('class');
	        if(a=='false'){
	            click++;
	            $(this).css('background-color','black');
	            $(this).attr('class','true');
	            // $(this).html(click);
	        }else{
	            click--;
	            $(this).css('background-color','lightcoral');
	            $(this).attr('class','false');
	            // $(this).html(click);
	        }
	    });
	    var i = 1;
	    $('button').last().click(function(){
	        if(i>0){
	            i--;
	            alert('사랑해')
	            $('p').html('남은 힌트 : '+i)
	        }else{
	            alert('남은 힌트가 없습니다.')
	        }
	    });
	    
	    $('button').first().click(chk);
	    function chk(){
	        var td = $('td');
	        console.log(td);   
	        // 정답
	        var arr=[td.eq(1).attr('class'),td.eq(3).attr('class'),
	        td.eq(5).attr('class'),td.eq(7).attr('class'),td.eq(9).attr('class')
	        ,td.eq(10).attr('class'),td.eq(14).attr('class'),td.eq(16).attr('class'),td.eq(18).attr('class'),td.eq(22).attr('class')];
	        for (let i = 0; i < arr.length; i++) {
	            if(arr[i]=='true'){
	                num++;
	            }                
	        }
	        if(click==num && click!='0'){    
	            alert('클리어');
	        }else{
	            alert('오답');
	        }
	    }
	</script>
</html>	