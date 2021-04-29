<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style></style>
</head>
<body>
	<form action="upload" method="post" enctype="multipart/form-data">
		<input type="file" name="file" onchange="fileView(this)"/>
	</form>
</body>
<script>

	var path = "${path}";
	console.log(path);
	if(path!=""){
		var elem = opener.document.getElementById("editable");
		var content="";		
		content+="<a href='#' id='${path}' onclick='del(this)'><br/>";
		content+="<img src='${path}' width='250'/><b>X</b></a>";
		elem.innerHTML += content;
		self.close();
	}

	function fileView(elem){
		console.log(elem);
		$('form').submit();
	}
</script>
</html>