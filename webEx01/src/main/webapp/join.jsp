<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
	span {
		white-space: pre;
	}
</style>

<title>Insert title here</title>
</head>
<body>
	<h1>수강신청</h1>
	<h1>login</h1>
	<form method="post" action="loginPro.jsp">
		<span>id:&#9;</span><input type="text" name="id" required><br><br> 
		<span>pw:&#9;</span><input type="password" name="pw"required"><br><br> 
		<button name="button" value="submit" onclick="checkVal()">submit</button>
	</form>
</body>
</body>
</html>