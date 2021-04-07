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
  
    <link href="${ contextPath }/resources/css/businessCss/businessDetail.css" rel="stylesheet" type="text/css">
 
    
</head>
<body>
 <jsp:include page="../common/menubar.jsp"/>
    
    <section id="gbSection">
        <div class="area">
            <div class="photoArea">
                <img src="${contextPath}/resources/images/business/디테일샘플.png">
                <img id="profileImg" src="${contextPath}/resources/images/business/디테일프로필샘플.png">
                <label id="name">커피커피</label>
                <button id="likeBtn">+단골0</button>
                <img id="call" src="${contextPath}/resources/images/business/전화기.png" width="50px" height="50px">
                <label id="callLabel">전화문의</label>
                <img id="line" src="${contextPath}/resources/images/business/선.png" >
                <img id="review" src="${contextPath}/resources/images/business/연필.png" width="50px" height="50px">
                <label id="reviewLabel">후기작성</label>
            </div>
            <div class="infoArea">
                <label id="infoLabel">정보</label>
                <p id="info">신규 오픈한 커피를 마시자 입니다. 매일 먹어도 부담없는 커피를 만들어요 산뜻한 분위기와 따듯한 커피를 즐겨보세요</p>
                <img id="addressImg"src="${contextPath}/resources/images/business/주소.png" width="30px" height="30px">
                <p id="shopAddress">인천시 미추홀구 주안동 123</p>
                <img id="clockImg" src="${contextPath}/resources/images/business/시계.png" width="30px" height="30px">
                <p id="shopTime">09:00 ~ 20:00 매주 화요일 휴무</p>
            </div>
            <div class="priceArea">
                <label id="priceLabel">가격</label>
                <label id="titleMenu">대표 메뉴 : 아메리카노 Hot 1.5 Ice 2.0</label>
                <pre id="menuInfo">헤이즐넛 Hot 2.5 Ice 3.0
카푸치노 Hot 3.0 Ice 3.5
카페모카 Hot 3.5 Ice 4.0
                </pre>
            </div>
            <div class="newsArea">
                <label id="newsLabel">소식</label>
                <img id="newsPhoto" src="${contextPath}/resources/images/business/소식샘플.png">
                <img id="oneBtn"src="${contextPath}/resources/images/business/원버튼.png">
                <label id="newsTitle">커피커피 특가 이벤트!!!</label>
                <pre id="newsInfo">3월 한달간 선착순 100명에게 모든 메뉴 1000원 통큰
할인 해드립니다!! 많이 방문해주세요!
                </pre>
            </div>
            <div class="reviewArea">
                <div id="firstArea">
                    <label id="reviewTitle">후기</label>
                    <label id="reviewCount">1</label>
                    <img id="star" src="${contextPath}/resources/images/business/별점.png">
                </div>
                <label id="writer"><img src="${contextPath}/resources/images/business/미니프로필샘플.png"> 아침햇살</label>
                <pre id="reviewInfo">굿바이 구경하다가 후기가 좋아서 가봤어요~ 사장님이
정말 친절하고 커피 맛도 좋고 분위기도 정말 좋아요~ 추천합니다!
지금 이벤트 중이니까 다들 한번씩 들려보세요 후회 안합니다!!
                </pre>
            </div>
        </div>
       
    </section>

  
   <jsp:include page="../common/footer.jsp"/>
    <script>
     
       $("#review").click(function(){
            var url = "${contextPath}/business/reviewWrite";
            var name = "정보관리";
            var _width = '500';
            var _height = '400';
            // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
            var _left = Math.ceil(( window.screen.width - _width )/2);
            var _top = Math.ceil(( window.screen.height - _height )/2); 
            window.open(url, name, 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
       });
    </script>


</body>
</html>