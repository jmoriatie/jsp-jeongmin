<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
</head>

<body>
	<!-- 누르면 보이는 상세페이지 -->
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
	System.out.println("post: " + post);

	String id = (String) session.getAttribute("log");
	%>
   <h1>게시글</h1>
    <table border=1px; style="width: 550px">
        <tr>
            <td>제목</td>
            <td colspan="3"><span id="title" name="title" style="width: 300px"><%= post.getTitle() %></span> </td>
        </tr>
        <tr>
            <td>작성자</td>
            <td><span id="id" name="id" style="width: 300px"><%= post.getId() %></span> </td>
            <td>작성일</td>
            <td><span id="regDate" name="regDate" style="width: 300px"><%= post.getRegDate() %></span> </td>
        </tr>
        <tr>
            <td>내용</td>
            <td colspan="3"><span id="content" name="content" style="overflow: scroll; width: 300px; height: 300px;"><%= post.getContents() %></span> </td>
        </tr>     
        <tr>
            <td>좋아요</td>
            <td colspan="3"><span id="likes" name="likes" style=" width: 300px; height: 300px;"><%= post.getLikes() %>개</span> </td>
        </tr>    
    </table>
    <%if(id.equals(post.getId())){ %>
    <!-- 내 게시물: 수정, 삭제 노출 -->
    <button id="modify" onclick="location.href='_13_boardUpdate.jsp?no=<%=no%>'">글수정</button>
    <button id="delete" onclick="location.href='_15_boardDelete.jsp?no=<%=no%>'">글삭제</button>    
    <%}else{ %>
    <!-- 내 게시물 아닐때 : 좋아요 노출 -->
    <button id="likes" onclick="location.href='_17_likesPro.jsp?no=<%=no%>'">좋아요</button>
    <%} %>
    
    <button id="back"  onclick="location.href='_7_boardList.jsp'">뒤로가기</button>
</body>

</html>