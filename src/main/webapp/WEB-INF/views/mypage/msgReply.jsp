<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신 근처의 굿-바이 마켓 Good-Buy!</title>
<link href="${ contextPath }/resources/css/mypage/msgReply.css" rel="stylesheet" type="text/css">
</head>
<body>
	 <form method="post" action="${ contextPath }/msg/insertMsg">
	 <div class="profileWrap">
       <div class="inner">
      		<!-- 프사 있을 때 -->
           	<c:if test="${ !empty m.photo }">
             <img src="${ contextPath }/resources/images/userProfilePhoto/${m.photo}" class="profilePhoto">
            </c:if> 
            <!-- 프사 없을 때 -->
            <c:if test="${ empty m.photo }">
            <img src="${ contextPath }/resources/images/mypage/unknownUser.png" class="profilePhoto">
            </c:if>
              
            <p class="nickname">${ m.nickname }</p>
       </div>      
    </div>
    <div class="goodsWrap">
        <img src="${ contextPath }/resources/images/goodupload/${ m.changeName }">
        <p>${ m.gtitle }</p>
        <p>${ m.gprice }</p>
    </div>
    <div class="reciveMsg">
        <pre>${ m.mcontent }</pre>
    </div>

   
    <div class="sendMsg">
        <textarea  style="resize: none;" placeholder="친절한 답장을 적어주세요" name="mcontent"></textarea>
    </div>
    <button type="submit" id="sendBtn">보내기</button>
    
    <input type="hidden" name="caller" value="${ m.caller }">
    <!-- 상품관련 쪽지일 경우 -->
    <c:if test="${ m.gno != null }">
    <input type="hidden" name="gno" value="${ m.gno }">
    </c:if>
    </form>          
</body>
</html>