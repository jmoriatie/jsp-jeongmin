<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>UPDATE & DELETE 권한 확인</h1>

    <form method="POST" action="_9_checkPassPro.jsp">
        <span>id:&#9;</span><input type="text" name="id" value=<%= session.getAttribute("log")%> readonly><br><br>
        <span>pw:&#9;</span><input type="text" name="pw"><br><br>
        <!-- dir 받아서 한번 더 넘겨주기
         다시 올 때 저장이 안됨 (수정하는 경우에  다시 작성 )-->
        <input type="hidden" name="dir" value="3">
        <input type="submit">
    </form>
    <button id="back" onclick="location.href='_7_boardList.jsp'">뒤로가기</button> <!-- script -->
    
</body>
</html>