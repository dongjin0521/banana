<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<script src="https://kit.fontawesome.com/d07e833750.js" crossorigin="anonymous"></script>
<html>
<head>
    <title>채팅 리스트</title>
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
        .header {
            background-color: #ffffff;
            padding: 24px 16px 24px;
            color: #000000;
            font-weight: bold;
            font-size: 24px;
            margin-bottom: 8px;
            border-bottom: 2px solid #DDCA24; /* 경계선 추가 */
        }
        .chat-item {
            box-shadow: 0px 0px 20px 0px rgba(0,0,0,0.052);
            border-radius: 8px;
            background-color: #FFFFFF;
            margin-bottom: 6px;
            padding: 14px 16px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .chat-item img {
            width: 37px;
            height: 37px;
            border-radius: 5px;
        }
        .chat-item .content {
            flex: 1;
            margin-left: 10px;
        }
        .chat-item .content .title {
            font-size: 14px;
            font-weight: 500;
            color: #212121;
            margin-bottom: 3px;
        }
        .chat-item .content .username {
            font-size: 16px;
            font-weight: bold;
            color: #DDCA24;
        }
        .chat-item .button {
            width: 20px;
            height: 20px;
            background-color: #33ff33;
            border-radius: 50%;
            cursor: pointer;
        }
        .scrollable {
            height: calc(100vh - 130px); /* Adjust based on header and padding */
            overflow-y: auto; /* 스크롤바 추가 */
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <i class="fas fa-align-justify"></i>
        채팅목록</div>
    <div class="scrollable" id="allChats">

        <div class="chat-item">
            <img src="images/rectangle_298.jpeg" alt="프로필 이미지">
            <div class="content">
                <div class="title">파슬리 조금만 나눠주실분 구합니다.</div>
                <div class="userId">송희준</div>
            </div>
            <div class="button" onclick=""></div>
        </div>

    </div>
</div>
</body>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function() {
        $.ajax({
            type: "POST",
            url: "/chat/getChatAll",
            data: {},
            success: function(response) {
                console.log(response);
                var chats = response;
                var allChats = $('#allChats');

                allChats.empty(); // Clear existing chat items

                chats.forEach(function(chat) {
                    var chatItem =
                        '<div class="chat-item" data-chat-id="' + chat["id"] + '">' +
                        '<img src="images/rectangle_298.jpeg" alt="프로필 이미지">' +
                        '<div class="content">' +
                        '<div class="title">' + chat["title"] + '</div>' +
                        '<div class="userId">' + chat["user_id"] + '</div>' +
                        '</div>' +
                        '<div class="button"></div>' +
                        '</div>';
                    allChats.append(chatItem);
                });

                $('.chat-item').on('click', function() {
                    var chatId = $(this).data('chat-id');
                    alert($(this).data('chat-id'))
                    window.location.href = 'chatForm?id=' + chatId;
                });
            },
            error: function(xhr, status, error) {
                console.error("ajax 호출 error 발생함.");
            }
        });
    });
</script>

