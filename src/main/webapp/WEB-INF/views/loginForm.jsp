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

    <div class="font-DroidSans font-normal text-18 text-white" style="margin-top: 20px;">
        비밀번호를 잊으셨나요?
    </div>
    <span class="break-words font-DroidSans font-semibold text-18 text-white" style="margin-top: 10px;">
        회원가입
    </span>
</div>
</body>
</html>

<script type="text/javascript">
    $(document).ready(function(){
        $("#loginButton").click(function(){
            var id = $("#id").val();
            var password = $("#password").val();
            $.ajax({
                url: '/myServlet',
                type: 'GET',
                data: {
                    id: id,
                    password: password
                },
                success: function(response) {
                    $("#result").html(response);
                },
                error: function() {
                    alert("AJAX 요청 중 오류 발생");
                }
            });
        });
    });
</script>