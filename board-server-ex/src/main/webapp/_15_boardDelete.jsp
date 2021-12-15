<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String noString = request.getParameter("no");

	int no = Integer.parseInt(noString);
	System.out.println("delNumber: " + no);
	%>
	<h1>비밀번호 입력</h1>
	<form method="post" action="_16_boardDeletePro.jsp?no=<%=no%>">
		<span>pw:&#9;</span><input type="text" name="pw"><br> <br>
		<input type="submit" value="삭제">
	</form>
</body>
</html>