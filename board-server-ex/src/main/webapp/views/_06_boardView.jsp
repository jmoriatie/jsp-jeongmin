<%@page import="model.dto.UserDTO"%>
<%@page import="model.dto.BoardDTO"%>
<%@page import="model.dao.BoardDAO"%>
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
	<%
	String id = ((UserDTO)session.getAttribute("log")).getId();
	BoardDTO post = (BoardDTO)request.getAttribute("post");
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
    <button id="modify" onclick="location.href='service?command=boardUpdateForm&no=<%=post.getNo()%>'">글수정</button>
    <button id="delete" onclick="location.href='service?command=boardDelete&no=<%=post.getNo()%>'">글삭제</button>    
    <%}else{ %>
    <!-- 내 게시물 아닐때 : 좋아요 노출 -->
    <button id="likes" onclick="location.href='service?command=boardLike&no=<%=post.getNo()%>'">좋아요</button>
    <%} %>
    
    <button id="back"  onclick="location.href='service?command=boardList'">뒤로가기</button>
</body>

</html>