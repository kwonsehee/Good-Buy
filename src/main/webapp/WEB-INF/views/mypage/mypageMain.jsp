<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신 근처의 굿-바이 마켓 Good-Buy!</title>
<link href="${ contextPath }/resources/css/mypage/mypageMain.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	 <section id="gbSection">
        <h1 class="title_h1">마이페이지</h1>
        <div class="proWrap">
            <img src="${ contextPath }/resources/images/mypage/loopy.jpeg" id="userPhoto" onclick="setPhoto()">
            <img src="${ contextPath }/resources/images/mypage/camera.png" id="cameraIcon" onclick="setPhoto()">
            <p>${loginUser.nickname}</p><br>
            <p>${ mtlist.get(0) }</p>
            <p>${loginUser.user_id}</p>
            <p><a onclick="showFollowing()">팔로잉 6</a></p>
            <p><a onclick="showFollower()">팔로워 15</a></p>
            <p><a href="${ contextPath }/mypage/pointList">1,500 P</a></p>
        </div>

        <button onclick="location.href='${contextPath}/mypage/updateMember'" id="editProfileBtn">프로필 수정</button>

        <div class="btnWrap">
            <div class="firstLineBtn" onclick="location.href='${contextPath}/mypage/sellingList'"><img src="${ contextPath }/resources/images/mypage/copy.png"><p>판매내역</p></div>
            <div class="firstLineBtn" onclick="location.href='${contextPath}/mypage/dealHistoryList'"><img src="${ contextPath }/resources/images/mypage/shopping-bag.png"><p>안전거래내역</p></div>
            <div class="firstLineBtn" onclick="location.href='${contextPath}/mypage/likeGoodsList'"><img src="${ contextPath }/resources/images/mypage/heart.png"><p>관심목록</p></div>
            <div class="firstLineBtn" onclick="location.href='${contextPath}/mypage/msgList'"><img src="${ contextPath }/resources/images/mypage/airplane.png"><p>내 쪽지함</p></div>
            <div class="firstLineBtn" onclick="location.href='${contextPath}/mypage/sentReviewList'"><img src="${ contextPath }/resources/images/mypage/star.png"><p>후기</p></div>
           <br>
           <div class="secondLineBtn" onclick="location.href='${contextPath}/mypage/setMyTown'"><img src="${ contextPath }/resources/images/mypage/placeholder.png"><p>내동네 설정</p></div>
           <div class="secondLineBtn" onclick="location.href='${contextPath}/mypage/setKeyword'"><img src="${ contextPath }/resources/images/mypage/pricetag.png"><p>키워드 알림</p></div>
           <div class="secondLineBtn" onclick="location.href='${contextPath}/mypage/myBoardList'"><img src="${ contextPath }/resources/images/mypage/content.png"><p>내 글 / 댓글</p></div>
           <div class="secondLineBtn" onclick=""><img src="${contextPath}/resources/images/mypage/shop.png"><p>비즈프로필</p></div>
           <div class="secondLineBtn" onclick="location.href='${contextPath}/mypage/reportList'"><img src="${ contextPath }/resources/images/mypage/alarm2.png"><p>신고</p></div>
        </div>
    </section>
    
	
	<jsp:include page="../common/footer.jsp"/>
	
	 <script>
       
       function showFollowing(){
            var url = "${contextPath}/mypage/following";
            var _width = '400';
            var _height = '500';

            // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
            var _left = Math.ceil(( window.screen.width - _width )/2);
            var _top = Math.ceil(( window.screen.height - _height )/2);

            window.open(url,"PopupWin",'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );

       }

       function showFollower(){
            var url = "${contextPath}/mypage/following";
            var _width = '400';
            var _height = '500';

            // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
            var _left = Math.ceil(( window.screen.width - _width )/2);
            var _top = Math.ceil(( window.screen.height - _height )/2);

            window.open(url,"PopupWin",'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
       }

       function setPhoto(){
           var url = "${contextPath}/mypage/profilePhoto";
           var _width = '400';
           var _height = '400';

           // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
           var _left = Math.ceil(( window.screen.width - _width )/2);
           var _top = Math.ceil(( window.screen.height - _height )/2);

           window.open(url,"PopupWin",'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
      }
    </script>
</body>
</html>