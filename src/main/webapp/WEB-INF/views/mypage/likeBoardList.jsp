<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신 근처의 굿-바이 마켓 Good-Buy!</title>
<link href="${ contextPath }/resources/css/mypage/likeBoardList.css?v" rel="stylesheet" type="text/css">
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
                <ul>
                <li><div class="bCategory"><p class="cateName">우리동네질문</p></div></li>
                <li><p class="gtitle">둔촌동 세탁소 추천 해주세요~</p></li>
                <li class="town">둔촌동 피바다</li>
                <li class="dot">•</li>
                <li class="createDate">Yesterday</li>
                </ul>

                <img src="${ contextPath }/resources/images/mypage/fillHeart.png" class="likeIcon" onclick="cancelLike()">
                <p class="bcontent">한동안 크린토피아 이용했었는데...친절은 하지만 옷은 세탁이 잘 되는지 모르겠어서 다른곳  이용해볼까 하...</p>
                <img src="${ contextPath }/resources/images/mypage/speech-bubble.png" class="replyIcon">
                <p class="replyCount">10</p>
                <img src="${ contextPath }/resources/images/mypage/heart.png" class="heartIcon">
                <p class="likeCount">1</p>
            </div>

            <div class="eachListWrap">
                <ul>
                    <li><div class="bCategory"><p class="cateName">기타</p></div></li>
                    <li><p class="gtitle">천호공원에 주인 없는 강아지가 있어요</p></li>
                    <li class="town">강철 딱지맘</li>
                    <li class="dot">•</li>
                    <li class="createDate">Yesterday</li>
                </ul>
    
                <img src="${ contextPath }/resources/images/mypage/fillHeart.png" class="likeIcon" onclick="cancelLike()">
                <p class="bcontent">저희 강아지랑 산책하다가 만낫는데 만지지도 못해서 동물병원도 못 데려 가고 잇는 상황입니다</p>
                <img src="${ contextPath }/resources/images/mypage/ex7.jpeg" class="contentPhoto">
                <img src="${ contextPath }/resources/images/mypage/ex8.jpeg" class="contentPhoto">
                <!-- <img src="images/speech-bubble.png" class="replyIcon">
                <p class="replyCount">3</p> -->
                <img src="${ contextPath }/resources/images/mypage/heart.png" class="heartIcon">
                <p class="likeCount">5</p>
            </div>

            <div class="eachListWrap">
                <ul>
                    <li><div class="bCategory"><p class="cateName">동네소식</p></div></li>
                    <li><p class="gtitle">타코야끼 출몰했나요???</p></li>
                    <li class="town">불주먹웅앵웅</li>
                    <li class="dot">•</li>
                    <li class="createDate">2hours ago</li>
                </ul>
                <img src="${ contextPath }/resources/images/mypage/fillHeart.png" class="likeIcon" onclick="cancelLike()">
                <p class="bcontent">3월 6일 타코야끼 출몰 지역 있나요? 타코야끼가 넘 먹고싶은데 요즘 잘 안보이네여😭😭😭😭</p>
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