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
	BoardDAO dao = BoardDAO.getInstance();

	String id = (String)session.getAttribute("log"); 
	// ㄴ getAttribute()  =>  Object 형식으로 넘어오는 듯 (캐스팅 필요)
	String title = request.getParameter("title");
	String content = request.getParameter("content");

	System.out.println("title: " + title);
	System.out.println("content: " + content);
	
	if(!title.equals("") && !content.equals("")){
		if (dao.boardWrite(id, title, content)) {
			// 성공시
			response.sendRedirect("_7_boardList.jsp");
		} else {
			response.sendRedirect("_10_boardWrite.jsp");
		}
	}
	else{
		System.out.println("제목 또는 내용이 입력되지 않았습니다");
		response.sendRedirect("_10_boardWrite.jsp");
	}
	%>

</body>
</html>