<%@page import="model.dao.UserDAO"%>
<%@page import="model.dto.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Board List</title>
</head>
<body>
	<h1>Board List</h1>
	<div class="wrap">
		<table border="1"  style="border-collapse: collapse; width: 350px;">
			<td>no</td>
			<td>title</td>
			<td>id</td>
			<td>like</td>
			<td>regdate</td>
			</th>
			<%
            ArrayList<BoardDTO> boardList = (ArrayList<BoardDTO>)request.getAttribute("boardList");
            
            for(BoardDTO board : boardList){%>
			<tr>
				<td><%= board.getNo() %></td>
				<td onclick="location.href='service?command=boardView&no=<%=board.getNo()%>'"><%= board.getTitle() %></td>
				<td><%= board.getId() %></td>
				<td><%= board.getLikes() %></td>
				<td><%= board.getRegDate() %></td>
			</tr>
			<% 	
            }%>
		</table>
		<button onclick="location.href='service?command=boardWriteForm'">글쓰기</button>
		<button onclick="location.href='service?command=main'">뒤로가기</button>
	</div>

</body>
</html>