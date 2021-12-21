<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>렌터카:글작성</title>
</head>

<body>
<%
	String id = (String)session.getAttribute("log");
%>
	<h1>글작성</h1>
	<form action="_5-3_boardWritePro.jsp">
		<table border=1px;>
			<tr>
				<td>제목</td>
				<td><input type="text" id="title" name="title" placeholder="제목"
					style="width: 300px"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea id="content" name="content" placeholder="내용"
						style="overflow: scroll; width: 300px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
		<%if(id == null){%>
		<p>우선 로그인하세요</p>
		<%} %>
		<input type="submit" value="글저장">
		<button id="back">뒤로가기</button> <!-- script -->

	</form>


</body>
<script>
    document.querySelector('#back').addEventListener('click', e =>{
        e.preventDefault();
        location.href='_5-1_boardList.jsp';
    });

</script>
</html>