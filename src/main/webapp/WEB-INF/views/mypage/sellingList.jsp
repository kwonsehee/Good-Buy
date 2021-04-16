<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

		<!-- 리스트 있을 때 -->
		<c:if test="${ sellingList != null }">
        <div class="listWrap">
        <c:forEach var="slist" items="${ sellingList }">
        <!-- gstatus 상태가 판매중이라면 -->
          <c:if test="${ slist.gstatus.equals('Y') }"> 
            <div class="eachListWrap">
                <img src="${ contextPath }/resources/images/goodupload/${slist.changeName}" class="gPhoto">
                <p class="gtitle">${ slist.gtitle }</p>
                <ul>
                    <li class="town">${ slist.address_3 }</li>
                    <li class="dot">•</li>
                    <li class="createDate">${ slist.createDate }</li>
                </ul>
                <img src="${ contextPath }/resources/images/mypage/more.png" class="moreIcon" onclick="showMenu()">
                <div class="gStatus"><p class="statusText">판매중</p></div>
                <p class="gprice">${ slist.gprice }</p>
                <img src="${ contextPath }/resources/images/mypage/speech-bubble.png" class="replyIcon">
                <p class="replyCount">${ slist.rep_cnt }</p>
                <img src="${ contextPath }/resources/images/mypage/heart.png" class="heartIcon">
                <p class="likeCount">${ slist.like_cnt }</p>
            </div>
		 </c:if> 
        </c:forEach>
        </div>
        </c:if>
        
        <!-- 리스트 없을 때 -->
		<c:if test="${ sellingList == null }">
		 <div class="listWrap">
			 <div id="textWrap">
				<h2 id="NullListText">리스트가 없습니다 :(</h2>
			 </div>
		 </div>
		</c:if>
		
        

		<!-- 리스트 있을때만 페이징 나타나게하기 -->
		<c:if test="${ sellingList != null }">
        <div id="pageArea">
           <c:if test="${pi.currentPage <= 0}">
            <a> &lt;&lt;&nbsp; </a>
            </c:if>
             <c:if test="${pi.currentPage > 0}">
            	<c:url var="start" value="/mypage/sellingList">
            		<c:param name="page" value="1"/>
            	</c:url>
           		 <a href="${ start }"> &lt;&lt;&nbsp; </a>
            </c:if>
             <c:if test="${pi.currentPage <= pi.startPage}">
            <a> &lt;&nbsp; </a>
            </c:if>
             <c:if test="${pi.currentPage > pi.startPage }">
            	<c:url var="before" value="/mypage/sellingList">
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
					<c:url var="pagination" value="/mypage/sellingList">
						<c:param name="page" value="${ p }" />
					</c:url>
					<a href="${ pagination }">${ p }</a> &nbsp;
				</c:if>
			</c:forEach>
			<c:if test="${pi.currentPage  >= pi.maxPage}">
            <a> &gt;&nbsp; </a>
            </c:if>
            <c:if test="${pi.currentPage < pi.maxPage }">
            	<c:url var="after" value="/mypage/sellingList">
            		<c:param name="page" value="${pi.currentPage +1}"/>
            	</c:url>
           		 <a href="${ after }"> &gt;&nbsp; </a>
            </c:if>
            <c:if test="${pi.currentPage >= pi.maxPage }">
            <a> &gt;&gt;&nbsp; </a>
            </c:if>
            <c:if test="${pi.currentPage < pi.maxPage  }">
            	<c:url var="end" value="/mypage/sellingList">
            		<c:param name="page" value="${pi.endPage}"/>
            	</c:url>
           		 <a href="${end}"> &gt;&gt;&nbsp; </a>
            </c:if>
           
        </div>
        
        </c:if>
        
        <div class="subMenu">
            <a href="#">게시글 수정</a>
            <a href="#">숨기기</a>
            <a href="#">삭제</a>
        </div>
    </section>
	
	<jsp:include page="../common/footer.jsp"/>
	
	 <script>
	<!-- more 버튼 클릭 시 -->
       function showMenu(){
            $(".subMenu").css("display","block");
            var price = $(".gprice").text();
            console.log(price);
       }
       
      /*  var price = (".gprice").text();
   	   $(".gprice").val(makeComma(price));
       console.log(price); */
       
       
       
       
       function makeComma(price){
    	   str = String(price);

    	   return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');

       }
       
       
       
       
    </script>
</body>
</html>