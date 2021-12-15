<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="user.UserDTO"%>
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
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	/* 
	데이터베이스에 가져온 id, pw 등록
	데이터베이스와 소통하기 위한 오브젝트
	ㄴ DTO(Data Transfer Object) = Bean, VO(read only), Entity Class
	ㄴ 자바 객체임 => src 폴더에 만듦
	*/
	
	UserDAO dao =  UserDAO.getInstance();
	
	UserDTO user = new UserDTO(id, pw);
	if(dao.addUser(user) != -1){
		response.sendRedirect("_1_index.jsp");	
	}
	else{
		response.sendRedirect("_3_join.jsp");	
	} 
	
	%>
</body>
</html>