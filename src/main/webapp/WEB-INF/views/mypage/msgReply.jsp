<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신 근처의 굿-바이 마켓 Good-Buy!</title>
<link href="${ contextPath }/resources/css/mypage/msgReply.css" rel="stylesheet" type="text/css">
</head>
<body>
	 <div class="profileWrap">
       <div class="inner">
            <img src="${ contextPath }/resources/images/mypage/profile3.jpeg">
            <p class="nickname">폭행몬스터</p>
       </div>      
    </div>
    <div class="goodsWrap">
        <img src="${ contextPath }/resources/images/mypage/ex3.jpeg">
        <p>강아지 노즈워크 IQ트레이닝 돌돌이 장난감</p>
        <p>8,000원</p>
    </div>
    <div class="reciveMsg">
        <pre>앗..네 알겠습니다</pre>
    </div>

    <form method="post">
    <div class="sendMsg">
        <textarea  style="resize: none;" placeholder="친절한 답장을 적어주세요"></textarea>
    </div>
    <button type="submit" id="sendBtn">보내기</button>
    </form>          
</body>
</html>