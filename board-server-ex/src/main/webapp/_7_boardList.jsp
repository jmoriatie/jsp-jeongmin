<%@page import="user.UserDAO"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDAO"%>
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
	<form action="_9_checkPassPro.jsp">
		<input type="hidden" name="dir" value="1" >
		<input type="submit" value="로그아웃">
	</form>
	<form action="_9_checkPassPro.jsp">
		<input type="hidden" name="dir" value="2">
		<input type="submit" value="회원수정">
	</form>
	<form action="_8_checkPass.jsp">
		<input type="submit" value="회원탈퇴">
	</form>

	<h1>List</h1>
	<div class="wrap">
		<table border="1"  style="border-collapse: collapse; width: 350px;">
			<td>no</td>
			<td>title</td>
			<td>id</td>
			<td>like</td>
			<td>regdate</td>
			</th>
			<%
            BoardDAO dao = BoardDAO.getInstance();
            ArrayList<BoardDTO> boardList = dao.getBoardList();
            
            for(BoardDTO board : boardList){%>
			<tr>
				<td><%= board.getNo() %></td>
				<!--  
					타이틀 길이 조정하는 코드 작성
					int titleLen = title.length();
					if(titleLen > 5){
		
					}
				-->
				<td onclick="location.href='_12_boardView.jsp?no=<%=board.getNo()%>'"><%= board.getTitle() %></td>
				<td><%= board.getId() %></td>
				<td><%= board.getLikes() %></td>
				<td><%= board.getRegDate() %></td>
			</tr>
			<% 	
            }%>
		</table>
		<button onclick="location.href='_10_boardWrite.jsp'">글쓰기</button>
	</div>

</body>
</html>