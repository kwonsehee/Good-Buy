<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신 근처의 굿-바이 마켓 Good-Buy!</title>
<link href="${ contextPath }/resources/css/mypage/sentReviewList.css?" rel="stylesheet" type="text/css">
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
		
		
		
		<!-- 리스트 있을 때 -->
		<c:if test="${ rlist != null }">
        <div class="listWrap">
        <ul class="subCategory_ul2">
			<li><a id="" href="${contextPath}/mypage/sentReviewList" style="color:#949999;">회원리뷰&nbsp;▼</a></li>
			<li><a id="" href="${contextPath}/mypage/sentShopReviewList" style="color:black;">가게리뷰&nbsp;▼</a></li>
		</ul>
         <c:forEach var="list" items="${ rlist }" varStatus="status">
            <div class="eachListWrap">
                
                <img src="${ contextPath }/resources/images/goodupload/${list.changeName}" class="gPhoto">
               
	                           
                <ul class="firstUl">
                    <li>${ list.shopName }</li>
                    <li>${ list.reviewDate }</li>
                </ul>
                <c:if test="${ list.grade == 5 }">
                <span>★ ★ ★ ★ ★</span>
                </c:if>
                <c:if test="${ list.grade == 4 }">
                <span>★ ★ ★ ★</span>
                </c:if>
                <c:if test="${ list.grade == 3 }">
                <span>★ ★ ★</span>
                </c:if>
                <c:if test="${ list.grade == 2 }">
                <span>★ ★</span>
                </c:if>
                <c:if test="${ list.grade == 1 }">
                <span>★</span>
                </c:if>
                <img src="${ contextPath }/resources/images/mypage/more.png" class="moreIcon" onclick="showMenu(${list.reviewNo},this)">     
                <p class="rcontent">${ list.content }</p>
                <div class="subMenu">
		            <a href="#">삭제</a>
		        </div>
            </div>
		 </c:forEach>
        </div>
        
        </c:if>
        
        <!-- 리스트 없을 때 -->
		<c:if test="${ rlist.size() == 0 }">
		 <div class="listWrap">
			 <div id="textWrap">
				<h2 id="NullListText">리스트가 없습니다 :(</h2>
			 </div>
		 </div>
		</c:if>
        
        
         <!-- 리스트 있을때만 페이징 나타나게하기 -->
		<c:if test="${ rlist.size() != 0 }">
        <div id="pageArea">
           <c:if test="${pi.currentPage <= 0}">
            <a> &lt;&lt;&nbsp; </a>
            </c:if>
             <c:if test="${pi.currentPage > 0}">
            	<c:url var="start" value="/mypage/sentReviewList">
            		<c:param name="page" value="1"/>
            	</c:url>
           		 <a href="${ start }"> &lt;&lt;&nbsp; </a>
            </c:if>
             <c:if test="${pi.currentPage <= pi.startPage}">
            <a> &lt;&nbsp; </a>
            </c:if>
             <c:if test="${pi.currentPage > pi.startPage }">
            	<c:url var="before" value="/mypage/sentReviewList">
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
					<c:url var="pagination" value="/mypage/sentReviewList">
						<c:param name="page" value="${ p }" />
					</c:url>
					<a href="${ pagination }">${ p }</a> &nbsp;
				</c:if>
			</c:forEach>
			<c:if test="${pi.currentPage  >= pi.maxPage}">
            <a> &gt;&nbsp; </a>
            </c:if>
            <c:if test="${pi.currentPage < pi.maxPage }">
            	<c:url var="after" value="/mypage/sentReviewList">
            		<c:param name="page" value="${pi.currentPage +1}"/>
            	</c:url>
           		 <a href="${ after }"> &gt;&nbsp; </a>
            </c:if>
            <c:if test="${pi.currentPage >= pi.maxPage }">
            <a> &gt;&gt;&nbsp; </a>
            </c:if>
            <c:if test="${pi.currentPage < pi.maxPage  }">
            	<c:url var="end" value="/mypage/sentReviewList">
            		<c:param name="page" value="${pi.endPage}"/>
            	</c:url>
           		 <a href="${end}"> &gt;&gt;&nbsp; </a>
            </c:if>
           
        </div>
        
        </c:if>

       
        
    </section>
    
	<jsp:include page="../common/footer.jsp"/>
	
	 <script>
	 <!-- more 버튼 클릭 시 -->
     function showMenu(rno,e){
  	  // 이벤트 전파 버블링 방지
		  event.stopPropagation();
        $(e).siblings(".subMenu").slideDown(200);
        goDeleteShopReview(rno);
     }
     
     /* gbSection클릭 시 more메뉴 닫힘 */
     $("#gbSection").on('click',function(){
  	   $(".subMenu").slideUp(200);
     });
     
     // 리뷰 삭제
     function goDeleteShopReview(rno){
    	 console.log(rno);
    	 $(".subMenu a:nth-child(1)").on('click',function(){
     		   console.log(rno);
     		   location.href="${contextPath}/mypage/deleteShopReview?rno="+rno;
     	   });
     }
     
     // 판매자 페이지로 
     
     
    </script>

	
</body>
</html>