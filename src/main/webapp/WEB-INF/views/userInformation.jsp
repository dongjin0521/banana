<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>내 정보</title>
    <script src="https://kit.fontawesome.com/d07e833750.js" crossorigin="anonymous"></script>
    <style>
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #DDCA24;
        }
        .container {
            max-width: 1000px;
            margin: 0 auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            height: 800px;
            min-width: 500px; /* 최소 너비 추가 */
            max-height: 700px; /* 최대 높이 추가 */
        }
        .back-button {
            position: absolute;
            top: 10px;
            left: 10px;
            padding: 7px 10px;
            background-color: #ffffff;
            color: #DDCA24;
            text-decoration: none;
            border: none;
            border-radius: 5px;
            font-size: 20px;
            cursor: pointer;
        }
        .header {
            background-color: #DDCA24;
            padding: 54px 16px 33px 16px;
            margin-bottom: 14px;
            text-align: left;
            border-radius: 10px 10px 0 0;
        }
        .header span {
            font-weight: bold;
            font-size: 24px;
            color: #FFFFFF;
        }
        .profile {
            margin: 0 26px;
            display: flex;
            flex-direction: row;
            align-items: center;
            background-color: #f1f1f1;
            padding: 10px;
            border-radius: 8px;
        }
        .profile i {
            margin-right: 15px;
            font-size: 40px;
            color: #DDCA24;
        }
        .profile-info {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }
        .profile-info .username {
            font-size: 20px;
            color: black;
            opacity: 0.8;
        }
        .content {
            flex: 1;
            background-color: #FFFFFF;
            border-radius: 8px;
            box-shadow: 0px 0px 20px 0px rgba(0, 0, 0, 0.052);
            padding: 18px 21px 24px 17.5px;
            display: flex;
            flex-direction: column;
            overflow-y: auto; /* Enable scrolling if content overflows */
        }
        .content div {
            font-size: 14px;
            color: #4F4F4F;
            margin-bottom: 10.5px;
        }
        .content img {
            width: 100%;
            height: 1px;
            margin-bottom: 10.5px;
        }
        .logout {
            font-size: 14px;
            color: #DDCA24;
            margin-top: 20px;
            cursor: pointer; /* Change cursor to pointer for better UX */
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <span>내 정보</span>
    </div>
    <div class="profile">
        <i class="fa-solid fa-user"></i>
        <div class="profile-info">
            <span class="username"><%= (String) session.getAttribute("userId") %></span>
        </div>
    </div>
    <div class="content">
        <div>계정 / 정보관리</div>
        <img src="../assets/vectors/line_copy_1_x2.svg" alt="line">
        <div>언어</div>
        <img src="../assets/vectors/line_copy_3_x2.svg" alt="line">
        <div>문의사항</div>
        <img src="../assets/vectors/line_copy_4_x2.svg" alt="line">
        <div>친구에게 추천하기</div>
        <img src="../assets/vectors/line_copy_x2.svg" alt="line">
        <div>약관 및 정책</div>
        <img src="../assets/vectors/line_copy_2_x2.svg" alt="line">
        <a href="/loginForm" class="logout">로그아웃</a>
    </div>
    <a href='javascript:history.back()' class="back-button">back</a>
</div>
</body>
</html>
