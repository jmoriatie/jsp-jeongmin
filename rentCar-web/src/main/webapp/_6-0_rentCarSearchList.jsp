<%@page import="rentCar.RentCarDTO"%>
<%@page import="java.util.ArrayList"%>
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
	String search = request.getParameter("search");

	RentCarDAO dao = RentCarDAO.getInstance();
	ArrayList<RentCarDTO> rentCars = dao.getRentCars();

%>

<h1>렌트카 검색 : "<%= search %>"</h1>
<div class="wrap">
    <table border="1px">
    <%for(RentCarDTO car : rentCars){ 
    if(car.getName().contains(search)){%>
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
        <%}
    }%>
    </table>
</div>
    <button onclick="location.href='_00_index.jsp'">뒤로가기</button>
</body>
</html>