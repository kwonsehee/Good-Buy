<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신 근처의 굿-바이 마켓 Good-Buy!</title>
<link href="${ contextPath }/resources/css/mypage/myGoodsReplyList.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	  <section id="gbSection">
        <img src="${ contextPath }/resources/images/mypage/left-arrow.png" id ="backBtn" onclick="location.href='${contextPath}/mypage/main'">
        <h1 class="title_h1">내 글 / 댓글</h1>
        <ul class="subCategory_ul">
            <li><a id="sub_board" href="myBoardList.html">동네생활 글</a></li>
            <li><a id="sub_boardReply" href="myBoardReplyList.html">동네생활 댓글</a></li>
            <li><a id="sub_goods" href="myGoodsReplyList.html">중고거래 댓글</a></li>
        </ul>

		<!-- 리스트 있을 때 -->
		<c:if test="${ list != null }">
        <div class="listWrap">
        <c:forEach var="l" items="${ list }">
            <div class="eachListWrap">
                <img src="${ contextPath }/resources/images/goodupload/${l.changeName}" class="gPhoto">
                <ul class="goods_ul">
                    <li>${ l.gtitle }</li>  
                    <li><img src="${ contextPath }/resources/images/mypage/more.png" class="moreIcon" onclick="showMenu(${l.rno},this)"></li>  
                </ul>
               
                <ul class="content_ul">
                    <li>${ l.rcontent }</li>   
                    <c:set var="date" value="${ l.createDate }"/> 
                    <li>${ date.substring(0,10) }</li>
                </ul>     
                <div class="subMenu">
               		 <a href="#">삭제</a>
            	</div>                    
            </div>
        </c:forEach>
        </div>
        </c:if>
        
         <!-- 리스트 없을 때 -->
		<c:if test="${ list.size() == 0 }">
		 <div class="listWrap">
			 <div id="textWrap">
				<h2 id="NullListText">리스트가 없습니다 :(</h2>
			 </div>
		 </div>
		</c:if>
        
        <!-- 리스트 있을때만 페이징 나타나게하기 -->
		<c:if test="${ list.size() != 0 }">
        <div id="pageArea">
           <c:if test="${pi.currentPage <= 0}">
            <a> &lt;&lt;&nbsp; </a>
            </c:if>
             <c:if test="${pi.currentPage > 0}">
            	<c:url var="start" value="/mypage/myGoodsReplyList">
            		<c:param name="page" value="1"/>
            	</c:url>
           		 <a href="${ start }"> &lt;&lt;&nbsp; </a>
            </c:if>
             <c:if test="${pi.currentPage <= pi.startPage}">
            <a> &lt;&nbsp; </a>
            </c:if>
             <c:if test="${pi.currentPage > pi.startPage }">
            	<c:url var="before" value="/mypage/myGoodsReplyList">
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
					<c:url var="pagination" value="/mypage/myGoodsReplyList">
						<c:param name="page" value="${ p }" />
					</c:url>
					<a href="${ pagination }">${ p }</a> &nbsp;
				</c:if>
			</c:forEach>
			<c:if test="${pi.currentPage  >= pi.maxPage}">
            <a> &gt;&nbsp; </a>
            </c:if>
            <c:if test="${pi.currentPage < pi.maxPage }">
            	<c:url var="after" value="/mypage/myGoodsReplyList">
            		<c:param name="page" value="${pi.currentPage +1}"/>
            	</c:url>
           		 <a href="${ after }"> &gt;&nbsp; </a>
            </c:if>
            <c:if test="${pi.currentPage >= pi.maxPage }">
            <a> &gt;&gt;&nbsp; </a>
            </c:if>
            <c:if test="${pi.currentPage < pi.maxPage  }">
            	<c:url var="end" value="/mypage/myGoodsReplyList">
            		<c:param name="page" value="${pi.endPage}"/>
            	</c:url>
           		 <a href="${end}"> &gt;&gt;&nbsp; </a>
            </c:if>
           
        </div>
        
        </c:if>
        
        
        
        
    </section>
	
	
	
	
	<jsp:include page="../common/footer.jsp"/>
	
	 <script>
       function showMenu(rno,e){
    	 // 이벤트 전파 버블링 방지
   		 event.stopPropagation();
   		 console.log(rno);
   		 $(e).parent().parent().siblings(".subMenu").slideDown(100);
         goDeleteReply(rno);
       }
       
       /* gbSection클릭 시 more메뉴 닫힘 */
       $("#gbSection").on('click',function(){
    	   $(".subMenu").slideUp(200);
       });
       
       function goDeleteReply(rno){
    	   $(".subMenu a").on('click',function(){
	    	   console.log(rno);
	    	   location.href="${contextPath}/mypage/deleteReply?rno="+rno;
    	   });
       }
       
       $(function(){
    	   var date = $(".date").text();
    	   console.log(date);
       });
    </script>
	
</body>
</html>