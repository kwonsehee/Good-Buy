<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신 근처의 굿-바이 마켓 Good-Buy!</title>
<link href="${ contextPath }/resources/css/mypage/msgList.css?" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	 <section id="gbSection">
        <img src="${ contextPath }/resources/images/mypage/left-arrow.png" id ="backBtn" onclick="location.href='${ contextPath }/mypage/main'">
        <h1 class="title_h1">내 쪽지함</h1>

        <div class="listWrap">
            <div class="eachListWrap" onclick="sendReply()">
                <img src="${ contextPath }/resources/images/mypage/profile1.jpeg" class="profilePhoto">
                
                <ul>
                    <li class="nickname">계란도른자</li>
                    <li class="town">길동</li>
                    <li class="dot">•</li>
                    <li class="createDate">Yesterday</li>
                </ul>
                <div class="mcontentWrap">
                    <p class="mcontent">아 다행이네요! 저도 감사합니다 코로나 조심하세요ㅎㅎ</p>
                </div>
                
                <img src="${ contextPath }/resources/images/mypage/ex1.jpeg" class="gPhoto">
               
            </div>

            <div class="eachListWrap" onclick="sendReply()">
                <img src="${ contextPath }/resources/images/mypage/profile4.jpeg" class="profilePhoto">
                <ul>
                    <li class="nickname">카드값줘체리</li>
                    <li class="town">둔촌동</li>
                    <li class="dot">•</li>
                    <li class="createDate">3days ago</li>
                </ul>
                <div class="mcontentWrap">
                    <p class="mcontent">아뇨 아직 판매 안되었습니다</p>
                </div>
                
                <img src="${ contextPath }/resources/images/mypage/ex2.jpeg" class="gPhoto">
               
               
            </div>

            <div class="eachListWrap" onclick="sendReply()">
                <img src="${ contextPath }/resources/images/mypage/unknownUser.png" class="profilePhoto">
                <ul>
                    <li class="nickname">조선왕조실룩샐룩</li>
                    <li class="town">강동구 암사동</li>
                    <li class="dot">•</li>
                    <li class="createDate">2월 22일</li>
                </ul>
                <div class="mcontentWrap">
                    <p class="mcontent">네 감사합니다 새해 복 많이 받으세용~^^</p>
                </div>
                
                <img src="${ contextPath }/resources/images/mypage/ex3.jpeg" class="gPhoto">
                
               
            </div>
            <div class="eachListWrap" onclick="sendReply()">
                <img src="${ contextPath }/resources/images/mypage/profile3.jpeg" class="profilePhoto">
                <ul>
                    <li class="nickname">폭행몬스터</li>
                    <li class="town">송파구 오금동</li>
                    <li class="dot">•</li>
                    <li class="createDate">2월 16일</li>
                </ul>
                <div class="mcontentWrap">
                    <p class="mcontent">앗..네 알겠습니다</p>
                </div>      
                <img src="${ contextPath }/resources/images/mypage/ex1.jpeg" class="gPhoto">         
            </div>
        </div>
    </section>
	
	<jsp:include page="../common/footer.jsp"/>
	
	 <script>
       // 쪽지 보내기 팝업 창 띄우기
       function sendReply(){
            var url = "${contextPath}/mypage/msgReply";
            var _width = '400';
            var _height = '640';

            // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
            var _left = Math.ceil(( window.screen.width - _width )/2);
            var _top = Math.ceil(( window.screen.height - _height )/2);

            window.open(url,"PopupWin",'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
       }
    </script>
</body>
</html>