<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <title>게시물 클릭 페이지</title>
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
        .post-image {
            width: 100%; /* 이미지 컨테이너의 너비를 꽉 채우도록 설정 */
            height: 100%; /* 이미지 컨테이너의 높이를 꽉 채우도록 설정 */
            object-fit: cover; /* 이미지를 늘리거나 줄여 부모 요소에 맞게 조정 */
            max-height: 25vh;
            border-radius: 10px 10px 0 0;
        }
        .post-info {
            padding: 16px 16px 25px;
            background-color: #ffffff;
            box-shadow: 0px 21px 43px 0px rgba(58,76,130,0.072);
            margin-bottom: 6px;
        }
        .post-title-text {
            margin: 0 0 10px;
            font-family: 'Montserrat', sans-serif;
            font-weight: bold;
            font-size: 18px;
            color: #4F4F4F;
        }
        .post-details {
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            width: 100%;
        }
        .post-remaining-time {
            margin-right: 11px;
            font-family: 'Montserrat', sans-serif;
            font-weight: bold;
            font-size: 18px;
            color: #DDCA24;
        }
        .post-location {
            margin: 4px 0 1px;
            font-family: 'Montserrat', sans-serif;
            font-weight: 500;
            font-size: 14px;
            color: #4F4F4F;
        }
        .post-content {
            padding: 50px;
            background-color: #ffffff;
            flex-grow: 1;
            max-height: calc(50vh - 280px); /* 컨테이너 높이의 절반에서 나머지 요소의 높이를 뺀 만큼의 최대 높이 */
        }
        .chat-button {
            display: block;
            width: 96%;
            padding: 15px;
            text-align: center;
            background-color: #DDCA24;
            color: #ffffff;
            text-decoration: none;
            border: none;
            border-radius: 20px;
            cursor: pointer;
            margin-top: auto;
            align-self: center;
            font-weight: bold; /* 폰트 굵게 설정 */
            font-size: 15px; /* 폰트 크기 설정 */
        }
        .user-info {
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            padding: 20px 16px;
            background-color: #ffffff;
            box-shadow: 0px 21px 43px 0px rgba(58,76,130,0.072);
            margin-bottom: 6px;
        }
        .user-details {
            display: flex;
            flex-direction: row;
        }
        .user-avatar {
            margin-right: 11px;
            width: 32px;
            height: 32px;
        }
        .user-name {
            margin: 8px 0 7px;
            font-family: 'Montserrat', sans-serif;
            font-weight: 500;
            font-size: 17px;
            color: #4F4F4F;
        }
    </style>

</head>
<body>

<div class="container">
    <!-- 상단에 해당 게시물의 이미지 -->
    <img src="post-image.jpg" alt="게시물 이미지" class="post-image">

    <!-- 게시물 제목과 남은 시간, 위치 정보 -->
    <div class="post-info">
        <div class="post-title-text" id="title"></div>
        <div class="post-details">
            <span class="post-remaining-time" id="remainingTime">2일남음</span>
            <span class="post-location" id="loc"></span>
        </div>
    </div>

    <!-- 게시자 정보 -->
    <div class="user-info">
        <div class="user-details">
            <img class="user-avatar" src="../assets/vectors/icon_avataravatar_2_x2.svg" />
            <span id="userId" class="user-name"></span>
        </div>
    </div>

    <!-- 게시자 글 내용 -->
    <div class="post-content">
        <p id="description"></p>
    </div>

    <!-- '채팅하기' 버튼 -->
    <a href="#" class="chat-button">채팅하기</a>

    <!-- '뒤로가기' 버튼-->
    <a href='javascript:history.back()' class="back-button">back</a>
</div>




<div id="deliveryList" data-id="${id}"></div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function() {
        var postId = $("#deliveryList").data("id");
        $.ajax({
            type: "POST",
            url: "/delivery/getDeliveryList",
            data: {/* Any additional parameters you want to send */
                id : postId  //게시글 primary key
            },
            success: function(response) {
                var productList = response;
                console.log(productList[0]);
                $("#title").text(productList[0].title);
                $("#loc").text(productList[0].loc1 +" "+ productList[0].loc2);
                $("#userId").text(productList[0].user_id);
                $("#description").text(productList[0].description);
            },
            error: function(xhr, status, error) {
                console.error("ajax 호출 error 발생");
            }
        });
    });
</script>
