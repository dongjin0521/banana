<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <%--    jquery(ajax)--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <title>배달음식 같이주문</title>
    <style>
        /*스타일 속성*/
    </style>
</head>
<body>

</body>
</html>

<script type="text/javascript">
    $(document).ready(function(){
        $(function(){
          alert("test");
            // $.ajax({
            //     url: 'myServlet', // 자바 컨트롤러에 호출할 url
            //     type: 'GET',
            //     success: function(response) {
            //         $("#result").html(response);
            //     },
            //     error: function() {
            //         alert("AJAX 요청 중 오류 발생");
            //     }
            // });
        });

        $("#yourButton").click(function(){
            if(1==1){
                alert("버튼이 눌렸네요!");
            }
        });



    });
</script>