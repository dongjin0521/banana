<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>로그인 페이지</title>
    <style>
        .login .password {
            word-break: break-word;
            font-family: 'Montserrat', sans-serif;
            font-weight: normal;
            font-size: 18px;
            letter-spacing: -0.4px;
            color: #FFFFFF;
        }
        .bg-custom {
            background-color: #DDCA24;
            max-width: 400px;
            max-height: 700px;
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
            margin-top: 10px;
        }
        .p-custom {
            padding: 14px 14.5px 700px 32px;
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
    </style>
</head>
<body>
<div class="bg-custom flex flex-col items-center p-custom box-sizing-border">
    <div class="bg-custom absolute left-0 top-0 right-0 bottom-0 h-full"></div>
    <div class="inline-block font-DroidSans font-medium text-18  text-white" style="margin-top: 300px;">
        바나나에 오신것을 환영합니다.
    </div>
    <div class="rounded-24 border-white box-sizing-border" style="margin-top: 100px">
            <span class="break-words font-DroidSans font-normal text-18  text-white" style="margin-left: 10px">
                id
            </span>
    </div>
    <div class="rounded-24 border-white  box-sizing-border">
            <span class="break-words font-DroidSans font-normal text-18  text-white" style="margin-left: 10px">
                Password
            </span>
    </div>

    <div class="rounded-24 bg-white  box-sizing-border">
            <span class="break-words font-DroidSans font-medium text-[16px]  text-green">
                Login
            </span>
    </div>
    <div class="font-DroidSans font-normal text-18  text-white">
        비밀번호를 잊으셨나요?
    </div>

    <span class="break-words font-DroidSans font-semibold text-18  text-white">
            회원가입
        </span>
</div>
</body>
</html>