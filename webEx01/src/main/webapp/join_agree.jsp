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
        
        #form_agree span{
            /* 체크박스 있는 영역 */
        }

        #form_agree p{
            display: block;
            border: solid 1px;
            margin: auto;
            width: 60vw;
            height: 10vh;
            overflow: scroll;
            margin-bottom: 5vh;
        }

        #title{
            font-size: 3vw;
            margin-bottom: 5vh;
        }

        #check_all{
            margin-bottom: 5vh;
        }

        #alert_message{
            color: red;
            font-size: 10pt;
        }
        </style>

    <title>Document</title>
</head>
<body>
<div class="join">
<span id="title">NAVER</span><br><br>
<form action="http://localhost:8081" id="form_agree">
    <input type="checkbox" name="check_all" id="check_all" onclick="checkAll(form_agree)"><span>네이버 이용약관, 개인정보 수집 및 이용, 위치정보 이용약관(선택), 프로모션 정보 수신(선택)에 모두 동의합니다.</span><br>
    <input type="checkbox" name="check" required><span>네이버 이용약관 동의</span><span>(필수)</span><br>
    <p>블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라</p>
    <input type="checkbox" name="check" required><span>개인정보 수집 및 이용 동의</span><span>(필수)</span><br>
    <p>블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라</p>
    <input type="checkbox" name="check"><span>위치정보 이용약관 동의</span><span>(선택)</span><br>
    <p>블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라 여기까지는 박스 처리</p>
    <input type="checkbox" name="check"><span>프로모션 정보수신 동의</span><span>(선택)</span><br>
    <p id="text">블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라 여기는 그냥 텍스트 처리</p>
    
    <input type="button" value="취소"  onclick="">
    <input type="button" value="확인"  onclick="checkVal(form_agree)">
    </form>
    <br>
    <p id="alert_message"></p>
</div>
	<script src="join_agreePro.js"></script>
</body>
</html>