<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신 근처의 굿-바이 마켓 Good-Buy!</title>
<link href="${ contextPath }/resources/css/mypage/likeShopList.css?" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="../common/menubar.jsp"/>
	  <section id="gbSection">
        <img src="${ contextPath }/resources/images/mypage/left-arrow.png" id ="backBtn" onclick="location.href='${ contextPath }/mypage/main'">
        <h1 class="title_h1">관심목록</h1>
        <ul class="subCategory_ul">
            <li><a id="sub_goods" href="${ contextPath }/mypage/likeGoodsList">중고매물</a></li>
            <li><a id="sub_shop" href="${ contextPath }/mypage/likeShopList">지역업체</a></li>
            <li><a id="sub_board" href="${ contextPath }/mypage/likeBoardList">동네생활</a></li>
        </ul>

        <div class="listWrap">
            <div class="eachListWrap">
                <img src="${ contextPath }/resources/images/mypage/ex4.jpeg" class="gPhoto">
                <p class="gtitle">천호역 인근! 1:1 드럼 개인 레슨!</p>
                <ul>
                    <li class="town">송파구 풍납1동</li>
                    <li class="dot">•</li>
                    <li class="createDate">Yesterday</li>
                </ul>
                <img src="${ contextPath }/resources/images/mypage/fillHeart.png" class="likeIcon" onclick="cancelLike()">
               
                <img src="${ contextPath }/resources/images/mypage/speech-bubble.png" class="replyIcon">
                <p class="replyCount">10</p>
                <img src="${ contextPath }/resources/images/mypage/heart.png" class="heartIcon">
                <p class="likeCount">1</p>
            </div>

            <div class="eachListWrap">
                <img src="${ contextPath }/resources/images/mypage/ex5.jpeg" class="gPhoto">
                <p class="gtitle">방이동미용실 살롱하우스 바네프입니다💕</p>
                <ul>
                    <li class="town">송파구 방이동</li>
                    <li class="dot">•</li>
                    <li class="createDate">21hours ago</li>
                </ul>
                <img src="${ contextPath }/resources/images/mypage/fillHeart.png" class="likeIcon" onclick="cancelLike()">
               
                <!-- <img src="images/speech-bubble.png" class="replyIcon">
                <p class="replyCount">3</p> -->
                <img src="${ contextPath }/resources/images/mypage/heart.png" class="heartIcon">
                <p class="likeCount">5</p>
            </div>

            <div class="eachListWrap">
                <img src="${ contextPath }/resources/images/mypage/ex6.jpeg" class="gPhoto">
                <p class="gtitle">풍납2동 어썸팩토리 풍납 독서실 소개</p>
                <ul>
                    <li class="town">송파구 풍납2동</li>
                    <li class="dot">•</li>
                    <li class="createDate">2hours ago</li>
                </ul>
                <img src="${ contextPath }/resources/images/mypage/fillHeart.png" class="likeIcon" onclick="cancelLike()">
               
                <img src="${ contextPath }/resources/images/mypage/speech-bubble.png" class="replyIcon">
                <p class="replyCount">2</p>
                <img src="${ contextPath }/resources/images/mypage/heart.png" class="heartIcon">
                <p class="likeCount">3</p>
            </div>
        </div>

        <div class="pagingArea">
            <ul>
                <li><a href="#">&lt;&lt;</a></li>
                <li><a href="#">&lt;</a></li>
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">&gt;</a></li>
                <li><a href="#">&gt;&gt;</a></li>
            </ul>
        </div>
    </section>
<jsp:include page="../common/footer.jsp"/>

 	<script>
       function cancelLike(){
        //  전체 likeIcon 말고 선택한 div안의 likeIcon만 지워져야 함
           $(likeIcon).css("display","none");
       }
    </script>
</body>
</html>