<%@page import="reserve.ReserveDAO"%>
<%@page import="reserve.ReserveDTO"%>
<%@page import="rentCar.RentCarDAO"%>
<%@page import="rentCar.RentCarDTO"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDAO"%>
<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>렌터카:마이페이지</title>
</head>

<body>
	<%
	String id = (String)session.getAttribute("log");
	MemberDTO member = MemberDAO.getInstance().getOneMember(id);
	%>
    <table border="1">
        <tr>
            <td>아이디: </td>
            <td><span>><%=member.getId() %></span></td>
        </tr>
        <tr>
            <td>비밀번호: </td>
            <td><span>><%=member.getPw1() %></span></td>
        </tr>
        <tr>
            <td>이메일: </td>
            <td><span>><%=member.getEmail() %></span></td>
        </tr>
        <tr>
            <td>전화번호: </td>
            <td><span>><%=member.getTel() %></span></td>
        </tr>
        <tr>
            <td>취미: </td>
            <td><span>><%=member.getHobby() %></span></td>
        </tr>
        <tr>
            <td>직업: </td>
            <td><span>><%=member.getJob() %></span></td>
        </tr>
        <tr>
            <td>나이: </td>
            <td><span>><%=member.getAge() %>세</span></td>
        </tr>
        <tr>
            <td>한줄소개: </td>
            <td><span>><%=member.getInfo() %></span></td>
        </tr>
    </table>
    <button onclick="location.href='_04_memberUpdate.jsp'">수정하기</button>
    <button onclick="location.href='_04-1_memberDelete.jsp'">삭제하기</button>    
    
    	<p>내가 쓴 글</p>
	<div class="writeList">
		<table border="1"  style="border-collapse: collapse; width: 350px;">
			<td>no</td>
			<td>title</td>
			<td>id</td>
			<td>like</td>
			<td>regdate</td>
			</th>
			<%
            BoardDAO dao = BoardDAO.getInstance();
            ArrayList<BoardDTO> boardList = dao.getBoardList();
            
            // 아이디 같은 같은 게시물 전체 출력
            for(BoardDTO post : boardList){%>
	            <% if(post.getId().equals(id)){ %>
				<tr>
					<td><%= post.getNo() %></td>
					<td onclick="location.href='_5-4_boardView.jsp?no=<%=post.getNo()%>'"><%= post.getTitle() %></td>
					<td><%= post.getId() %></td>
					
					<td><%= post.getLikes() %></td>
					<td><%= post.getRegDate() %></td>
				</tr>
				<%} %>	
            <%}%>
		</table>
		<button onclick="location.href='_5-2_boardWrite.jsp'">글쓰기</button>
	</div>
	<p>렌트카 리스트</p>
	<div class="rentList">
    <table border="1px">
    <%
    ArrayList<ReserveDTO> rentList = ReserveDAO.getInstance().getReservations();
    for(ReserveDTO reservation : rentList){ %>
	   <%if(reservation.getId().equals(id)){
	       	RentCarDTO car = RentCarDAO.getInstance().getOneRentCar(reservation.getNo());
       	 	int cat = car.getCategory(); 
	     %>
	        <tr>
	            <td><img src="img/<%=car.getImage() %>" onclick="location.href='_6-2_rentCarView.jsp?no=<%=car.getNo()%>'" width="150px" height="100px"></td>
	            <td width="300px">
	                <h4 onclick="location.href='_6-2_rentCarView.jsp?no=<%=car.getNo()%>'"><%=car.getName() %></h4>
	                <p>회사: <%=car.getCompany() %></p>
	                <p>차종: <%=RentCarDAO.getInstance().selectCategory(cat) %></p>
	                <p>가격: <%=car.getPrice()%>원</p>
	                <p>보험 :  <%= reservation.getUse_in() == 1? "가입":"미가입" %></p>
	                <p>사용 서비스 : <%= reservation.getUse_navi() == 1? "네비게이션 ":""%> <%= reservation.getUse_wifi() == 1? "와이파이 ":""%> <%= reservation.getUse_seat() == 1? "카시트":""%></p>
	                <p>예약기간 : <%= reservation.getR_day() %></p>
	                <p>잔여 일 수가 <%= reservation.getD_day() %>일 남았습니다</p>
	            	<button onclick="location.href='_6-5_reserveDeletePro.jsp?reserve_seq=<%=reservation.getReserve_seq()%>'">예약취소</button>
	            </td>
	        </tr>
    	<%} %>
    <%} %>
    </table>
    <button onclick="location.href='_00_index.jsp'">뒤로가기</button>
    
</div>
</body>

</html>