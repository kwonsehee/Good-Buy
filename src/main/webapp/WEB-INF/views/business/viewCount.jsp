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
    <link href="${ contextPath }/resources/css/businessCss/viewCount.css" rel="stylesheet" type="text/css">
</head>
<body>
    <table id="viewCount">
        <form method="POST">
        <tr >
            <td><h3>조회수 설정</h3></td>
        </tr>
        <tr>
            <td><label>설정한 조회수 만큼 광고가 유지 됩니다 조회수를 설정 해주세요.</label></td>
        </tr>
        <tr>
            <td><input type="range" id="countInput" name="countInput" min="1" max="4" value="1" step="1" onchange="showValue(this)" ></td>
        </tr>
        <tr>
            <td id="count">조회수 500회</td>
        </tr>
        <tr id="btnArea">
            <td><button id="finalBtn" type="submit">5,000원 광고하기</button></td>
        </tr>
    </form>
    </table>
    <script>
        function showValue(value){
        //    var mytown = $("#mytown").text;
           var val = $("#countInput").val();
          console.log(val);
        //   console.log(mytown);

          if(val == 1){

            $("#finalBtn").html("5,000원 광고하기");
            $("#count").html("조회수 500회");
          } else if(val == 2){
  
            $("#finalBtn").html("10,000원 광고하기");
            $("#count").html("조회수 1,000회");
          } else if(val == 3){
            $("#finalBtn").html("13,000원 광고하기");
            $("#count").html("조회수 1,500회");
          } else {
            $("#finalBtn").html("15,000원 광고하기");
            $("#count").html("조회수 2,000회");
          }
       }
    </script>
</body>
</html>