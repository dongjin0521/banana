<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<script src="https://kit.fontawesome.com/d07e833750.js" crossorigin="anonymous"></script>
<html>
<head>
    <title>채팅</title>
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
        .post-button {
            background-color: #ffffff;
            padding: 14px 16px;
            color: #000000;
            font-weight: bold;
            font-size: 18px;
            margin-bottom: 8px;
            border: 2px solid #DDCA24;
            border-radius: 5px;
            display: flex;
            align-items: center;
            cursor: pointer;
            text-align: left;
        }
        .post-button img {
            width: 37px;
            height: 37px;
            border-radius: 5px;
        }
        .post-button .content {
            flex: 1;
            margin-left: 10px;
        }
        .post-button .content .title {
            font-size: 16px;
            font-weight: 500;
            color: #212121;
            margin-bottom: 3px;
        }
        .post-button .content .username {
            font-size: 14px;
            font-weight: bold;
            color: #DDCA24;
        }
        .chat-box {
            box-shadow: 0px 0px 20px 0px rgba(0,0,0,0.052);
            border-radius: 8px;
            background-color: #FFFFFF;
            padding: 14px 16px;
            height: calc(100% - 150px); /* Adjust based on post button and padding */
            overflow-y: auto; /* 스크롤바 추가 */
        }
        .chat-item {
            margin-bottom: 6px;
            padding: 10px;
            background-color: #f1f1f1;
            border-radius: 5px;
            display: flex;
            flex-direction: column;
        }
        .chat-item .username {
            font-size: 14px;
            font-weight: bold;
            color: #DDCA24;
        }
        .chat-item .message {
            font-size: 14px;
            color: #212121;
        }
        .comment-section {
            flex-shrink: 0;
            width: 100%;
            display: flex;
            flex-direction: column;
        }
        .comment-form {
            display: flex;
            margin-top: auto;
        }
        .comment-form input {
            flex: 1;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-right: 10px;
        }
        .comment-form button {
            padding: 10px 20px;
            border: none;
            background-color: #DDCA24;
            color: #fff;
            font-weight: bold;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<div id="chatList" data-id="${id}"></div>
<div class="container">
    <button class="post-button" onclick="window.location.href='/clickForm?id=${id}'">
        <i class="fa-solid fa-arrow-up"></i>
        <div class="content">
            <div class="title">게시글 보기</div>
        </div>
    </button>
    <div class="chat-box" id="chatBox">
        <!-- 채팅 아이템은 여기 추가됩니다 -->
    </div>
    <div class="comment-section">
        <div class="comment-form">
            <input type="text" id="commentInput" placeholder="댓글을 입력하세요">
            <button id="submit">등록</button>
        </div>
    </div>
    <!-- '뒤로가기' 버튼-->
    <a href='javascript:history.back()' class="back-button">back</a>
</div>
</body>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
    var productId = $("#chatList").data("id");
    $(document).ready(function() {
        function loadChat() {
            $.ajax({
                type: "POST",
                url: "/chat/getChat",
                data: {
                    id: productId
                },
                success: function(response) {
                    var chatList = response;
                    console.log(chatList);
                    $('#chatBox').empty(); // 기존 채팅 내용 비우기
                    if (chatList.length > 0) {
                        chatList.forEach(function(chat) {
                            var chatItemHtml = '<div class="chat-item">';
                            chatItemHtml += '<div class="username">' + chat["userId"] + '</div>';
                            chatItemHtml += '<div class="message">' + chat["message"] + '</div>';
                            chatItemHtml += '</div>';
                            $('#chatBox').append(chatItemHtml);
                        });
                    } else {
                        $('#chatBox').append('<div class="chat-item"><div class="message">채팅 내용이 없습니다.</div></div>');
                    }
                },
                error: function(xhr, status, error) {
                    console.error("ajax 호출 error 발생");
                }
            });
        }

        loadChat(); // 페이지 로드 시 처음 한번 실행
        setInterval(loadChat, 5000); // 5초마다 새로고침

        $("#submit").on("click", function() {
            var message = $("#commentInput").val();
            if (message.trim() !== "") {
                $.ajax({
                    type: "POST",
                    url: "/chat/insertChat",
                    data: {
                        message : message,
                        productId : productId
                    },
                    success: function(response) {
                        $("#commentInput").val(''); // 입력 필드 비우기
                        loadChat(); // 채팅 내용을 즉시 업데이트
                    },
                    error: function(xhr, status, error) {
                        console.error("ajax 호출 error 발생");
                    }
                });
            }
        });
    });
</script>
</html>
