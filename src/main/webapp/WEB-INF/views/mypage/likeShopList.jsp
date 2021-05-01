<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

		<!-- 리스트 있을 때 -->
		<c:if test="${ blist != null }">
        <div class="listWrap">
         <c:forEach var="b" items="${ blist }">
            <div class="eachListWrap">
                <img src="${contextPath}/resources/${business.filePath}${business.changeName }" class="gPhoto"  onclick="selectShop(${b.shopNo})">
                <p class="gtitle"  onclick="selectShop(${b.shopNo})">${ b.shopName }</p>
                <ul onclick="selectShop(${b.shopNo})">
                    <li class="town">${ b.shopAdd }</li>
                    <li class="dot">•</li>
                    <li class="createDate">${ b.shopTime3 }</li>
                </ul>
                <img src="${ contextPath }/resources/images/mypage/fillHeart.png" class="likeIcon" onclick="cancelLike(${b.shopNo})">
               
                <img src="${ contextPath }/resources/images/mypage/speech-bubble.png" class="replyIcon">
                <p class="replyCount">${ b.reviewCount }</p>
                <img src="${ contextPath }/resources/images/mypage/heart.png" class="heartIcon">
                <p class="likeCount">${ b.faCount }</p>
            </div>
            </c:forEach>
        </div>
        </c:if>
        
        
        <!-- 리스트 없을 때 -->
		<c:if test="${ blist.size() == 0 }">
		 <div class="listWrap">
			 <div id="textWrap">
				<h2 id="NullListText">리스트가 없습니다 :(</h2>
			 </div>
		 </div>
		</c:if>
		
		<!-- 리스트 있을때만 페이징 나타나게하기 -->
		<c:if test="${ blist.size() != 0 }">
        <div id="pageArea">
           <c:if test="${pi.currentPage <= 0}">
            <a> &lt;&lt;&nbsp; </a>
            </c:if>
             <c:if test="${pi.currentPage > 0}">
            	<c:url var="start" value="/mypage/likeShopList">
            		<c:param name="page" value="1"/>
            	</c:url>
           		 <a href="${ start }"> &lt;&lt;&nbsp; </a>
            </c:if>
             <c:if test="${pi.currentPage <= pi.startPage}">
            <a> &lt;&nbsp; </a>
            </c:if>
             <c:if test="${pi.currentPage > pi.startPage }">
            	<c:url var="before" value="/mypage/likeShopList">
            		<c:param name="page" value="${pi.currentPage -1}"/>
            	</c:url>
           		 <a href="${before }"> &lt;&nbsp; </a>
            </c:if>
           <!-- 페이지 숫자 -->
			<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				<c:if test="${ p eq pi.currentPage }">
					<font color="#05AAD1" size="4">${ p }</font> &nbsp;
				</c:if>
				<c:if test="${ p ne pi.currentPage }">
					<c:url var="pagination" value="/mypage/likeShopList">
						<c:param name="page" value="${ p }" />
					</c:url>
					<a href="${ pagination }">${ p }</a> &nbsp;
				</c:if>
			</c:forEach>
			<c:if test="${pi.currentPage  >= pi.maxPage}">
            <a> &gt;&nbsp; </a>
            </c:if>
            <c:if test="${pi.currentPage < pi.maxPage }">
            	<c:url var="after" value="/mypage/likeShopList">
            		<c:param name="page" value="${pi.currentPage +1}"/>
            	</c:url>
           		 <a href="${ after }"> &gt;&nbsp; </a>
            </c:if>
            <c:if test="${pi.currentPage >= pi.maxPage }">
            <a> &gt;&gt;&nbsp; </a>
            </c:if>
            <c:if test="${pi.currentPage < pi.maxPage  }">
            	<c:url var="end" value="/mypage/likeShopList">
            		<c:param name="page" value="${pi.endPage}"/>
            	</c:url>
           		 <a href="${end}"> &gt;&gt;&nbsp; </a>
            </c:if>
           
        </div>
        
        </c:if>

       
    </section>
<jsp:include page="../common/footer.jsp"/>

 	<script>
       function cancelLike(shopNo){
    	   console.log(shopNo);
    	   location.href='${contextPath}/business/deleteFaCount?shopNo=' + shopNo + "&pageName=mypage";
       }
       
       // 가게 디테일뷰
       function selectShop(shopNo){
    	console.log(shopNo);
  		location.href="${contextPath}/business/detail?shopNo="+shopNo;
  	   } 
  	
       
    </script>
</body>
</html>