<!-- /WEB-INF/views/delivery/getDeliveryList.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delivery List</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css">
    <style>
        body {
            display: grid;
            grid-template-rows: 4fr 9fr 2fr;
            margin: 0;
            padding: 0;
            font-family: 'Droid Sans', sans-serif;
            height: 100vh;
            grid-template-columns: 1fr;
            grid-gap: 1rem;
            overflow-y: hidden;
        }

        .search_grid {
            display: flex;
            flex-direction: column;
            align-items: center;
            background: #DDCA24;
            grid-row: 1/2;
            grid-column: 1/2;
            z-index: 1000;
            position: sticky;
        }

        .search_title {
            color: white;
            font-weight: bold;
            font-size: 3.5vw;
            align-self: flex-start;
        }

        .search_box {
            display: flex;
            align-items: center;
            width: 80%;
            background: white;
            border-radius: 25px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .search_box input[type="search"] {
            border: none;
            outline: none;
            width: 100%;
            padding: 10px;
            font-size: 1em;
            border-radius: 25px;
        }

        .location_select {
            display: flex;
            justify-content: center;
            margin-top: 10px;
        }

        .location_select select {
            border: none;
            outline: none;
            padding: 10px;
            font-size: 1em;
            border-radius: 25px;
            margin-right: 10px;
            background: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .search_box label {
            display: none;
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
            width: 80vw;
            height: 50vh;
        }
        .menu_bar {
            background-color: #DDCA24;
            grid-row: 3/4;
            grid-column: 1/2;
            position: sticky;
            z-index: 1000;
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            grid-template-rows: 1fr;
        }

        .menu_bar .img-button {
            background: url("img/moveDelivery-removebg-preview.png") no-repeat;
            width: 100%;
            height: 100%;
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
    </style>
</head>
<body>
<div class="search_grid">
    <p class="search_title font-DroidSans">바나나</p>
    <div class="search_box">
        <label for="search" class="visually-hidden">검색</label>
        <input type="search" id="search" placeholder="지금 먹고 싶은 음식이 있나요?">
        <button id="search-button" type="button" style="background: none; border: none;">
            <i class="search icon"></i>
        </button>
    </div>
    <div class="location_select">
        <label for="big_location" class="visually-hidden"></label>
        <select id="big_location">
            <option value="daegu">대구</option>
            <!-- Add more options as needed -->
        </select>
        <label for="small_location" class="visually-hidden"></label>
        <select id="small_location">
            <option value="none">지역선택</option>
            <!-- Add more options as needed -->
        </select>
    </div>
</div>
<div class="product_grid">
    <div style="display:grid; grid-template-columns: 1fr; place-items: center; column-gap: 1rem" class="row" id="product-list">
        <!-- Product cards will be appended here -->
    </div>
</div>
<div class="menu_bar">
    <input type="button" class="img-button">
    <input type="button" class="img-button">
    <input type="button" class="img-button">
    <input type="button" class="img-button">
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
                loc1 : "대구"
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

    $('#big_location').change(function() {
        var selectedValue = $(this).val();
        $.ajax({
            url: 'https://example.com/api/location',
            type: 'GET',
            dataType: 'json',
            data: { loc1: selectedValue },
            success: function(response) {
                console.log(response);

            },
            error: function(xhr, status, error) {
                console.error('Error: ' + error);
            }
        });
    });

    $('#search-button').click(function() {
        var searchQuery = $('#search').val();
        $.ajax({
            url: 'https://example.com/api/search',
            type: 'GET',
            dataType: 'json',
            data: { title: searchQuery },
            success: function(response) {
                console.log(response);
                // 받은 데이터를 처리하는 코드 추가
            },
            error: function(xhr, status, error) {
                console.error('Error: ' + error);
            }
        });
    });


    $(document).on('click', '.item', function() {
        //동적으로 생성된 객체에는 on 사용
        console.log("눌린 게시글 key: " + this.id);
        window.location.href = 'clickForm?id=' + this.id;
    });

</script>
