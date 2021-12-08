<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Myeongjo:wght@700&display=swap" rel="stylesheet">


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
	#submit{
		width: 70px;
		height: 30px;
		color: white;
		border-style: none;
		background-color: #29C5CC;
	}
	
</style>

<title>구구단</title>
</head>
<body>
	<!--  
		폼예제
		gugudan.jsp
		2~9단 안에서 랜덤으로 5개 문제를 출제 (table)
		사용자가 문제에 대한 답을 입력(input -> req)
		
		gugudanPro.jsp
		넘어온 파라미터를 바탕으로성적표를 출력
	-->

	<%@ page import="java.util.Random" %>
	<% 
		Random rn = new Random();
	
		int[] arr = new int[10]; // 문제
		int[] ansArr = new int[5]; // 답
		
		for(int i=0; i<arr.length; i++){
			arr[i] = rn.nextInt(8)+2;
		}
		
		int num = 0;
		for(int i=0; i<ansArr.length; i++){
			arr[i] = rn.nextInt(8)+2;
			arr[i+1] = rn.nextInt(8)+2;
			ansArr[i] = arr[num] * arr[num+1];
			num +=2;
		}
	%>
	<span id="title">구구단</span>
	<form method="get" action="gugudanPro.jsp">
		<table border='1' id="table">
			<tr >	
				<td width="100px">1번 문제</td>
				<td width="150px"><%= arr[0] %> * <%= arr[1] %> = </td>
				<td><input type="number" name="ans1"></td>

			</tr>
			<tr >
				<td width="100px">2번 문제</td>
				<td width="150px"><%= arr[2] %> * <%= arr[3] %> = </td>
				<td><input type="number" name="ans2"></td>	
			</tr>
			<tr >
			
				<td width="100px">3번 문제</td>
				<td width="150px"><%= arr[4] %> * <%= arr[5] %> = </td>
				<td><input type="number" name="ans3"></td>	
			</tr>
			<tr >
				<td width="100px">4번 문제</td>
				<td width="150px"><%= arr[6] %> * <%= arr[7] %> = </td>
				<td><input type="number" name="ans4"></td>	
			</tr>
			<tr >
				<td width="100px">5번 문제</td>
				<td width="150px"><%= arr[8] %> * <%= arr[9] %> = </td>
				<td><input type="number" name="ans5"></td>	
			</tr>

		</table>
		<input type="hidden" name="realAns1" value="<%= ansArr[0] %>" >
		<input type="hidden" name="realAns2" value="<%= ansArr[1] %>" >
		<input type="hidden" name="realAns3" value="<%= ansArr[2] %>" >
		<input type="hidden" name="realAns4" value="<%= ansArr[3] %>" >
		<input type="hidden" name="realAns5" value="<%= ansArr[4] %>" >
		<input type="submit" id="submit">
	</form>
</body>
</html>