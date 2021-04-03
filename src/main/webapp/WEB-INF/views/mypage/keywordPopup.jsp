<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신 근처의 굿-바이 마켓 Good-Buy!</title>
 <style>
body {
	margin: 0;
}

.profileWrap {
	height: 50px;
	background: #F4F4F4;
	border: 1px solid #F4F4F4;
}

.profileWrap p {
	font-weight: bold;
	font-size: 13px;
	text-align: center;
	line-height: 25px;
}

.contentWrap p {
	font-size: 12px;
	padding-left: 10px;
}

.boldText {
	font-weight: bold;
}

.goQnA {
	text-align: center;
	margin: auto;
	margin-top: 50px;
	margin-bottom: 50px;
}

.goQnA a {
	color: #9A9999;
	text-decoration: underline;
	font-size: 12px;
	font-weight: bold;
}

.logo {
	width: 160px;
	margin-left: 50%;
	transform: translate(-50%);
}
</style>
</head>
<body>
	 <div class="profileWrap">
        <p>키워드 등록을 했는데 알림이 안 와요</p>
    </div>
  
    <div class="contentWrap">
        <br>
        <p>키워드 알림이 오지 않는 경우를 확인해보세요.</p>
        <br>
        <p class="boldText">1. 새롭게 작성한 게시글에 대해서만 알림이 울려요.</p>
        <p>끌어올리기한 게시글은 키워드 알림이 울리지 않아요.</p>
        <br>
        <p class="boldText">2. 게시글 제목에 키워드가 포함되어 있지 않은 경우</p>
        <p>게시글의 제목에 키워드가 정확히 매칭되는 경우에만 알림이 울려요.</p>
        <p>띄어쓰기와 맞춤법이 달라도 울리지 않을 수 있는 점 참고 부탁드릴게요.</p>            
        <p>게시글 제목에 포함될 수 있는 키워드로 등록해 주세요.</p>   
        <p>예시) 자전거, 유모차, 식탁, 냉장고</p>
        <br>
        <p class="boldText">3. 이미 동일한 키워드 알림을 받은 적이 있는 경우</p>
        <p>키워드 알림은 한 번만 발송돼요.</p>
        <p>동일한 키워드 알림이라면 한 번 이상 발송되지 않는 점 참고해 주세요.</p>
    </div>

    <div class="goQnA"> <a href="#" >Q & A 게시판으로 이동하기</a></div>
   
   
    <img src="${ contextPath }/resources/images/mypage/logo2.png" class="logo">
</body>
</html>