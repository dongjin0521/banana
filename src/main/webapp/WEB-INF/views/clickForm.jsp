<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/2f8ed7d291.js" crossorigin="anonymous"></script>
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
            min-width: 500px;
            max-height: 700px;
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
            width: 100%;
            height: 100%;
            object-fit: cover;
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
            max-height: calc(50vh - 280px);
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
            font-weight: bold;
            font-size: 15px;
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
    <div id="imageArea"></div>
    <div class="post-info">
        <div class="post-title-text" id="title"></div>
        <div class="post-details">
            <span class="post-remaining-time" id="remainingTime">2일남음</span>
            <span class="post-location" id="loc"></span>
        </div>
    </div>
    <div class="user-info">
        <div class="user-details">
            <i class="fa-solid fa-user" style="font-size: 1.5rem;margin-right: 10px;margin-top: 5px"></i>
            <span id="userId" class="user-name"></span>
        </div>
    </div>
    <div class="post-content">
        <p id="description"></p>
    </div>
    <a href="#" class="chat-button" id="chatButton">채팅하기</a>
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
            data: {
                id : postId
            },
            success: function(response) {
                var productList = response;
                console.log(productList[0]);
                $("#title").text(productList[0].title);
                $("#loc").text(productList[0].loc1 + " " + productList[0].loc2);
                $("#userId").text(productList[0].user_id);
                $("#description").text(productList[0].description);


                var productCardHtml = '<img  width="400px" height="300px"  src="/image/' + productList[0].img_name +'"/>';
                $('#imageArea').append(productCardHtml);
                // 채팅 페이지 URL 설정
                var chatFormURL = "/chatForm?id=" + postId; // 예시 URL
                $("#chatButton").attr("href", chatFormURL);
            },
            error: function(xhr, status, error) {
                console.error("ajax 호출 error 발생");
            }
        });
    });
</script>
</body>
</html>
