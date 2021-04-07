<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>당신 근처의 굿-바이 마켓 Good-Buy!</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <!-- 공통 UI -->
   
    <link href="${ contextPath }/resources/css/businessCss/businessInfo.css" rel="stylesheet" type="text/css">
</head>
<body>
    <jsp:include page="../common/menubar.jsp"/>

    <section id="gbSection">
        <div class="area">
            <div class="first">
                <h3>나의 비즈니스 프로필</h3>
                <p>내 비즈니스와 이웃을 연결하는 방법, 지금 시작해 보세요!</p>
                <img src="${contextPath}/resources/images/business/정보페이지사진1.png">
            </div>
            <div class="second">
                <h3>정보와 후기를 한눈에</h3>
                <pre>이웃들의 관심을 끌 수 있도록
프로필을 채워보세요.
                </pre>
                <img src="${contextPath}/resources/images/business/정보페이지사진2.png">
            </div>
        </div>
        <div class="btnArea">
            <button id="startBtn" onclick="location.href='${contextPath}/business/setting'">시작하기</button>
        </div>
    </section>

    <jsp:include page="../common/footer.jsp"/>

 


</body>
</html>