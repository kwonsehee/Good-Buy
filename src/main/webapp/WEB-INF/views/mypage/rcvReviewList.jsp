<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신 근처의 굿-바이 마켓 Good-Buy!</title>
<link href="${ contextPath }/resources/css/mypage/rcvReviewList.css?" rel="stylesheet" type="text/css">
</head>
<body>

	<jsp:include page="../common/menubar.jsp"/>
	
	  <section id="gbSection">
        <img src="${ contextPath }/resources/images/mypage/left-arrow.png" id ="backBtn" onclick="location.href='${ contextPath }/mypage/main'">
        <h1 class="title_h1">후기</h1>
        <ul class="subCategory_ul">
            <li><a id="report" href="${contextPath}/mypage/sentReviewList">내가 쓴 후기</a></li>
            <li><a id="reported" href="${contextPath}/mypage/rcvReviewList">받은 후기</a></li>
        </ul>

        <div class="listWrap">
            <div class="eachListWrap">
               
                <img src="${ contextPath }/resources/images/mypage/profile1.jpeg" class="gPhoto">
               
                <ul class="firstUl">
                    <li>폭행몬스터</li>
                    <li>5days ago</li>
                </ul>
                <span>★ ★ ★ ★ ★</span>
               
                <p class="rcontent">거의 새상품 저렴하게 잘 샀어요! 판매자님도 너무 친절하시네요ㅎ^^7</p>
            </div>

            <div class="eachListWrap">
                
                <img src="${ contextPath }/resources/images/mypage/profile2.jpeg" class="gPhoto">
               
                <ul class="firstUl">
                    <li>곽두팔룰루랄ㄹ라</li>
                    <li>1month ago</li>
                </ul>
                <span>★ </span>
                 
                <p class="rcontent">죄송하다했는데 쌍욕날리네여 인성개쓰레기입니다.7</p>
            </div>

            <div class="eachListWrap">
               
                <img src="${ contextPath }/resources/images/mypage/profile3.jpeg" class="gPhoto">
               
                <ul class="firstUl">
                    <li>강동구딱지맘</li>
                    <li>1month ago</li>
                </ul>
                <span>★ ★ ★</span>
                   
                <p class="rcontent">회원권도 저렴하고 새로 생겨서 시설도 깨끗하고 좋아요!</p>
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
</body>
</html>