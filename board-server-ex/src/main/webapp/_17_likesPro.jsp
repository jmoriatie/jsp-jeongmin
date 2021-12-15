<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDTO"%>
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
	System.out.println("likePostNum: "  + no);
	
	BoardDTO post = null;
	ArrayList<BoardDTO> board = BoardDAO.getInstance().getBoardList();
	for (BoardDTO p : board) {
		if (p.getNo() == no) {
			System.out.println("p: " + p.getNo());
			post = p;
			break;
		}
	}
	BoardDAO.getInstance().plusLike(post);
	
 	response.sendRedirect("_12_boardView.jsp?no="+no+"");
%>
</body>
</html>