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
        span {
            white-space: pre;
        }

        * {
            margin: 0px;
            padding: 0px;
            font-family: 'IBM Plex Sans KR', sans-serif;

        }

        #a {
            display: grid;
            grid-template:
                "sec1 sec2 sec3" 1fr 
                / 1fr 500px 1fr;
            font-size: 10pt;
            height: auto;
            margin-top: 150px;
        }

        #sec1 {
            grid-area: sec1;
        }

        .input_area{
            text-align: center;
        }
        #sec2 {
            grid-area: sec2;
            width: 500px;
            height: 350px;
            border-radius: 30px;
            background-color: #F5F6F7;
            border: solid 1px lightgray;
        }

        #sec3 {
            grid-area: sec3;
        }

        .login_header {
            text-align: center;
            margin-top: 30px;

        }

        #title {
            font-size: 35pt;
            margin-bottom: 5vh;
            color: #03C75B;
            font-weight: 900;
            cursor: pointer;            
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

        #remember{
            display: none;
        }

        #remember_label{
            margin-top: 10px;
            display: inline-block;
            width: 10px;
            height: 10px;
            border-radius: 10px;
            border: solid 1px;
            border-color: #A7A7A7;
        }

        #remember:checked ~ #remember_label{
            border-radius: 10px;
            border: solid 1px;
            background-color: #03C75B;
            border-color: #03C75B;
        }

        #remember_div{
            margin-left: 100px;
            margin-top: 10px;
            margin-bottom: 10px;
            text-align: left;
            font-size: 8pt;
            color: gray;
        }

        .login_sub{
            margin-top: 10px;
            cursor: pointer;
            font-size: 7pt;
            color: gray;
        }

        #id,#pw{
            width: 300px;
            height: 35px;
            border: solid 1px;
            border-radius: 7px;
            border-color: lightgray;
            font-size: 8pt;
        }

        #submit{
            border: none;
            color: white;
            width: 300px;
            height: 35px;
            background-color: #03C75B;
            font-weight: 700;   
        }

        #message{
            display: block;
            font-size: 7pt;
            margin-top: 10pt;
            color: red;
        }
    </style>

    <title>제이버: 로그인</title>
</head>

<body>
    <div id="a">
        <section id="sec1"></section>
        <section id="sec2">
            <article>
                <div class="input_area">
                    <div class="login_header">
                        <span id="title">JAVER</span><br><br>
                    </div>
                    <div>
                        <form method="POST" action="loginPro.jsp">
                            <input id="id" name="id" type="text" placeholder="아이디"><br>
                            <input id="pw" name="pw" type="password" placeholder="비밀번호"><br>
                            <div id="remember_div">
                                <input name="remember" id="remember" type="checkbox">
                                <label id="remember_label" for="remember"></label>
                                <!-- 상태유지 기능처리 : 쿠키 저장 필요-->
                                <span id="remember_text">아이디 저장</span><br>
                            </div>
                            <input type="button"  id="submit"  value="로그인" onclick="checkVal(form)">
                            <p id="message"></p>

                        </form>
                    </div>
                    <br>
                    <hr>
                    <div class="login_sub">
                        <span class="regist">회원가입</span> |
                        <span >아이디 찾기</span> |
                        <span >비밀번호 찾기</span>
                    </div>
                </div>
            </article>
        </section>
        <section id="sec3"></section>
    </div>
    
    <script src="loginPro.js"></script>
</body>

</html>