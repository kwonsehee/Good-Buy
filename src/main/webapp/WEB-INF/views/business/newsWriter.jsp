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
    <link href="${ contextPath }/resources/css/businessCss/newsWriter.css" rel="stylesheet" type="text/css">
</head>
<body>
    <table id="newsWrite">
        <form method="POST">
        <tr >
            <td colspan="2" id="imgArea" colspan="2"><img src="${contextPath}/resources/images/business/소식발행 샘플.png" ></td>
        </tr>
        <tr>
            <td><h3>제목</h3></td>
        </tr>
        <tr>
            <td><input type="text" id="titleInput" placeholder="제목을 입력해 주세요." ></td>
        </tr>
        <tr>
            <td><h3>소식</h3></td>
        </tr>
        <tr>
            <td><textarea name="newsInfo" id="newsInfo" style="resize: none;" placeholder="상품/서비스 소개, 새로운 메뉴, 이벤트 등 다양한 소식을 알려보세요."></textarea></td>
        </tr>
        <tr id="btnArea">
            <td><button id="finalBtn" type="submit">완료</button></td>
        </tr>
    </form>
    </table>
</body>
</html>