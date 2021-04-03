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
  
    <link href="${ contextPath }/resources/css/businessCss/businessSetting.css" rel="stylesheet" type="text/css">
</head>
<body>
    

    <section id="gbSection">
        <div class="area">
            <div class="photoArea">
                <img src="${contextPath}/resources/images/business/사진추가샘플.png">
                <img id="profileImg" src="${contextPath}/resources/images/business/디테일프로필샘플.png">
                <div id="nameArea">
                <label id="name">가게명</label>
                </div>
                <img id="namePen" src="${contextPath}/resources/images/business/연필.png" width="15px" height="15px">
                <button id="likeBtn">단골0</button>
                <img id="adImg" src="${contextPath}/resources/images/business/메가폰.png" width="50px" height="50px" onclick="location.href='${contextPath}/business/ad'">
                <label id="adLabel">광고하기</label>
                <img id="line" src="${contextPath}/resources/images/business/선.png" >
                <img id="pen" src="${contextPath}/resources/images/business/연필.png" width="50px" height="50px" >
                <label id="newsLabel">소식발행</label>
            </div>
            <div class="infoArea">
                <label id="infoLabel">정보</label>
               <div id="infoPlusArea">
                   <label id="infoPlus" >+ 소개 문구 등록</label>
               </div>
                <div id="addressArea">
                    <img id="addressImg"src="${contextPath}/resources/images/business/주소.png" width="30px" height="30px">
                    <label id="shopAddress">주소를 추가해 주세요.</label>
                </div>
                <div id="timeArea">
                    <img id="clockImg" src="${contextPath}/resources/images/business/시계.png" width="30px" height="30px">
                    <label id="shopTime">영업시간을 추가해 주세요.</label>
                </div>
                <div id="infoBtnArea">
                <button id="infoBtn" >정보 관리하기</button>
                 </div>
            </div>
            <div class="priceArea">
                <label id="priceLabel">가격</label>
                <label id="pricePlusLabel">가격을 추가해 주세요.</label>
                <div id="priceBtnArea">
                <button id="priceBtn" >가격 설정하기</button>
                </div>
            </div>
        </div>
        <div id="btnArea">
        <button id="finalBtn" onclick="location.href='${contextPath}/business/list'">완료</button>
        </div>
    
       
    </section>
 	<jsp:include page="../common/footer.jsp"/>
   

    <script>
     
       $("#pen").click(function(){
            var url = "${contextPath}/business/adPage";
            var name = "소식발행";
            var _width = '520';
            var _height = '700';
            // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
            var _left = Math.ceil(( window.screen.width - _width )/2);
            var _top = Math.ceil(( window.screen.height - _height )/2); 
            window.open(url, name, 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
       });
       $("#infoBtn").click(function(){
            var url = "infoSet.html";
            var name = "정보관리";
            var _width = '500';
            var _height = '700';
            // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
            var _left = Math.ceil(( window.screen.width - _width )/2);
            var _top = Math.ceil(( window.screen.height - _height )/2); 
            window.open(url, name, 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
       });
       $("#priceBtn").click(function(){
            var url = "priceSet.html";
            var name = "가격설정";
            var _width = '500';
            var _height = '664';
            // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
            var _left = Math.ceil(( window.screen.width - _width )/2);
            var _top = Math.ceil(( window.screen.height - _height )/2); 
            window.open(url, name, 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
       });
    </script>


</body>
</html>