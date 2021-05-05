<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<style></style>
	</head>
	<body>
		<form action="uploadPet" method="post" enctype="multipart/form-data">
			<input type="file" name="file" onchange="fileView(this)">
		</form>
	</body>
	<script>
		var path = "${path}";
		if(path!=''){
			console.log(path);
			 
	         self.close();
		}
		function fileView(elem){
			console.log(elem);
			$('form').submit();
		}
	</script>
</html>