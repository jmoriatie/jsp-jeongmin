<%@page import="rentCar.RentCarDAO"%>
<%@page import="rentCar.RentCarDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>렌트카:리스트</title>
</head>

<body>
<%

	ArrayList<RentCarDTO> rentCars = RentCarDAO.getInstance().getRentCars();
	
%>
<form action="_6-0_rentCarSearchList.jsp">
	<p>이름검색: </p><input type="text" name="search" id="search" placeholder="검색">
	<input type="submit">
</form>
<h1>렌트카 리스트</h1>
<div class="wrap">
    <table border="1px">
    <%for(RentCarDTO car : rentCars){ %>
        <%int cat = car.getCategory(); %>
        <tr>
            <td><img src="img/<%=car.getImage() %>" width="150px" height="100px" onclick="location.href='_6-2_rentCarView.jsp?no=<%=car.getNo()%>'"></td>
            <td width="300px">
                <h4 onclick="location.href='_6-2_rentCarView.jsp?no=<%=car.getNo()%>'"><%=car.getName() %></h4>
                <p>회사: <%=car.getCompany() %></p>
                <p>차종: <%=RentCarDAO.getInstance().selectCategory(cat) %></p>
                <p>가격: <%=car.getPrice()%>원</p>
            </td>
        </tr>
        <%} %>
    </table>
</div>
    <button onclick="location.href='_00_index.jsp'">뒤로가기</button>
</body>
</html>