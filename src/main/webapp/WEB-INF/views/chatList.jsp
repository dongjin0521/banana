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
        .header {
            background-color: #ffffff;
            padding: 54px 16px 33px;
            color: #000000;
            font-weight: bold;
            font-size: 24px;
            margin-bottom: 8px;
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
        채팅목록</div>
    <div class="scrollable">
        <div class="chat-item">
            <img src="images/rectangle_298.jpeg" alt="프로필 이미지">
            <div class="content">
                <div class="title">안먹는 콜라 나눔합니다.</div>
                <div class="username">전동환</div>
            </div>
            <div class="button" onclick="navigateToChat('chatDetail.jsp?id=1')"></div>
        </div>
        <div class="chat-item">
            <img src="images/rectangle_298.jpeg" alt="프로필 이미지">
            <div class="content">
                <div class="title">파슬리 조금만 나눠주실분 구합니다.</div>
                <div class="username">송희준</div>
            </div>
            <div class="button" onclick="navigateToChat('chatDetail.jsp?id=2')"></div>
        </div>
        <div class="chat-item">
            <img src="images/rectangle_298.jpeg" alt="프로필 이미지">
            <div class="content">
                <div class="title">냉동식품 ~24/7 해외출장 나눔합니다.</div>
                <div class="username">정해찬</div>
            </div>
            <div class="button" onclick="navigateToChat('chatDetail.jsp?id=3')"></div>
        </div>
        <div class="chat-item">
            <img src="images/rectangle_298.jpeg" alt="프로필 이미지">
            <div class="content">
                <div class="title">양배추 남는거 있으신 분?</div>
                <div class="username">이동진</div>
            </div>
            <div class="button" onclick="navigateToChat('chatDetail.jsp?id=4')"></div>
        </div>
        <div class="chat-item">
            <img src="images/rectangle_298.jpeg" alt="프로필 이미지">
            <div class="content">
                <div class="title">냉동식품 ~24/7 해외출장 나눔합니다.</div>
                <div class="username">정해찬</div>
            </div>
            <div class="button" onclick="navigateToChat('chatDetail.jsp?id=3')"></div>
        </div>
        <div class="chat-item">
            <img src="images/rectangle_298.jpeg" alt="프로필 이미지">
            <div class="content">
                <div class="title">냉동식품 ~24/7 해외출장 나눔합니다.</div>
                <div class="username">정해찬</div>
            </div>
            <div class="button" onclick="navigateToChat('chatDetail.jsp?id=3')"></div>
        </div>
        <div class="chat-item">
            <img src="images/rectangle_298.jpeg" alt="프로필 이미지">
            <div class="content">
                <div class="title">냉동식품 ~24/7 해외출장 나눔합니다.</div>
                <div class="username">정해찬</div>
            </div>
            <div class="button" onclick="navigateToChat('chatDetail.jsp?id=3')"></div>
        </div>
        <div class="chat-item">
            <img src="images/rectangle_298.jpeg" alt="프로필 이미지">
            <div class="content">
                <div class="title">냉동식품 ~24/7 해외출장 나눔합니다.</div>
                <div class="username">정해찬</div>
            </div>
            <div class="button" onclick="navigateToChat('chatDetail.jsp?id=3')"></div>
        </div>
        <div class="chat-item">
            <img src="images/rectangle_298.jpeg" alt="프로필 이미지">
            <div class="content">
                <div class="title">냉동식품 ~24/7 해외출장 나눔합니다.</div>
                <div class="username">정해찬</div>
            </div>
            <div class="button" onclick="navigateToChat('chatDetail.jsp?id=3')"></div>
        </div>
        <div class="chat-item">
            <img src="images/rectangle_298.jpeg" alt="프로필 이미지">
            <div class="content">
                <div class="title">냉동식품 ~24/7 해외출장 나눔합니다.</div>
                <div class="username">정해찬</div>
            </div>
            <div class="button" onclick="navigateToChat('chatDetail.jsp?id=3')"></div>
        </div>
        <div class="chat-item">
            <img src="images/rectangle_298.jpeg" alt="프로필 이미지">
            <div class="content">
                <div class="title">냉동식품 ~24/7 해외출장 나눔합니다.</div>
                <div class="username">정해찬</div>
            </div>
            <div class="button" onclick="navigateToChat('chatDetail.jsp?id=3')"></div>
        </div>
        <div class="chat-item">
            <img src="images/rectangle_298.jpeg" alt="프로필 이미지">
            <div class="content">
                <div class="title">냉동식품 ~24/7 해외출장 나눔합니다.</div>
                <div class="username">정해찬</div>
            </div>
            <div class="button" onclick="navigateToChat('chatDetail.jsp?id=3')"></div>
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
            data: {/* Any additional parameters you want to send */

            },
            success: function(response) {
                var productList = response;
                console.log(productList);
                // Loop through the product list and generate HTML for each product card
                productList.forEach(function(product) {
                    var productCardHtml = '<div class="product-card item" id="' + product["id"] + '" >';
                    productCardHtml += '<img class="delivery-img" src="' + product["image"] + '" alt="' + product["title"] + '">';
                    productCardHtml += '<div class="header"><p>' + product["title"] + '</p></div>';
                    productCardHtml += '<div class="description">' + product["description"] + '</div>';
                    productCardHtml += '<div class="meta">' + product["loc1"] + " "  + product["loc2"] + " " + product["name"] + '</div>';
                    productCardHtml += '</div>';

                    $('#product-list').append(productCardHtml);
                });
            },
            error: function(xhr, status, error) {
                console.error("ajax 호출 error 발생");
            }
        });
    });
</script>
</html>
