<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
		요청값이 넘어가는 페이지, 
		process라 해서 pro를 붙여주는 관행
	 -->
	 loginPro 페이지 입니다
	 
	<%
	
	/* 
	
	[GET 방식]
	 http://localhost:8081/webEx01/loginPro.jsp?id=aa&pw=bb
	 ㄴ URI 쿼리 구간에 ?s파라미터1=값1 & 파라미터2=벨류2...(요청과 함께 전달된 값이 받아짐))
	
	[POST 방] : 전달되어지는 파라미터 값을 숨겨서 전달
	http://localhost:8081/webEx01/loginPro.jsp
	
	*/	
	request.setCharacterEncoding("UTF-8");
	
	// jsp의 내장객체 중, request
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	
	
	
	%>
	<h1>id:<%= id %></h1>
	<h1>pw:<%= pw %></h1>
	
</body>
</html>