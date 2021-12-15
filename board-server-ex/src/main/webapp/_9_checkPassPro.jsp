<%@page import="board.BoardDAO"%>
<%@page import="user.UserDAO"%>
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
	// 권한이 필요한 수정/탈퇴 처리 담당
	System.out.println("dir: " + request.getParameter("dir") + "");
	String dirString = request.getParameter("dir");
	int dir = Integer.parseInt(dirString);
			
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	UserDAO dao = UserDAO.getInstance();
	if(dir == 1){ // 로그아웃
		session.removeAttribute("log");
		response.sendRedirect("_1_index.jsp"); 
		System.out.println("로그아웃");
	}
	else if(dir == 2){
		// 수정 페이지
	}
	else if(dir == 3){ // 삭제
	 	if(dao.deletelUser(id, pw) == -1){
			response.sendRedirect("_8_checkPass.jsp");
			System.out.println("탈퇴 실패");
		}
		else{
			// 탈퇴 성공
			session.removeAttribute("log");
			BoardDAO.getInstance().deleteAll(id);
			response.sendRedirect("_1_index.jsp");						
			System.out.println("탈퇴 성공");
		}
	}
	%>
</body>
</html>