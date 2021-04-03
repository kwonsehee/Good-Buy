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
    <link href="${ contextPath }/resources/css/businessCss/priceSet.css" rel="stylesheet" type="text/css">
</head>
<body>
    <table id="priceSet">
        <form method="POST">
        <tr >
            <td><h3>대표메뉴</h3></td>
        </tr>
        <tr>
            <td><input type="text" id="topMenu" placeholder="대표 메뉴를 입력하세요. (예: 커피)" ></td>
        </tr>
        <tr>
            <td><h3>가격</h3></td>
        </tr>
        <tr>
            <td><input type="text" id="priceInput" placeholder="가격을 입력하세요." ></td>
        </tr>
        <tr>
            <td><h3>추가 설명</h3></td>
        </tr>
        <tr>
            <td><textarea name="menuInfo" id="menuInfo" style="resize: none;" placeholder="다른 메뉴와 설명이 필요하다면 적어주세요."></textarea></td>
        </tr>
        <tr id="btnArea">
            <td><button id="finalBtn" type="submit">완료</button></td>
        </tr>
    </form>
    </table>
</body>
</html>