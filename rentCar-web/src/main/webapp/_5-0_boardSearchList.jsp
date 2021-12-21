<%@page import="board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
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
	String search = request.getParameter("search");

	BoardDAO dao = BoardDAO.getInstance();
	ArrayList<BoardDTO> boardList = dao.getBoardList();

%>
	<form action="_5-0_boardSearchList.jsp">
		<p>제목검색: </p><input type="text" name="search" id="search" placeholder="검색">
		<input type="submit">
	</form>
	<h1>게시판 검색: "<%= search %>"</h1>
	<div class="wrap">
		<table border="1"  style="border-collapse: collapse; width: 350px;">
			<td>no</td>
			<td>title</td>
			<td>id</td>
			<td>like</td>
			<td>regdate</td>
			</th>
			<%
            for(BoardDTO board : boardList){
            	if(board.getTitle().contains(search)){%>
			<tr>
				<td><%= board.getNo() %></td>
				<td onclick="location.href='_5-4_boardView.jsp?no=<%=board.getNo()%>'"><%= board.getTitle() %></td>
				<td><%= board.getId() %></td>
				
				<td><%= board.getLikes() %></td>
				<td><%= board.getRegDate() %></td>
			</tr>
			<% }	
            }%>
		</table>
		<button onclick="location.href='_5-2_boardWrite.jsp'">글쓰기</button>
		<button onclick="location.href='_00_index.jsp'">뒤로가기</button>
	</div>
</body>
</html>