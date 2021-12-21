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
<title>렌트카:게시</title>
</head>

<body>
	<!-- 누르면 보이는 상세페이지 -->
	<%
	String noString = request.getParameter("no");
	int no = Integer.parseInt(noString);

	BoardDAO dao = BoardDAO.getInstance();
	BoardDTO post = dao.getOnePost(no);

	String id = (String) session.getAttribute("log");
	
	ArrayList<String> comments = dao.printComments(no); // 댓글 불러오기
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

    <!-- 댓글 보는 란, 적는 란 -->
    <% if(id != null){ %>
    <form action="_5-9_commentsPro.jsp">
    	<input type="hidden" name="no" value="<%=no %>">
    	<input type="text" name="comment" id="comment">
    	<input type="submit" value="댓글작성"> 
    </form>
    <%} %>
    <% if(comments != null && comments.size() != 0){ %>
    <table>
    <% for(int i=0; i<comments.size()-1; i+=2){ %>
    	<tr>
    		<% String cmt = comments.get(i)+"="+comments.get(i+1); %> 
    		<td><%= comments.get(i) %>: <%= comments.get(i+1) %></td>
    		<%if(id.equals(comments.get(i))){ %>
    		<td><button onclick="location.href='_5-9_commentDeletePro.jsp?no=<%=no%>&cmt=<%=cmt%>'">삭제하기</button></td>
    		<%} %>
    	</tr>
    	<%} %>
    	<%} %>
    </table>
        <%if(id != null && id.equals( post.getId() )){%>
    <!-- 내 게시물: 수정, 삭제 노출 -->
    <button id="modify" onclick="location.href='_5-5_boardUpdate.jsp?no=<%=no%>'">글수정</button>
    <button id="delete" onclick="location.href='_5-7_boardDelete.jsp?no=<%=no%>'">글삭제</button>    
    <%}else{ %>
    <!-- 내 게시물 아닐때 : 좋아요 노출 -->
    <button id="likes" onclick="location.href='_5-9_likesPro.jsp?no=<%=no%>'">좋아요</button>
    <%} %>
    <button id="back"  onclick="location.href='_5-1_boardList.jsp'">뒤로가기</button>
</body>

</html>