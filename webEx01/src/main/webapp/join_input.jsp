<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        *{
            margin: 0px;
            padding: 0px;
        }
        
        .join{
            text-align: center;
            font-size: 10pt;

        }

        #title{
            font-size: 3vw;
            margin-bottom: 5vh;
        }

        #alert_message{
            color: red;
            font-size: 10pt;
        }
        </style>

    <title>네이버:회원가입</title>
</head>

<body>
    <div class="join_input">
        <span id="title">NAVER</span><br><br>
        <form>
            <span>아이디</span>
            <input type="text" name="id" id="id"><span>@naver.com</span>
            <p class="message" id="id_message">
            <span>비밀번호</span>
            <input type="password" name="pw" id="pw">
            <p class="message" id="pw_message">
            <span>비밀번호 재확인</span>
            <input type="password" name="pw_check" id="pw_check">
            <p class="message" id="pw_check_message">
            <span>이름</span>
            <input type="text" name="name" id="name">
            <p class="message" id="name_message">
            <span>생년월일</span>
            <!-- 정규식 -->
            <input type="text" name="year" id="year" placeholder="년(4자)">
            <select id="month">
                <option value='' selected>월</option>
                <!-- 여기 반복문 12월까지-->
                <option value="1">1</option>
            </select>
            <input type="number" name="day" id="day" placeholder="일">
            <p class="message" id="birth_message">
            <span>성별</span>
            <span>본인확인 이메일</span><span>(선택)</span>
            <input type="email" name="email" id="email" >
            <p class="message" id="email_message">
            <span>휴대전화</span>
            <select id="month">
                <option value='82' selected>대한민국 +82</option>
                <option value='82' selected>대한민국 +82</option>
            </select>
            <!-- 정규식 넣기 -->
            <input type="tel" id="tel" name="tel">
            <p class="message" id="tel_message">
            <button>인증번호 받기</button><br>
            <input type="text" placeholder="인증번호 입력하세요">
            <p class="message" id="self_check_message"></p>
            
            <input type="button" value="가입하기" onclick="">
        </form>
    </div>
</body>

</html>