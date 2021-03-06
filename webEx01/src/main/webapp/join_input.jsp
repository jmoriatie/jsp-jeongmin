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


    <title>?????????:????????????</title>
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
                        <span>?????????</span><br>
                        <input type="text" name="id" id="id" ><span id="naver">@javer.com</span>
                        <p class="message" id="id_message"></p>

                        <span>????????????</span><br>
                        <input type="password" name="pw" id="pw">
                        <p class="message" id="pw_message"></p>

                        <span>???????????? ?????????</span><br>
                        <input type="password" name="pw_check" id="pw_check">
                        <p class="message" id="pw_check_message"></p>

                        <span>??????</span><br>
                        <input type="text" name="name" id="name">
                        <p class="message" id="name_message"></p>

                        <span>????????????</span><br>
                        <!-- ????????? -->
                        <input type="text" name="year" id="year" placeholder="???(4???)">
                        <select id="month">
                            <option value='' selected>???</option>
                        <%
                        int num = 1;
                        while(num < 13){%> 	
                        <option value="<%= num %>"><%= num %>???</option>
                        <%
                            num++;
                        }%>
                        </select>
                        <input type="number" name="day" id="day" placeholder="???">
                        <p class="message" id="birth_message"></p>

                        <span>??????</span><br>
                        <select id="gender" name="gender">
                            <option value='' selected>??????</option>
                            <option value='male'>??????</option>
                            <option value='female'>??????</option>
                            <option value='null'>????????????</option>
                        </select>
                        <p class="message" id="gender_message"></p>

                        <span>???????????? ?????????</span><span>(??????)</span><br>
                        <input type="email" name="email" id="email" placeholder="????????????">
                        <p class="message" id="email_message"></p>

                        <span>????????????</span><br>
                        <select id="tel_country" name="tel_country">
                            <option value='82' selected>???????????? +82</option>
                            <option value='83'>???????????? +83</option>
                            <option value='84'>???????????? +84</option>
                        </select><br>
                        <!-- ????????? ?????? -->
                        <input type="tel" id="tel" name="tel" placeholder="???????????? ??????">

                        <button id="check_tel">???????????? ??????</button><br>
                        <p class="message" id="tel_message"></p>

                        <input type="text" placeholder="???????????? ???????????????">
                        <p class="message" id="self_check_message"></p>

                        <input id="submit" type="button" value="????????????" onclick="validateAll()">
                    </form>
                </div>
            </article>
        </section>
        <section id="sec3"></section>
    </div>

    <script src="join_inputPro.js"></script>
</body>

</html>