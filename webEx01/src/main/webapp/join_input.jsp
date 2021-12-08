<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@500&display=swap" rel="stylesheet">

    <style>
        * {
            margin: 0px;
            padding: 0px;
            
        }

        #a {
            display: grid;
            grid-template:
                "sec1 sec2 sec3" 1fr
                / 1fr 300px 1fr
                ;
            font-size: 10pt;
            height: auto;
        }

        #sec1 {
            grid-area: sec1;
            background-color: #F5F6F7;
        }
        
        #sec2 {
            grid-area: sec2;
            width: 300px;
            background-color: #F5F6F7;
        }

        #sec3 {
            grid-area: sec3;
            background-color: #F5F6F7;
        }

        .join_header{
            text-align: center;
        }

        #title {
            font-size: 35pt;
            margin-bottom: 5vh;
            color: #03C75B;
            font-weight: 900;
            cursor: pointer;            
        }

        .join_main span{
            font-size: 8pt;
        }
        .join_main p{
            font-size: 6pt;
            font-family: 'IBM Plex Sans KR', sans-serif;
            font-weight:900;
        }
        .join_main input{
            width: 250px;
            height: 28px;
            border:solid 0.5px;
            border-color: lightgray;
            font-family: 'IBM Plex Sans KR', sans-serif;
            font-size: 6pt;
            font-weight: lighter;
        }

        #year,
        #day,
        #month
        {
            width: 80.5px;
            height: 28px;
            border:solid 0.5px;
            border-color: lightgray;
            font-size: 6pt;
        }

        select{
            margin-bottom: 1vh;
            width: 250px;
            height: 28px;
            border:solid 0.5px;
            border-color: lightgray;
            font-size: 6pt;
        }

        #check_tel,
        #tel{
            width: 165px;
            height: 28px;
            border:solid 0.5px;
            border-color: lightgray;
            font-size: 6pt;
        }

        #check_tel{
            width: 80px;
            background-color: #03C75B;
            color: white;
            font-weight: 700;
        }

        .join_main #id{
            width: 195px;
        }

        #naver{
            color: gray;
            
            font-family: 'IBM Plex Sans KR', sans-serif;
            margin: auto;
        }

        .message {
            margin-bottom: 2vh;
            color: red;
            font-size: 6pt;
            
        }

        #submit{
            color: white;
            height: 35px;
            background-color: #03C75B;
            font-weight: 700;   
        }
        @media screen and (max-width: 760px) {
            #title {
                font-size: 25pt;
            }

            #sec1 {
                grid-area: sec1;
            }
            
            #sec3 {
                grid-area: sec3;
                
            }
        }
    </style>


    <title>제이버:회원가입</title>
</head>

<body>
    <div id="a">
        <section id="sec1"></section>
        <section id="sec2">
            <article >
                <div class="join_header">
                    <span id="title">JAVER</span><br><br>
                </div>
                <div class="join_main">
                    <form method="POST" action="join_inputPro.html">
                        <span>아이디</span><br>
                        <input type="text" name="id" id="id" ><span id="naver">@javer.com</span>
                        <p class="message" id="id_message"></p>

                        <span>비밀번호</span><br>
                        <input type="password" name="pw" id="pw">
                        <p class="message" id="pw_message"></p>

                        <span>비밀번호 재확인</span><br>
                        <input type="password" name="pw_check" id="pw_check">
                        <p class="message" id="pw_check_message"></p>

                        <span>이름</span><br>
                        <input type="text" name="name" id="name">
                        <p class="message" id="name_message"></p>

                        <span>생년월일</span><br>
                        <!-- 정규식 -->
                        <input type="text" name="year" id="year" placeholder="년(4자)">
                        <select id="month">
                            <option value='' selected>월</option>
                        <%
                        int num = 1;
                        while(num < 13){%> 	
                        <option value="<%= num %>"><%= num %>월</option>
                        <%
                            num++;
                        }%>
                        </select>
                        <input type="number" name="day" id="day" placeholder="일">
                        <p class="message" id="birth_message"></p>

                        <span>성별</span><br>
                        <select id="gender" name="gender">
                            <option value='' selected>성별</option>
                            <option value='male'>남자</option>
                            <option value='female'>여자</option>
                            <option value='null'>선택안함</option>
                        </select>
                        <p class="message" id="gender_message"></p>

                        <span>본인확인 이메일</span><span>(선택)</span><br>
                        <input type="email" name="email" id="email" placeholder="선택입력">
                        <p class="message" id="email_message"></p>

                        <span>휴대전화</span><br>
                        <select id="tel_country" name="tel_country">
                            <option value='82' selected>대한민국 +82</option>
                            <option value='83'>다른나라 +83</option>
                            <option value='84'>다른나라 +84</option>
                        </select><br>
                        <!-- 정규식 넣기 -->
                        <input type="tel" id="tel" name="tel" placeholder="전화번호 입력">

                        <button id="check_tel">인증번호 받기</button><br>
                        <p class="message" id="tel_message"></p>

                        <input type="text" placeholder="인증번호 입력하세요">
                        <p class="message" id="self_check_message"></p>

                        <input id="submit" type="button" value="가입하기" onclick="validateAll()">
                    </form>
                </div>
            </article>
        </section>
        <section id="sec3"></section>
    </div>

    <script src="join_inputPro.js"></script>
</body>

</html>