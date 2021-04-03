<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신 근처의 굿-바이 마켓 Good-Buy!</title>
<link href="${ contextPath }/resources/css/mypage/sellingList.css?" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	 <section id="gbSection">
        <img src="${ contextPath }/resources/images/mypage/left-arrow.png" id ="backBtn" onclick="location.href='${ contextPath }/mypage/main'">
        <h1 class="title_h1">판매내역</h1>
        <ul class="subCategory_ul">
            <li><a id="selling">판매중</a></li>
            <li><a id="hidden" href="${ contextPath }/mypage/hiddenList">숨김</a></li>
        </ul>

        <div class="listWrap">
            <div class="eachListWrap">
                <img src="${ contextPath }/resources/images/mypage/ex1.jpeg" class="gPhoto">
                <p class="gtitle">단열 에어캡</p>
                <ul>
                    <li class="town">길동</li>
                    <li class="dot">•</li>
                    <li class="createDate">Last month</li>
                </ul>
                <img src="${ contextPath }/resources/images/mypage/more.png" class="moreIcon" onclick="showMenu()">
                <div class="gStatus"><p class="statusText">판매중</p></div>
                <p class="gprice">3,000원</p>
                <img src="${ contextPath }/resources/images/mypage/speech-bubble.png" class="replyIcon">
                <p class="replyCount">1</p>
                <img src="${ contextPath }/resources/images/mypage/heart.png" class="heartIcon">
                <p class="likeCount">1</p>
            </div>

            <div class="eachListWrap">
                <img src="${ contextPath }/resources/images/mypage/ex2.jpeg" class="gPhoto">
                <p class="gtitle">강아지 노즈워크 IQ트레이닝 돌돌이 장난감</p>
                <ul>
                    <li class="town">길동</li>
                    <li class="dot">•</li>
                    <li class="createDate">Last month</li>
                    <li class="dot">•</li>
                    <li class="up">끌올 1회</li>
                </ul>
                <img src="${ contextPath }/resources/images/mypage/more.png" class="moreIcon" onclick="showMenu()">
                <div class="gStatus"><p class="statusText">판매중</p></div>
                <p class="gprice">8,000원</p>
                <img src="${ contextPath }/resources/images/mypage/speech-bubble.png" class="replyIcon">
                <p class="replyCount">3</p>
                <img src="${ contextPath }/resources/images/mypage/heart.png" class="heartIcon">
                <p class="likeCount">5</p>
            </div>

            <div class="eachListWrap">
                <img src="${ contextPath }/resources/images/mypage/ex3.jpeg" class="gPhoto">
                <p class="gtitle">강아지계단 3단</p>
                <ul>
                    <li class="town">길동</li>
                    <li class="dot">•</li>
                    <li class="createDate">2days ago</li>
                </ul>
                <img src="${ contextPath }/resources/images/mypage/more.png" class="moreIcon" onclick="showMenu()">
                <div class="gStatus"><p class="statusText">판매중</p></div>
                <p class="gprice">10,000원</p>
                <img src="${ contextPath }/resources/images/mypage/speech-bubble.png" class="replyIcon">
                <p class="replyCount">10</p>
                <img src="${ contextPath }/resources/images/mypage/heart.png" class="heartIcon">
                <p class="likeCount">17</p>
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
        <div class="subMenu">
            <a href="#">게시글 수정</a>
            <a href="#">숨기기</a>
            <a href="#">삭제</a>
        </div>
    </section>
	
	<jsp:include page="../common/footer.jsp"/>
	
	<!-- more 버튼 클릭 시 -->
	 <script>
       function showMenu(){
            $(".subMenu").css("display","block");
       }
    </script>
</body>
</html>