<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
	*{
		text-align : center;
		margin: 5px;
		
	}
	
	#title{
		font-size: 20pt;
		color: #F09583;
		font-family: 'Black Han Sans', sans-serif;
	}
	
	#table{
		margin: auto;
		background-color: #F5E4C3;
		font-family: 'Nanum Myeongjo', serif;
	}
	#table td{
		color: #246F88;
		width: 150px;
		
	}
	#result{
		height: 50px;
		font-weight: 800;
	}
	#submit{
		width: 70px;
		height: 30px;
		color: white;
		border-style: none;
		background-color: #29C5CC;
	}
	
</style>

<title>채점결과</title>
</head>
<body>
	
	<%
	String r = request.getParameter( "realAns1" );
	
 	int[] arr = new int[5];
	int[] ansArr = new int[5];
	String[] ox = new String[5];
	
	int score = 0;
	
	for(int i=0; i<5; i++){
		if(request.getParameter("ans"+(i+1)) != ""){
			arr[i] = Integer.parseInt(request.getParameter("ans"+(i+1)));
		}
		else{
			
		}
		if(request.getParameter("realAns"+(i+1)) != "" ){
			ansArr[i] = Integer.parseInt(request.getParameter("realAns"+(i+1)));
		}
		else{
			
		}
		if(arr[i] == ansArr[i]){
			ox[i] = "O";
			score += 20;
		}
		else{
			ox[i] = "X";
		}
	}
 	%>
	<span id="title">구구단 문제 결과</span>
	<table border='1' id="table">
		<tr>
			<td width="150px">1번 문제</td>
			<td width="100px">정답 :  <%= ansArr[0] %></td>
			<td width="150px">작성한 답: <%= arr[0] %> </td>
			<td width="50px"><%= ox[0]%> </td>
		</tr>
		<tr>
			<td width="150px">2번 문제</td>
			<td width="100px">정답 :  <%= ansArr[1] %></td>
			<td width="150px">작성한 답: <%= arr[1] %> </td>
			<td width="50px"><%= ox[1]%> </td>
		</tr>
		<tr>
			<td width="150px">3번 문제</td>
			<td width="100px">정답 :  <%= ansArr[2] %></td>
			<td width="150px">작성한 답: <%= arr[2] %> </td>
			<td width="50px"><%= ox[2]%> </td>
		</tr>
		<tr>
			<td width="150px">4번 문제</td>
			<td width="100px">정답 :  <%= ansArr[3] %></td>
			<td width="150px">작성한 답: <%= arr[3] %> </td>
			<td width="50px"><%= ox[3]%> </td>
		</tr>
		<tr>
			<td width="150px">5번 문제</td>
			<td width="100px">정답 :  <%= ansArr[4] %></td>
			<td width="150px">작성한 답: <%= arr[4] %> </td>
			<td width="50px"><%= ox[4]%> </td>
		</tr>
		<tr >
			<td colspan="4" id="result" >당신의 점수는 <%= score %>점 입니다</td>
		</tr>
	</table> 
		<form action="gugudan.jsp">
			<input type="submit" value="돌아가기" id="submit">
		</form>
</body>
</html>