<%@page import="rentCar.RentCarDTO"%>
<%@page import="rentCar.RentCarDAO"%>
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

	RentCarDTO car = RentCarDAO.getInstance().getOneRentCar(no);
	int cat = car.getCategory(); // 카테고리 String반환
%>
    <div class="wrap">
         <table border="1px">
	        <tr>
	            <td><img src="img/<%=car.getImage() %>" width="150px" height="100px"></td>
	 		</tr>
	 		<tr>
	            <td width="300px">
	                <h4 onclick="location.href='_6-2_rentCarView.jsp?no=<%=car.getNo()%>'"><%=car.getName() %></h4>
	                <p>회사: <%=car.getCompany() %></p>
	                <p>차종: <%=RentCarDAO.getInstance().selectCategory(cat) %></p>
	                <p>가격: <%=car.getPrice()%>원</p>
	                <p>탑승인원: <%=car.getUse_people()%>인승</p>
	            </td>
	       	 </tr>
        </table>
    </div>
    <button onclick="location.href='_6-3_reserve.jsp?no=<%= no %>'">예약하기</button>
    <button onclick="location.href='_6-1_rentCarList.jsp'">뒤로가기</button>
</body>
</html>