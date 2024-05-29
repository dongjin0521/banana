<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <title>글 등록</title>
</head>
<body>
<div class ="topSide">
    <span class="tradly">
        상품 추가
    </span>

</div>

<div class="potoContainer">
    <div class="add-photos">
        Add photos
    </div>
</div>

<div class ="inputText">

    <div class ="quest">
        제목
    </div>
    <input class ="answer" id="title" type="text">

    <div class ="quest">
        CategoryProduct
    </div>
    <input class ="answer" id="categoryProduct" type="text">

    <div class ="quest">
        Price
    </div>
    <input class ="answer" id="price" type="text" placeholder="$">

    <div class ="quest">
        위치
    </div>
    <input class ="answer" id="loc1" type="text" placeholder="">

    <div class ="quest">
        글내용
    </div>
    <input class ="answer" id="description" type="text" placeholder="내용을 입력하세요">

    <button id="submit">등록</button>

</div>
<script type="text/javascript">
    $("#submit").on("click",function() {
        alert("눌림");
        $.ajax({
            type: "POST",
            url: "/delivery/insertDeliveryList",
            data: {/* Any additional parameters you want to send */
                title : $("#title").val(),
                categoryProduct : $("#categoryProduct").val(),
                price : $("#price").val(),
                loc1 : $("#loc1").val(),
                loc2 : $("#loc2").val(),
                description: $("#description").val()


            },
            success: function(response) {

            },
            error: function(xhr, status, error) {
                console.error("ajax 호출 error 발생");
            }
        });
    });
</script>
</body>
</html>

<style>
    .topSide {
        background: #DDCA24;
        position: relative;
        margin-bottom: 28px;
        display: flex;
        flex-direction: column;
        padding: 16px 14.7px 33px 19px;
        width: 100%;
        height: 150px;
        box-sizing: border-box;
    }
    .tradly {
        overflow-wrap: break-word;
        font-family: 'Montserrat';
        font-weight: 700;
        font-size: 24px;
        text-align: center;
        color: #FFFFFF;
    }

    .potoContainer{
        position: relative;
        display: flex;
        flex-direction: row;
        box-sizing: border-box;
        background: darkblue;
    }

    .add-photos {
        margin: 48px 41.3px 32px 0;
        display: inline-block;
        overflow-wrap: break-word;
        font-family: 'Montserrat';
        font-weight: 600;
        font-size: 14px;
        letter-spacing: 0.4px;
        line-height: 2;
        color: rgba(0, 0, 0, 0.4);
    }
    .quest {
        opacity: 0.502;
        margin: 0 19.9px 8px 19.9px;
        /*display: inline-block;*/
        /*align-self: flex-start;*/
        /*justify-content: center;*/
        /*display: flex;*/
        overflow-wrap: break-word;
        font-family: 'Montserrat';
        font-weight: 400;
        font-size: 14px;
        line-height: 1.143;
        color: #4F4F4F;
        margin-bottom: 10px;
        margin-top: 10px;
    }

    .answer {
        overflow-wrap: break-word;
        font-family: 'Montserrat';
        font-weight: 500;
        font-size: 16px;
        line-height: 1.5;
        color: #333A42;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100%;
        border-radius: 20px;
        border: 1px solid #000; /* 얇은 테두리 */

    }
    .inputText{
        display: grid;
        place-items: center;

    }

</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
