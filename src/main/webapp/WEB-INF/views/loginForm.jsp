<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <title>로그인 페이지</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #DDCA24; /* 배경색을 노란색으로 설정 */
        }
        .bg-custom {
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            max-width: 400px;
            max-height: 700px;
            padding: 20px;
            border-radius: 24px;
            box-sizing: border-box;
            background-color: #DDCA24; /* 배경색을 노란색으로 설정 */
        }
        .text-white {
            color: #FFFFFF;
        }
        .text-green {
            color: #13B58C;
        }
        .rounded-24 {
            border-radius: 24px;
        }
        .border-white {
            border: 1px solid #FFFFFF;
        }
        .box-sizing-border {
            box-sizing: border-box;
        }
        .inline-block {
            display: inline-block;
        }
        .font-DroidSans {
            font-family: 'Droid Sans', sans-serif;
        }
        .font-medium {
            font-weight: 500;
        }
        .font-normal {
            font-weight: 400;
        }
        .font-semibold {
            font-weight: 600;
        }
        .text-18 {
            font-size: 18px;
        }
        .text-24 {
            font-size: 24px;
        }
        .login-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 20px; /* 전체 폼의 위치 조정 */
        }
        .login-field {
            margin-top: 40px; /* 각 필드 간의 간격 조정 */
            width: 100%;
        }
        .login-button {
            cursor: pointer;
            margin-top: 30px; /* 로그인 버튼의 위치 조정 */
        }
        input[type="text"], input[type="password"] {
            width: calc(100% - 20px);
            background: transparent;
            border: none;
            color: #FFFFFF;
            padding: 10px;
            font-size: 18px;
        }
        @media (max-width: 768px) {
            .text-18 {
                font-size: 16px;
            }
            .login-field {
                margin-top: 15px;
            }
            .login-button {
                margin-top: 20px;
            }
        }
        @media (max-width: 480px) {
            .text-18 {
                font-size: 14px;
            }
            .login-field {
                margin-top: 10px;
            }
            .login-button {
                margin-top: 15px;
            }
        }
        .welcome-text{
            font-size: 25px;
            margin-top: 75px;
        }
    </style>
</head>
<body>
<div class="bg-custom">
    <div class="inline-block font-DroidSans font-medium text-18 text-white welcome-text">
        바나나에 오신것을 환영합니다.
    </div>

    <!-- 이름 가입 필드  -->
    <div class="rounded-24 border-white box-sizing-border login-field userName">
        <input type="text" id="userName" placeholder="username">
    </div>

    <!-- 주소1 가입 필드  -->
    <div class="rounded-24 border-white box-sizing-border login-field loc1">
        <input type="text" id="loc1" placeholder="도시">
    </div>

    <!-- 주소2 가입 필드  -->
    <div class="rounded-24 border-white box-sizing-border login-field loc2">
        <input type="text" id="loc2" placeholder="구">
    </div>


    <!-- ID 입력 필드  -->
    <div class="rounded-24 border-white box-sizing-border login-field">
        <input type="text" id="id" placeholder="ID">
    </div>

    <!-- Password 입력 필드 -->
    <div class="rounded-24 border-white box-sizing-border login-field">
        <input type="password" id="password" placeholder="Password">
    </div>

    <!-- 로그인 버튼 -->
    <div id="loginButton" class="rounded-24 bg-white box-sizing-border login-button">
        <span class="break-words font-DroidSans font-medium text-16 text-green">
            Login
        </span>
    </div>

<%--    <div class="font-DroidSans font-normal text-18 text-white" style="margin-top: 20px;">--%>
<%--        비밀번호를 잊으셨나요?--%>
<%--    </div>--%>
    <span class="break-words font-DroidSans font-semibold text-18 text-white" style="margin-top: 10px;">
        <button id="joinButton" style="background: transparent;border: transparent">회원가입</button>
    </span>

    <span class="break-words font-DroidSans font-semibold text-18 text-white addUser" style="margin-top: 10px;">
        <button id="addUser" style="background: transparent;border: transparent">등록</button>
    </span>
</div>
</body>
</html>

<script type="text/javascript">
    $(document).ready(function(){

        $(".userName").hide();
        $(".addUser").hide();
        $(".loc1").hide();
        $(".loc2").hide();

        $("#loginButton").click(function(){
            $.ajax({
                url: '/login/Login',
                type: 'POST',
                data: {
                    id: $("#id").val(),
                    password: $("#password").val()
                },
                success: function(response) {
                    console.log(response);
                    if(response!="" && response!= null){
                        alert("로그인 성공!");
                        window.location.href = "deliveryForm";
                    }else{
                        alert("로그인 실패. 아이디 또는 비밀번호를 다시 확인하세요.")
                    }
                },
                error: function() {
                    alert("AJAX 요청 중 오류 발생");
                }
            });
        });

        $("#joinButton").click(function(){
            $(".userName").show();
            $("#joinButton").hide();
            $("#loginButton").hide();
            $(".addUser").show();
            $(".loc1").show();
            $(".loc2").show();
        });

        $("#addUser").click(function(){
            $.ajax({
                url: '/login/addUser',
                type: 'POST',
                data: {
                    loc1: $("#loc1").val(),
                    loc2: $("#loc2").val(),
                    userName: $("#userName").val(),
                    id: $("#id").val(),
                    password: $("#password").val()
                },
                success: function(response) {
                    console.log(response);
                    if(response!="" && response!= null){
                        alert("회원가입 성공! 새로 로그인해주세요.");
                        window.location.href = "loginForm";
                    }else{
                        alert("회원가입 실패. 아이디 중복 또는 빈 항목이 없는지 확인하세요.")
                    }
                },
                error: function() {
                    alert("회원가입 실패. 아이디 중복 또는 빈 항목이 없는지 확인하세요.");
                }
            });
        });
    });
</script>