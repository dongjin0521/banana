<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <%--    jquery(ajax)--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

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

<script type="text/javascript">
    $(document).ready(function(){
        //jquery 는 js를 쉽게 쓸 수 있도록 도와주는 라이브러리입니다. 대표적으로 $ 가 있음. head 밑에 jquery 사용을 위한 태그를 추가해놓았으니 참고해서 다른 파일에도 사용해 주세요.
        // console.log("F12 를 눌러보세요. 디버깅 및 테스트용도로 사용");
        // alert("이 기능은 alert 입니다. 로그인 실패시 java throw exception 사용하면 되어서 그런 알림까지는 구현할 필요 없습니다.");

        //달러 안에 선택자를 넣어서 활용하시면 됩니다. #은 id .은 클래스 지정 문자 입니다. 가급적이면 유일한 컴포넌트는 html 에 id 속성 주고 사용
        //ajax 는 백엔드와 통신하는 기능입니다.
        //아래는 이벤트 함수지만, 페이지 열때 무조건 한번 실행하려면 그냥 바깥 맨위에 두면 되겠죠?

        //html 태그로는 input(입력), button(버튼) 등 사용

        $("#loginButton").click(function(){
            $.ajax({
                url: 'myServlet', // 자바 컨트롤러에 호출할 url
                type: 'GET',
                success: function(response) {
                    $("#result").html(response);
                },
                error: function() {
                    alert("AJAX 요청 중 오류 발생");
                }
            });
        });

        $("#yourButton").click(function(){
            if(1==1){
                alert("버튼이 눌렸네요!");
            }
        });



    });
</script>