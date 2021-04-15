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
   
    <link href="${ contextPath }/resources/css/businessCss/adPage.css" rel="stylesheet" type="text/css">
   

</head>
<body>
    <jsp:include page="../common/menubar.jsp"/>
    <section id="gbSection">
        <div class="area"> 
            <div class="cashArea">
                <label id="cash">광고 캐시</label>
                <label id="money">0원</label>
                <button id="cashBtn">충전</button>
            </div>
            <div class="logoArea">
                <img src="${contextPath}/resources/images/logo2.png">
                <p>진행중인 광고가 없어요</p>
                <p>비즈 프로필을 광고해 보세요.</p>
            </div>
            <div class="btnArea"> 
                <button id="createBtn" onclick="location.href='${contextPath}/business/viewCount'">광고 만들기</button>
            </div>
        </div>
    </section>

 	<jsp:include page="../common/footer.jsp"/>

    <script>

       $("#createBtn").click(function(){
            var url = "viewCount.html";
            var name = "정보관리";
            var _width = '650';
            var _height = '320';
            // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
            var _left = Math.ceil(( window.screen.width - _width )/2);
            var _top = Math.ceil(( window.screen.height - _height )/2); 
            window.open(url, name, 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
       });
    </script>


</body>
</html>