<!-- /WEB-INF/views/delivery/getDeliveryList.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Delivery List</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css">
    <style>
        /* Add your custom CSS styles here */
        .product-card {
            /* Style for product card */
        }
    </style>
</head>
<body>
<div class="ui grid">
    <div class="row" id="product-list">
        <!-- Product cards will be appended here -->
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function() {
        $.ajax({
            type: "POST",
            url: "/delivery/getDeliveryList",
            data: {/* Any additional parameters you want to send */},
            success: function(response) {
                var productList = response;
                console.log(productList);
                // Loop through the product list and generate HTML for each product card
                productList.forEach(function(product) {
                    var productCardHtml = '<div class="four wide column product-card">';
                    productCardHtml += '<div class="ui card">';
                    productCardHtml += '<div class="content">';
                    productCardHtml += '<div class="header">' + product["title"] + '</div>';
                    productCardHtml += '<div class="description">' + product["description"] + '</div>';
                    productCardHtml += '<div class="meta">' + product["loc1"] + " "  + product["loc2"] + '</div>';
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
    });
</script>
</body>
</html>
