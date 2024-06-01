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
        게시글 추가
    </span>

</div>

<div class="potoContainer">
    <div class="add-photos">
        <div class ="quest" style="font-size: 20px">
            사진 추가
        </div>
        <form method="post" enctype="multipart/form-data" action="/upload">
            <input type="file" name="file" id="fileInput" accept="image/*" />
            <%--            <button type="submit">Upload</button>--%>

        </form>
        <div id="imageContainer"></div>
    </div>

</div>

<div class ="inputText">

    <div class ="quest">
        제목
    </div>

    <input class ="answer" id="title" type="text" >

    <div class ="quest" style="margin-top: 20px">
        위치
    </div>
    <select id="loc1" style="margin-bottom: 10px;border-radius: 30px;width: 200px;height: 30px;text-align: center">
        <option value="대구">대구</option>
    </select>
    <select id="loc2" style="margin-bottom: 10px;border-radius: 30px;width: 200px;height: 30px;text-align: center">
        <option value="">지역선택</option>
        <option value="중구">중구</option>
        <option value="동구">동구</option>
        <option value="서구">서구</option>
        <option value="남구">남구</option>
        <option value="북구">북구</option>
        <option value="수성구">수성구</option>
        <option value="달서구">달서구</option>
        <option value="달성군">달성군</option>
    </select>
    <div class ="quest">
        글내용
    </div>

    <textarea class ="answer2" id="description" type="text" name="content" rows="4" cols="200" style="border-radius: 5px"></textarea>
    <button id="submit" style="margin-top: 10px;width: 200px;height: 40px;border-radius: 30px;background-color: #DDCA24;border-color: transparent;font-size: 20px">등록</button>

</div>
<script type="text/javascript">
    $("#submit").on("click",function() {
        var formData = new FormData();
        formData.append("file", document.getElementById("fileInput").files[0]);
        formData.append("title",$("#title").val());
        formData.append("categortProduct",$("#categoryProduct").val());
        formData.append("price",$("#price").val());
        formData.append("loc1",$("#loc1").val());
        formData.append("loc2",$("#loc2").val());
        formData.append("description",$("#description").val());
        $.ajax({

            type: "POST",
            url: "/delivery/insertDeliveryList",
            data:formData
            // data: {/* Any additional parameters you want to send */
            //     title : $("#title").val(),
            //     categoryProduct : $("#categoryProduct").val(),
            //     price : $("#price").val(),
            //     loc1 : $("#loc1").val(),
            //     loc2 : $("#loc2").val(),
            //     description: $("#description").val(),
            //     formData
            // fileNameSong : document.getElementById("fileInput").files[0]
            ,
            processData: false,
            contentType: false,
            success: function(response) {

            },
            error: function(xhr, status, error) {
                console.error("ajax 호출 error 발생");
            }
        });
    });

    document.getElementById('fileInput').addEventListener('change', function(event) {
        const file = event.target.files[0];
        const reader = new FileReader();

        reader.onload = function(event) {
            const imageUrl = event.target.result;
            const imageElement = document.createElement('img');
            imageElement.src = imageUrl;
            document.getElementById('imageContainer').innerHTML = '';
            document.getElementById('imageContainer').appendChild(imageElement);
        };

        reader.readAsDataURL(file);
    });



    function uploadFile() {
        var formData = new FormData();
        formData.append("file", document.getElementById("fileInput").files[0]);

        $.ajax({
            url: "/upload",
            type: "POST",
            data: formData,
            processData: false,
            contentType: false,
            success: function(response) {
                console.log(response);
            },
            error: function(xhr, status, error) {
                console.log("Error uploading file: " + xhr.responseText);
            }
        });
    }
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
        justify-content: center;
        align-items: center;
    }

    .add-photos {
        margin: 48px 41.3px 32px 0;
        display: inline-block;
        overflow-wrap: break-word;
        font-family: 'Montserrat';
        font-weight: 600;
        font-size: 20px;
        letter-spacing: 0.4px;
        line-height: 2;
        justify-content: center;
        align-items: center;


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
        font-size: 20px;
        line-height: 1.143;
        color: #4F4F4F;
        margin-bottom: 10px;
        margin-top: 10px;
        text-align: center;
    }

    .answer {
        overflow-wrap: break-word;
        font-family: 'Montserrat';
        font-weight: 500;
        font-size: 20px;
        line-height: 1.5;
        color: #333A42;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100%;
        border-radius: 20px;
        border: 1px solid #000; /* 얇은 테두리 */

    }
    .answer2 {
        overflow-wrap: break-word;
        font-family: 'Montserrat';
        font-weight: 500;
        font-size: 20px;
        line-height: 1.5;
        color: #333A42;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100%;

        overflow: scroll;
        width:300px;
        height:100px;

    }
    .inputText{
        display: grid;
        place-items: center;

    }

    #imageContainer {
        width: 300px; /* 이미지 컨테이너의 너비를 고정합니다. */
        height: auto; /* 이미지의 높이를 자동으로 조정합니다. */
    }

    #imageContainer img {
        max-width: 100%; /* 이미지의 최대 너비를 100%로 설정하여 이미지가 너비를 벗어나지 않도록 합니다. */
        max-height: 100%; /* 이미지의 최대 높이를 100%로 설정하여 이미지가 높이를 벗어나지 않도록 합니다. */
        display: block; /* 이미지를 블록 요소로 설정하여 다른 요소와 수직으로 정렬합니다. */
        margin: 0 auto; /* 이미지를 가운데 정렬합니다. */
    }


</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
