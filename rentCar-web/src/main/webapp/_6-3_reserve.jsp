<%@page import="rentCar.RentCarDAO"%>
<%@page import="rentCar.RentCarDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>렌터카:예약페이지</title>
</head>
<body>
<%
	String id = (String)session.getAttribute("log");

	String noStr = request.getParameter("no");
	int no = Integer.parseInt(noStr);

	if(id == null){ // 로그인 안되어있으면 돌아가기
		System.out.println("로그인 필요!!!!!");
		
		response.sendRedirect("_6-2_rentCarView.jsp?no="+noStr);
	}
	
	RentCarDTO car = RentCarDAO.getInstance().getOneRentCar(no);
%>
<h3><%= car.getName() %> 예약</h3>
    <div class="wrap">
        <form action="_6-4_reservePro.jsp">
        	<input type="hidden" name="no" value="<%=car.getNo()%>">
            <span>예약일 </span><input type="date" name="r_day" id="r_day"><br>
            <span>보험가입: </span><input type="checkbox" name="use_in"><br>
            <span>와이파이: </span><input type="checkbox" name="use_wifi"><br>
            <span>네비게이션: </span><input type="checkbox" name="use_navi"><br>
            <span>베이비시트: </span><input type="checkbox" name="use_seat"><br>
            <span>대여차량 수: </span><input type="number" name="qty" id="qty" value="1"><br>
            <input type="submit" value="예약하기">
        </form>
    </div>
    
</body>
</html>