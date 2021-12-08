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
            font-size: 7pt;
        }

        #a {
            display: grid;
            grid-template:
            "sec1 sec2 sec3" 1fr 
            / 1fr 400px 1fr;
            
        }

        #sec1 {
            grid-area: sec1;
            background-color: #F5F6F7;
        }

        #sec2 {
            grid-area: sec2;
            background-color: #F5F6F7;
        }

        #sec3 {
            grid-area: sec3;
            background-color: #F5F6F7;
        }

        .join_agree_header {
            text-align: center;
        }

        .check{
            display: none;
        }


        .label{
            display: inline-block;
            width: 10px;
            height: 10px;
            border-radius: 10px;
            border: solid 1px;
            border-color: #A7A7A7;
        }

        #check_all:checked ~ #lab1,
        #check2:checked ~ #lab2,
        #check3:checked ~ #lab3,
        #check4:checked ~ #lab4,
        #check5:checked ~ #lab5
        {
            border-radius: 10px;
            border: solid 1px;
            background-color: #03C75B;
            border-color: #03C75B;
        }

        #form_agree p {
            display: block;
            border: solid 1px;
            border-color: lightgray;
            width: 400px;
            height: 70px;
            overflow: scroll;
            margin-top: 10px;
            margin-bottom: 40px;
        }

        #form_agree .text_line {
            font-size: 8pt;
            font-weight: 700;

        }
        #form_agree .text_sub {
            font-size: 5pt;
            font-weight: 400;
            color: #03C75B;
        }

        #title {
            font-size: 35pt;
            margin-bottom: 5vh;
            color: #03C75B;
            font-weight: 900;
            cursor: pointer;            
        }

        #check_all_div{
            margin-bottom: 20px;
        }

        #check_all {
            margin-bottom: 5vh;
        }

        #alert_message {
            color: red;
            font-size: 10pt;
        }

        #text{
            border: none;
            display: block;
            font-size: 4pt;
            margin-bottom: 3vh;
            color: gray;
        }

        .button{
            width: 198.5px;
            height: 45px;
            border: none;
            font-size: 9pt;
            color: white;
            font-weight: bold;
        }

        #pass{
            background-color: #03C75B;
        }
        #back{
            background-color: #8D8E8E;
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
            <article>
                <div class="join_agree_header">
                    <span id="title">JAVER</span><br><br>
                </div>
                <div>
                    <form id="form_agree">
                        <div id="check_all_div">
                            <input type="checkbox" class="check" name="check_all" id="check_all"  onclick="checkAll(form_agree)">
                            <label class="label" id="lab1" for="check_all"></label>
                            <span class="text_line">네이버 이용약관, 개인정보 수집 및 이용, 위치정보 이용약관(선택), 프로모션 정보 수신(선택)에 모두 동의합니다.</span><br>
                        </div>
                        <input type="checkbox" name="check" class="check" id="check2" required>
                        <label class="label" id="lab2" for="check2"></label>
                        <span class="text_line">네이버 이용약관 동의</span><span class="text_sub">(필수)</span>
                        <p>블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라라블라블라블라라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라
                        </p>

                        <input type="checkbox" name="check" class="check" id="check3" required>
                        <label class="label" id="lab3" for="check3"></label>
                        <span class="text_line">개인정보 수집 및 이용 동의</span><span class="text_sub">(필수)</span>
                        <p>블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라
                        </p>

                        <input type="checkbox" name="check" class="check" id="check4">
                        <label class="label" id="lab4" for="check4"></label>
                        <span class="text_line">위치정보 이용약관 동의</span><span class="text_sub">(선택)</span>
                        <p>블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라
                            여기까지는 박스 처리</p>

                        <input type="checkbox" name="check" class="check" id="check5">
                        <label class="label" id="lab5" for="check5"></label>
                        <span class="text_line">프로모션 정보수신 동의</span><span class="text_sub">(선택)</span>
                        <span id="text">블라블라블라블라블라블라블라블라블텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트라텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트</span>

                        <input type="button" class="button" id="back" value="취소" onclick="login.jsp">
                        <input type="button" class="button" id="pass" value="확인" onclick="checkVal(form_agree)">
                    </form>
                    <br>
                    <p id="alert_message" font-size="7pt"></p>
                </div>
            </article>
        </section>
        <section id="sec3"></section>
    </div>

    <script src="join_agreePro.js"></script>
</body>

</html>