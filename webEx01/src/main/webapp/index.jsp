
<%-- jsp 주석 태그 --%>
<!-- 지시자 태그(브라우저에 문서의 정보를 전달-->
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	hello world
	<%
/*
		jsp : Java Server Page
		ㄴ html 문서 안에 java 문장(코드)을 작성하는 것
		
		// 1) 지시자 태그 <%@ >
		// 2) 주석 태그 <%-- --% >
		// 3) 스크립틀릿 <% % >
		// 4) 표현식 <%= % >
		
		
		// 스크립틀릿(scriptlet) 태그 안에 자바 문장을 작성할 수 있다 
	*/
	int num = 10; 
	System.out.println(num);
	%>
	
	<%
	num = 1;
	while(num <=10){%>
		<h1><%= num %></h1>
		<% num++;
	}
	%>
	<br>
	[구구단]
	<%
		/* 구구단 출력 */
		int num1 = 2;
		int num2 = 1;
		while(num1 < 10){ %>
			<%= num1%> * <%= num2%> = <%= num1 * num2%><br>
	<%
			num2++;
			if(num2 == 10){
				num1++;
				num2 = 1;%>
				<hr>
				<%
			}
		}
	%>
</body>
</html>