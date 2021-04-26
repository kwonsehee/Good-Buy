<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <title>당신 근처의 굿-바이 마켓 Good-Buy!</title>
    <link href="${ contextPath }/resources/css/businessCss/reviewWrite.css" rel="stylesheet" type="text/css">
</head>
<body>
        <form method="post" action="${ contextPath }/business/review/insert">
    <table id="reviewWrite">
        <tr >
            <td id="star">
                <h3>후기</h3> 
                <span id="star">
                    <a value=1 style="padding-right: 0;">★</a> 
                    <a  value=2 style="padding-right: 0;">★</a> 
                    <a  value=3 style="padding-right: 0;">★</a> 
                    <a  value=4 style="padding-right: 0;">★</a>
                    <a value=5 style="padding-right: 0;">★</a>
                <span>
            </td>
        </tr>
        <tr>
            <td><textarea name="content" id="reviewInput" style="resize: none;" placeholder="가게 이용 후기를 자유롭게 작성해 주세요."></textarea></td>
        </tr>
        <tr id="btnArea">
            <td><button id="finalBtn" type="submit">완료</button></td>
        </tr>
    </table>
    </form>
    <script>
          // 별 색 채워짐 이벤트
          $('#star a').click(function(){ 
            $(this).parent().children("a").removeClass("on"); 
            $(this).addClass("on").prevAll("a").addClass("on"); 
            console.log($(this).attr("value")); 
            star = $(this).attr("value");
        });   
    </script>

</body>
</html> 