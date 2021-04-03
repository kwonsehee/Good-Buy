<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신 근처의 굿-바이 마켓 Good-Buy!</title>
<link href="${ contextPath }/resources/css/mypage/myBoardReplyList.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	 <section id="gbSection">
        <img src="${ contextPath }/resources/images/mypage/left-arrow.png" id ="backBtn" onclick="location.href='${contextPath}/mypage/main'">
        <h1 class="title_h1">내 글 / 댓글</h1>
        <ul class="subCategory_ul">
            <li><a id="sub_board" href="${contextPath}/mypage/myBoardList">동네생활 글</a></li>
            <li><a id="sub_boardReply" href="${contextPath}/mypage/myBoardReplyList">동네생활 댓글</a></li>
            <li><a id="sub_goods" href="${contextPath}/mypage/myGoodsReplyList">중고거래 댓글</a></li>
        </ul>

        <div class="listWrap">
            <div class="eachListWrap">
                <p class="rcontent">헉 너무 귀여워요ㅠ</p>
                <ul>
                    <li class="bcontent">한번씩 보면 사람가기도 하고...ㅋㅋ</li>      
                    <li class="createDate">에서 2housr ago 작성</li>
                </ul>
                <img src="${ contextPath }/resources/images/mypage/more.png" class="likeIcon" onclick="showMenu()"> 
            </div>

            <div class="eachListWrap">  
                <p class="rcontent">미즈병원 주차장 앞 약국에 판다고 했던거 본 것 같아요!</p>
                <ul>
                    <li class="bcontent">애견 의약품 판매하는 약국 아시면 알려주세요~</li>
                    <li class="createDate">에서 21hours ago 작성</li>
                </ul>
                <img src="${ contextPath }/resources/images/mypage/more.png" class="likeIcon" onclick="showMenu()">
            </div>

            <div class="eachListWrap"> 
                <p class="rcontent">리안헤어 천호 로데오점 ‘하진 실장님'을 추천해드립니다!</p>
                <ul>
                    <li class="bcontent">암사역 근처인데 요런 느낌 머리 하고싶어서</li>                  
                    <li class="createDate">에서 2월 20일 작성</li>
                </ul>
                <img src="${ contextPath }/resources/images/mypage/more.png" class="likeIcon" onclick="showMenu()">              
            </div>
            <div class="eachListWrap"> 
                <p class="rcontent">정확히 위치가 어딘가요? 캔 좀 챙겨다 주게여ㅠㅠ</p>
                <ul>
                    <li class="bcontent">고양이 주인 혹시 계신지..천호동 베네시티 근처에 요런 어려 보이고 깔끔한 회색 고양이가 돌아다니는..</li>                  
                    <li class="createDate">에서 2월 20일 작성</li>
                </ul>
                <img src="${ contextPath }/resources/images/mypage/more.png" class="likeIcon" onclick="showMenu()">              
            </div>
            <div class="eachListWrap"> 
                <p class="rcontent">암사동 빨간쭈꾸미 개존맛👍🏼</p>
                <ul>
                    <li class="bcontent">제가 쭈꾸미를 엄청 좋아하는데 지금이 제철이라고해요. 쭈꾸미 샤브샤브 잘하는 곳 있을까요?</li>                  
                    <li class="createDate">에서 2월 20일 작성</li>
                </ul>
                <img src="${ contextPath }/resources/images/mypage/more.png" class="likeIcon" onclick="showMenu()">              
            </div>
            <div class="eachListWrap"> 
                <p class="rcontent">성내동 부리나케 가츠동 맛집이에요ㅎ</p>
                <ul>
                    <li class="bcontent">강동구 성내동 맛집 추천해주세여</li>                  
                    <li class="createDate">에서 2월 20일 작성</li>
                </ul>
                <img src="${ contextPath }/resources/images/mypage/more.png" class="likeIcon" onclick="showMenu()">              
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
            <a href="#">삭제</a>
        </div>
    </section>
	
	<jsp:include page="../common/footer.jsp"/>
	
	 <script>
       function showMenu(){
            $(".subMenu").css("display","block");
       }
    </script>
	
</body>
</html>