<%@page import="board.BoardDAO"%>
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
	System.out.println("postNumber: " + no);
	
	BoardDAO.getInstance().plusLike(no);
%>
</body>
</html>