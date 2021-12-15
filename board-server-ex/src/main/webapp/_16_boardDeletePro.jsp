<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@page import="user.UserDAO"%>
<%@page import="user.UserDTO"%>
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
	// 비교할 데이터
	String noString = request.getParameter("no");
	int no = Integer.parseInt(noString);
	System.out.println("delNumber: " + no);
	
	String id = (String)session.getAttribute("log");
	String pw = request.getParameter("pw");
	
	// 비교당할 데이터(DTO 객체)
	BoardDTO post = null;
	ArrayList<BoardDTO> board = BoardDAO.getInstance().getBoardList();
	for (BoardDTO p : board) {
		if (p.getNo() == no) {
			System.out.println("p: " + p.getNo());
			post = p;
			break;
		}
	}
	// id, pw 확인 => DAO 메서드 호출
	if(post.getId().equals(id) && post.getPw().equals(pw)){ 
		if(BoardDAO.getInstance().deleteBoard(no)){ // DAO 실행
			System.out.println("삭제 성공!!!");
			response.sendRedirect("_7_boardList.jsp");
		}
	}
	else{
		System.out.println("삭제 실패!!!");
		response.sendRedirect("_15_boardDelete.jsp?no="+no+"");
	}
%>
</body>
</html>