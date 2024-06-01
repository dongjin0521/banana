<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
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
        .details {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-bottom: 20px;
            display: none;
            flex-direction: column;
            align-items: center;
        }
        .details img {
            width: 100px;
            height: 100px;
            border-radius: 10px;
        }
        .details .title {
            font-size: 20px;
            font-weight: bold;
            color: #000;
            margin-top: 10px;
        }
        .details .username {
            font-size: 18px;
            font-weight: bold;
            color: #DDCA24;
            margin-top: 5px;
        }
        .comment-section {
            flex: 1;
            width: 100%;
            display: flex;
            flex-direction: column;
        }
        .comment-item {
            box-shadow: 0px 0px 20px 0px rgba(0,0,0,0.052);
            border-radius: 8px;
            background-color: #FFFFFF;
            margin-bottom: 6px;
            padding: 14px 16px;
            display: flex;
            align-items: center;
        }
        .comment-item .content {
            flex: 1;
            margin-left: 10px;
        }
        .comment-item .content .comment {
            font-size: 14px;
            color: #212121;
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
<div class="container">
    <div class="scrollable">
        <div class="chat-item">
            <img src="images/rectangle_298.jpeg" alt="프로필 이미지">
            <div class="content">
                <div class="title">안먹는 콜라 나눔합니다.</div>
                <div class="username">전동환</div>
            </div>
            <div class="button" onclick="showDetails('images/rectangle_298.jpeg', '안먹는 콜라 나눔합니다.', '전동환')"></div>
        </div>
        <!-- 반복되는 chat-item 생략 -->
    </div>
    <div class="details" id="details">
        <img id="detailImg" src="" alt="이미지">
        <div class="title" id="detailTitle"></div>
        <div class="username" id="detailUsername"></div>
    </div>
    <div class="comment-section">
        <div class="comment-form">
            <input type="text" id="commentInput" placeholder="댓글을 입력하세요">
            <button onclick="addComment()">등록</button>
        </div>
    </div>
    <!-- '뒤로가기' 버튼-->
    <a href='javascript:history.back()' class="back-button">back</a>
</div>
</body>
<script>
    function showDetails(img, title, username) {
        document.getElementById('detailImg').src = img;
        document.getElementById('detailTitle').innerText = title;
        document.getElementById('detailUsername').innerText = username;
        document.getElementById('details').style.display = 'flex';
    }

    function addComment() {
        var commentInput = document.getElementById('commentInput');
        var commentText = commentInput.value.trim();
        if (commentText !== '') {
            var commentSection = document.querySelector('.comment-section');
            var newComment = document.createElement('div');
            newComment.classList.add('comment-item');
            newComment.innerHTML = '<div class="content"><div class="comment">' + commentText + '</div></div>';
            commentSection.insertBefore(newComment, commentSection.lastElementChild);
            commentInput.value = '';
        }
    }
</script>
</html>
