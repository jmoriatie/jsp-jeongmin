<%@page import="rentCar.RentCarDAO"%>
<%@page import="member.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link type="text/css" rel="stylesheet" href="resources/_00_index.css">
    <title>INDEX</title>
</head>

<body>
  	<%
    	MemberDAO dao = MemberDAO.getInstance();
    	
    	ArrayList<MemberDTO> datas = dao.getMembers();
    	
    	for(int i=0; i<datas.size(); i++){
    		MemberDTO user = datas.get(i);
    		System.out.println(user.toString());
    	}                            
    	
    	%>
    <div class="wrap">
        <header>
            <section>
                <article id="header_art1">
                    <div>로고</div>
                </article>
                <article id="header_art2"></article>
                <article id="header_art3">
                <%
                if(session.getAttribute("log") == null){
                %>
				<button onclick="location.href='_01_login.jsp?pass=null'">로그인</button> |
				<button onclick="location.href='_02_join.jsp'">회원가입</button>
                <%
                }else{
                %>
				<button onclick="location.href='_03_myPage.jsp'">마이페이지</button> |
				<button onclick="location.href='_01-1_logoutPro.jsp'">로그아웃</button>
                <%}%> 
                </article>
            </section>
        </header>

        <nav>
            <section>
                <button onclick="location.href='_6-1_rentCarList.jsp'">렌트카 리스트</button>
                <button onclick="location.href='_5-1_boardList.jsp'">자유 게시판</button>
            </section>
        </nav>

        <main>
            <section class="sec1">
                <article id="main_art1">
                <h4>대여가능 차량</h4>
                <table border="1px">
                <tr>
                	<td>
                		<img src="img/<%= RentCarDAO.getInstance().getOneRentCar(1).getImage() %>" width="150px" height="100px" onclick="location.href='_6-2_rentCarView.jsp?no=1'">
                		<p onclick="location.href='_6-2_rentCarView.jsp?no=1'"><%= RentCarDAO.getInstance().getOneRentCar(1).getName() %></p>
                		<p><%= RentCarDAO.getInstance().getOneRentCar(1).getCompany() %></p>
                		<p><%= RentCarDAO.getInstance().getOneRentCar(1).getPrice() %></p>
                	</td>
                	<td>
                		<img src="img/<%= RentCarDAO.getInstance().getOneRentCar(2).getImage()%>" width="150px" height="100px" onclick="location.href='_6-2_rentCarView.jsp?no=2'">
                		<p onclick="location.href='_6-2_rentCarView.jsp?no=2'"><%= RentCarDAO.getInstance().getOneRentCar(2).getName() %></p>
                		<p><%= RentCarDAO.getInstance().getOneRentCar(2).getCompany() %></p>
                		<p><%= RentCarDAO.getInstance().getOneRentCar(2).getPrice() %></p>
                	</td>
                	<td>
                		<img src="img/<%= RentCarDAO.getInstance().getOneRentCar(3).getImage()%>" width="150px" height="100px" onclick="location.href='_6-2_rentCarView.jsp?no=3'">
                		<p onclick="location.href='_6-2_rentCarView.jsp?no=3'"><%= RentCarDAO.getInstance().getOneRentCar(3).getName() %></p>
                		<p><%= RentCarDAO.getInstance().getOneRentCar(3).getCompany() %></p>
                		<p><%= RentCarDAO.getInstance().getOneRentCar(3).getPrice() %></p>                		
                	</td>
                </tr>
                </table>
                <button onclick="location.href='_6-1_rentCarList.jsp'">더보기</button>
                </article>
                
                <article id="main_art2"></article>
                
            </section>
        </main>
        <aside>
            어사이드
        </aside>
        <footer>
            푸터
        </footer>
    </div>
</body>

</html>