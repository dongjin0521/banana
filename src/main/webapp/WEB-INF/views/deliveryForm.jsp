<!-- /WEB-INF/views/delivery/getDeliveryList.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Delivery List</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css">
    <style>
        /* Add your custom CSS styles here */
        body {
            display:grid;
            grid-template-rows: 2fr 5fr 1fr;
            grid-template-columns: 1fr;
        }
        .product_grid {
            grid-row:2/3;
        }

        .search_box {
            background: #DDCA24;
            grid-row:1/2;
            font-size:1vw;
        }
        .product-card {
            /* Style for product card */
        }
        .font-DroidSans {
            font-family: 'Droid Sans', sans-serif;
        }

        .menu_bar {
            background:#DDCA24;
            grid-row:3/4;
        }
    </style>
</head>
<body>
<div class="search_box">
    <p class="font-DroidSans" style="color:white; font-weight:bold; font-size:3vw">바나나</p>
    <label>검색<input type="search"></label>
    <label for="big_location"></label>
    <select id="big_location">
        <option value="daegu">대구</option>
    </select>
    <label for="small_location"></label>
    <select id="small_location">
        <option value="none">지역선택</option>
    </select>
</div>
<div class="ui grid product_grid">
    <div class="row" id="product-list">
        <!-- Product cards will be appended here -->
    </div>
</div>
<div class="menu_bar"></div>

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
                    var productCardHtml = '<div class="four wide column product-card">';
                    productCardHtml += '<div id='+product["id"]+' class=item>';
                    productCardHtml += '<div class="ui card">';
                    productCardHtml += '<div class="content">';
                    productCardHtml += '<div class="header">' + product["title"] + '</div>';
                    productCardHtml += '<div class="description">' + product["description"] + '</div>';
                    productCardHtml += '<div class="meta">' + product["loc1"] + " "  + product["loc2"] + '</div>';
                    productCardHtml += '</div>';
                    productCardHtml += '</div>';
                    productCardHtml += '</div>';
                    productCardHtml += '</div>';

                    $('#product-list').append(productCardHtml);
                });
            },
            error: function(xhr, status, error) {
                console.error("ajax 호출 error 발생");
            }
        });

        $(document).on('click', '.item', function() {
            //동적으로 생성된 객체에는 on 사용
            console.log("눌린 게시글 key: " + this.id);
            window.location.href = 'clickForm?id=' + this.id;
        });
    });
</script>
</body>
</html>
