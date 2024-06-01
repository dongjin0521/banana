<!-- /WEB-INF/views/delivery/getDeliveryList.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<script src="https://kit.fontawesome.com/2f8ed7d291.js" crossorigin="anonymous"></script>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delivery List</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css">
    <style>
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #DDCA24;
            overflow-y: hidden;
        }

        .container {
            display: grid;
            grid-template-rows: 3fr 10fr 2fr;
            margin: 0;
            padding: 0;
            font-family: 'Droid Sans', sans-serif;
            grid-template-columns: 1fr;
            max-width: 1000px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);

            height: 800px;
            min-width: 500px; /* 최소 너비 추가 */
            max-height: 700px; /* 최대 높이 추가 */
        }

        .container > div {
            margin: 5px;
        }
        .search_grid {
            display: flex;
            flex-direction: column;
            align-items: center;
            background: white;
            grid-row: 1/2;
            grid-column: 1/2;
            z-index: 1000;
            position: sticky;
            border-radius: 10px 10px 0 0;
            padding-top: 15px;
        }

        .title_icon {
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

        .search_box {
            display: flex;
            align-items: center;
            width: 80%;
            background: #DDCA24;
            border-radius: 25px;
            padding: 1rem;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .search_box input[type="search"] {
            border: none;
            outline: none;
            width: 100%;
            padding: 0.5rem;
            font-size: 1em;
            border-radius: 25px;
            background: #DDCA24;
            background-clip: border-box;

        }

        .location_select select {
            border: none;
            outline: none;
            padding: 0.8rem;
            font-size: 1rem;
            border-radius: 25px;
            margin-right: 1.5rem;
            background: #DDCA24;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .search_box label {
            display: none;
        }

        .action_buttons {
            display: flex;
            justify-content: space-around; /* 공간을 고르게 분배 */
            width: 80%; /* 버튼 그룹의 너비 */
            margin-top: 1rem; /* 상단 여백 추가 */
        }

        .action_buttons select,
        .action_buttons input {
            flex: 1; /* 버튼과 선택 박스가 균등하게 공간을 차지하도록 설정 */
            margin: 0 0.5rem; /* 좌우 여백 */
            height: 3rem;
            background: darkgrey;
            border-radius: 15px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            color: white;
            border: none;
        }

        .product_grid {
            grid-row:2/3;
            grid-column: 1/2;
            overflow-y: scroll;
        }
        .product-card {
            /* Style for product card */
            display: grid;
            grid-template-columns: 1fr;
            grid-template-rows: 9fr 3fr 1fr 1fr;
            border: solid 1px black;
            border-radius: 10px;
            width: 90%;
            height: 80%;
        }
        .menu_bar {
            grid-row: 3/4;
            grid-column: 1/2;
            position: sticky;
            z-index: 1000;
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            grid-template-rows: 1fr;
            border-radius: 0 0 10px 10px;
        }

        .menu_bar button {
            border-radius: 35px;
            background-clip: border-box;
        }
        .product-card .delivery-img {
            grid-row:1/2;
            border-bottom: solid 1px black;
        }

        .product-card .header {
            font-size: 1rem;
            font-weight: 600;
            display: flex;
            align-items: center;
        }

        .product-card .despcription {
            font-size: 1rem;
        }

        .menu_bar button {
            background: #DDCA24;
            border-left: 0.5rem solid white;
            border-right: 0.5rem solid white;
            border-top: none;
            border-bottom: none;
        }
    </style>
</head>
<body>
<p class="title_icon font-DroidSans">바나나</p>
<div class="container">
<div class="search_grid">
    <div class="search_box">
        <label for="search" class="visually-hidden">검색</label>
        <input type="search" id="search">
        <button id="search-button" type="button" style="border: none; background: #DDCA24">
            <i class="search icon" style="color: white;"></i>
        </button>
    </div>
    <div class="action_buttons">
        <select id="big_location">
            <option value="대구">대구</option>
            <!-- Add more options as needed -->
        </select>
        <label for="small_location" class="visually-hidden"></label>
        <select id="small_location">
            <option value="">지역선택</option>
            <option value="중구">중구</option>
            <option value="동구">동구</option>
            <option value="서구">서구</option>
            <option value="남구">남구</option>
            <option value="북구">북구</option>
            <option value="수성구">수성구</option>
            <option value="달서구">달서구</option>
            <option value="달성군">달성군</option>
            <!-- Add more options as needed -->
        </select>
        <input type="button" id="moveDeliveryAdd" value="글쓰기">
    </div>
</div>
<div class="product_grid">
    <div style="display:grid; grid-template-columns: 1fr; place-items: center; column-gap: 1rem" class="row" id="product-list">
        <!-- Product cards will be appended here -->
    </div>
</div>
<div class="menu_bar">
    <button id="moveHome"><i class="fa-solid fa-house" style="font-size: 2rem; color: white; text-shadow: -1px 0px black, 0px 1px black, 1px 0px black, 0px -1px black;"></i></button>
    <button id="moveDelivery"><i class="fa-solid fa-motorcycle" style="font-size: 2rem; color: white; text-shadow: -1px 0px black, 0px 1px black, 1px 0px black, 0px -1px black;"></i></button>
    <button id="moveShare"><i class="fa-solid fa-basket-shopping" style="font-size: 2rem; color: white; text-shadow: -1px 0px black, 0px 1px black, 1px 0px black, 0px -1px black;"></i></button>
    <button id="moveMyPage"><i class="fa-solid fa-user" style="font-size: 2rem; color: white; text-shadow: -1px 0px black, 0px 1px black, 1px 0px black, 0px -1px black;"></i></button>
</div>
</div>
</body>
</html>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function() {
        $.ajax({
            type: "POST",
            url: "/delivery/getDeliveryList",
            data: {/* Any additional parameters you want to send */
                loc1 : $("#big_location").val(),
                loc2 : $("#small_location").val(),
                title : $("#search").val()
                },
            success: function(response) {
                var productList = response;
                console.log(productList);
                $('#product-list').empty();
                // Loop through the product list and generate HTML for each product card
                productList.forEach(function(product) {
                    var productCardHtml = '<div class="product-card item" id="' + product["id"] + '" >';
                    productCardHtml += '<img class="delivery-img" src="' + product["image"] + '" alt="' + product["title"] + '">';
                    productCardHtml += '<div class="header"><p>' + product["title"] + '</p></div>';
                    productCardHtml += '<div class="description">' + product["description"] + '</div>';
                    productCardHtml += '<div class="meta">' + product["loc1"] + " "  + product["loc2"] + '</div>';
                    productCardHtml += '</div>';

                    $('#product-list').append(productCardHtml);
                });
            },
            error: function(xhr, status, error) {
                console.error("ajax 호출 error 발생");
            }
        });
    });

    $('#search-button').click(function() {
        $.ajax({
            type: "POST",
            url: "/delivery/getDeliveryList",
            data: {/* Any additional parameters you want to send */
                loc1 : $("#big_location").val(),
                loc2 : $("#small_location").val(),
                title : $("#search").val()
            },
            success: function(response) {
                var productList = response;
                console.log(productList);
                $('#product-list').empty();
                // Loop through the product list and generate HTML for each product card
                productList.forEach(function(product) {
                    var productCardHtml = '<div class="product-card item" id="' + product["id"] + '" >';
                    productCardHtml += '<img class="delivery-img" src="' + product["image"] + '" alt="' + product["title"] + '">';
                    productCardHtml += '<div class="header"><p>' + product["title"] + '</p></div>';
                    productCardHtml += '<div class="description">' + product["description"] + '</div>';
                    productCardHtml += '<div class="meta">' + product["loc1"] + " "  + product["loc2"] + '</div>';
                    productCardHtml += '</div>';

                    $('#product-list').append(productCardHtml);
                });
            },
            error: function(xhr, status, error) {
                console.error("ajax 호출 error 발생");
            }
        });
    });


    $(document).on('click', '.item', function() {
        //동적으로 생성된 객체에는 on 사용
        console.log("눌린 게시글 key: " + this.id);
        window.location.href = 'clickForm?id=' + this.id;
    });

    $('#moveDelivery').click(function() {
        console.log("deliveryForm으로 이동");
        window.location.href = 'deliveryForm';
    });

    $('#moveShare').click(function() {
        console.log("share으로 이동");
        window.location.href = 'shareForm';
    });

    $('#moveMyPage').click(function() {
        console.log("userInformation으로 이동");
        window.location.href = 'userInformation';
    });

    $('#moveDeliveryAdd').click(function() {
        console.log("deliveryAdd으로 이동");
        window.location.href = 'deliveryAdd';
    });

    $('#moveHome').click(function () {
        console.log("ChatList로 이동");
        window.location.href = 'chatList';
    });
</script>
