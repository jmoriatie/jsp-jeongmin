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
	// 검증이나 이런건 여기서
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	UserDAO dao = UserDAO.getInstance();
	if(dao.checkLogin(id, pw)){
		// 톰캣 세션이라고 생각하면되고
		// 브라우저 돌아갈 때까지 가지고 있다
		// ㄴ 로그인 한 회원이 누군지 식별
		session.setAttribute("log", id);
		
		response.sendRedirect("_7_boardList.jsp");	
	}
	else{
		response.sendRedirect("_5_login.jsp");	
	}
	%>
</body>
</html>