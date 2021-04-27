<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신 근처의 굿-바이 마켓 Good-Buy!</title>
<link href="${ contextPath }/resources/css/mypage/followingPopup.css?" rel="stylesheet" type="text/css">
</head>
<body>
<div class="titleWrap">
        <span class="circle"></span>
        <span class="Following">Follower</span>
        <span class="Following">•</span>
        <span class="Following">${ cnt }</span>
        <span class="circle"></span>
    </div>

    <div class="totalWrap">
    <c:forEach var="f" items="${ flist }">
        <div class="eachWrap" onclick="goSellerPage('${f.user_id}')">
            <ul>
            	 <!-- 프사 있을 때 -->
            	<c:if test="${ !empty f.photo }">
                <li><img src="${ contextPath }/resources/images/userProfilePhoto/${f.photo}" class="userPhoto"></li>
              	</c:if>
              	 <!-- 프사 없을 때 -->
	            <c:if test="${ empty f.photo }">
	            <img src="${ contextPath }/resources/images/mypage/unknownUser.png" class="userPhoto">
	            </c:if>
              	
                <li>${ f.nickname }</li>
                <li><img src="${ contextPath }/resources/images/mypage/rightarrow.png" class="arrow"></li>
            </ul>    
        </div>
       </c:forEach>
    </div>
    
     <script>
    function goSellerPage(seller){
    	window.opener.location.href="${contextPath}/goods/sellerInfo?seller="+seller;
		window.close();
    }
    </script>
    

</body>
</html>