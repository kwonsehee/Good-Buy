<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신 근처의 굿-바이 마켓 Good-Buy!</title>
<link href="${ contextPath }/resources/css/mypage/myBoardList.css" rel="stylesheet" type="text/css">
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

		<!-- 리스트 있을 때 -->
		<c:if test="${ blist != null }">
        <div class="listWrap">
         <c:forEach var="b" items="${ blist }">
            <div class="eachListWrap">
                <ul onclick="selectBoard(${b.bno})">
                    <li><div class="bCategory"><p class="cateName">${ b.bcatename }</p></div></li>
                    <li><p class="gtitle">${ b.btitle }</p></li>
                    <li class="town">${ b.nickname }</li>
                    <li class="dot">•</li>
                    <li class="createDate">${ b.bcreatedate }</li>
                </ul>
    
                <img src="${ contextPath }/resources/images/mypage/more.png" class="likeIcon" onclick="showMenu(${b.bno},this)">
                <p class="bcontent">${ b.bhistory }</p>
                <c:if test="${ b.bfile != null }">
                <img src="${ contextPath }/resources/images/boardupload/${b.bfile}" class="contentPhoto">
				</c:if>
                <img src="${ contextPath }/resources/images/mypage/speech-bubble.png" class="replyIcon">
                <p class="replyCount">${ b.rep_cnt }</p>
                <img src="${ contextPath }/resources/images/mypage/heart.png" class="heartIcon">
                <p class="likeCount">${ b.like_cnt }</p>
                 <div class="subMenu">
		            <a href="#">게시글 수정</a>
		            <a href="#">삭제</a>
		        </div>
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
            	<c:url var="start" value="/mypage/myBoardList">
            		<c:param name="page" value="1"/>
            	</c:url>
           		 <a href="${ start }"> &lt;&lt;&nbsp; </a>
            </c:if>
             <c:if test="${pi.currentPage <= pi.startPage}">
            <a> &lt;&nbsp; </a>
            </c:if>
             <c:if test="${pi.currentPage > pi.startPage }">
            	<c:url var="before" value="/mypage/myBoardList">
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
					<c:url var="pagination" value="/mypage/myBoardList">
						<c:param name="page" value="${ p }" />
					</c:url>
					<a href="${ pagination }">${ p }</a> &nbsp;
				</c:if>
			</c:forEach>
			<c:if test="${pi.currentPage  >= pi.maxPage}">
            <a> &gt;&nbsp; </a>
            </c:if>
            <c:if test="${pi.currentPage < pi.maxPage }">
            	<c:url var="after" value="/mypage/myBoardList">
            		<c:param name="page" value="${pi.currentPage +1}"/>
            	</c:url>
           		 <a href="${ after }"> &gt;&nbsp; </a>
            </c:if>
            <c:if test="${pi.currentPage >= pi.maxPage }">
            <a> &gt;&gt;&nbsp; </a>
            </c:if>
            <c:if test="${pi.currentPage < pi.maxPage  }">
            	<c:url var="end" value="/mypage/myBoardList">
            		<c:param name="page" value="${pi.endPage}"/>
            	</c:url>
           		 <a href="${end}"> &gt;&gt;&nbsp; </a>
            </c:if>
           
        </div>
        
        </c:if>
       
    </section>
    
	<jsp:include page="../common/footer.jsp"/>
	
	 <script>
       function showMenu(bno,e){
    	  // 이벤트 전파 버블링 방지
   		  event.stopPropagation();
          $(e).siblings(".subMenu").slideDown(200);
          goBoardUpdate(bno);
          goDeleteBoard(bno);
         // console.log(bno);
       }
       
       /* gbSection클릭 시 more메뉴 닫힘 */
       $("#gbSection").on('click',function(){
    	   $(".subMenu").slideUp(200);
       });
       
       function goBoardUpdate(bno){
    	   $(".subMenu a:nth-child(1)").on('click',function(){
    		   console.log(bno);
    		  // location.href="${contextPath}/board/editView?bno="+bno;
    	   });
       }
       
       function goDeleteBoard(bno){
    	   $(".subMenu a:nth-last-child(1)").on('click',function(){
    		   console.log(bno);
    		   location.href="${contextPath}/board/delete?bno="+bno+"&pageName=mypage"; 
    	   });
       }
       
       function selectBoard(bno){
    	   location.href="${contextPath}/board/detail?bno="+bno;
       }
       
       
    </script>

	
</body>
</html>