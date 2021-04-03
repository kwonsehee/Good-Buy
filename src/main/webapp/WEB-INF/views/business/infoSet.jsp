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
    <link href="${ contextPath }/resources/css/businessCss/infoSet.css" rel="stylesheet" type="text/css">
</head>
<body>
    <table id="infoSet">
        <form method="POST">
        <tr>
            <td><h3>가게명</h3></td>
        </tr>
        <tr>
            <td><input type="text" id="nameInput" placeholder="예) 가게명을 입력 하세요." ></td>
        </tr>
        <tr >
            <td><h3>카테고리</h3></td>
        </tr>
        <tr>
            <td>
                <select id="category">
                    <option>일자리</option>
                    <option>과외/클래스</option>
                    <option>농수산물</option>
                    <option>부동산</option>
                    <option>중고차</option>
                    <option>전시/행사</option>
                    <option>지역업체</option>
                </select> 
            </td>
        </tr>
        <tr>
            <td><h3>상세 업종</h3></td>
        </tr>
        <tr>
            <td><input type="text" id="detailInput" placeholder="예) 카페, 한식전문점, 옷수선, 반찬가게등" ></td>
        </tr>
        <tr>
            <td><h3>주소</h3></td>
        </tr>
        <tr>
            <td><input type="text" id="addressInput" placeholder="주소를 입력해 주세요." ></textarea></td>
        </tr>
        <tr>
            <td><h3>전화번호</h3></td>
        </tr>
        <tr>
            <td><input type="text" id="phoneInput" placeholder="고객이 연락할 수 있는 번호를 적어주세요." ></td>
        </tr>
        <tr>
            <td><h3>소개 문구</h3></td>
        </tr>
        <tr>
            <td><textarea name="infoInput" id="infoInput" style="resize: none;" placeholder="상품/서비스를 소개하는 문구를 작성해 주세요."></textarea></td>
        </tr>
        <tr>
            <td><h3>영업 시간</h3></td>
        </tr>
        <tr>
            <td><input type="text" id="timeInput1" placeholder="시작" > ~ 
                <input type="text" id="timeInput2" placeholder="종료" ></td>

        </tr>
        <tr>
            <td><input type="text" id="timeInput3" placeholder="휴무요일을 적어주세요."></td>
        </tr>
        <tr id="btnArea">
            <td><button id="finalBtn" type="submit">완료</button></td>
        </tr>
    </form>
    </table>
</body>
</html>