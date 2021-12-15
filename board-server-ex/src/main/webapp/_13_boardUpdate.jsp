<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
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

	BoardDTO post = null;
	ArrayList<BoardDTO> board = BoardDAO.getInstance().getBoardList();
	for (BoardDTO p : board) {
		if (p.getNo() == no) {
		System.out.println("p: " + p.getNo());
			post = p;
			break;
		}
	}
%>
<!-- 수정, 삭제 pro 페이지로 이동하게끔 만들기 -->
	<h1>글 수정</h1>
	<form method="POST" action="_14_boardUpdatePro.jsp?no=<%=no%>">
		<table border=1px;>
			<tr>
				<td>제목</td>
				<td><input type="text" id="title" name="title" value="<%= post.getTitle() %>"
					style="width: 300px"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea id="content" name="content"
						style="overflow: scroll; width: 300px; height: 300px;"><%= post.getContents() %>
						</textarea>
				</td>
			</tr>
		</table>

        <span>pw:&#9;</span><input type="text" name="pw"><br><br>
        
		<input type="submit" value="저장">
	</form>
		<button id="back" onclick="location.href='_12_boardView.jsp?no=<%=no%>'">뒤로가기</button>
</body>
</html>