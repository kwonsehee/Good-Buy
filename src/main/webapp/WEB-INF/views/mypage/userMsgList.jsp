<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신 근처의 굿-바이 마켓 Good-Buy!</title>
<!--sweetalert2-->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

<link href="${ contextPath }/resources/css/mypage/msgList.css?n" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	 <section id="gbSection">
  <c:if test="${ !empty msg && msg.equals('success')}">
  		<script>
          swal.fire({
			  title: '쪽지 답변 완료',
			  html: '',
			  imageUrl: '${ contextPath }/resources/images/logo.png',
			  imageWidth: 232,
			  imageHeight: 90,
			  imageAlt: 'Custom image',
          }).then(function(){
				window.close();
		  });
          
  		</script>
  		<c:remove var="msg" />
  </c:if>
  
  <c:if test="${ !empty msg && msg.equals('fail')}">
  		<script>
          swal.fire({
			  title: '쪽지 답변 실패',
			  html: '<br>사용에 불편을 드려서 죄송합니다. <br>좋은 Good-buy가 될 수 있도록 노력하겠습니다.<br>',
			  imageUrl: '${ contextPath }/resources/images/logo.png',
			  imageWidth: 232,
			  imageHeight: 90,
			  imageAlt: 'Custom image',
		  });
          
  		</script>
  		<c:remove var="msg" />
  </c:if>
 
	 
	 
	 
        <img src="${ contextPath }/resources/images/mypage/left-arrow.png" id ="backBtn" onclick="location.href='${ contextPath }/mypage/main'">
        <h1 class="title_h1">내 쪽지함</h1>
         <ul class="subCategory_ul">
            <li><a id="selling" href="${ contextPath }/mypage/msgList" style="color:#949999;">상품 문의 쪽지</a></li>
            <li><a id="hidden" href="${ contextPath }/mypage/userMsgList" style="color:black;">판매자 1:1 쪽지</a></li>
        </ul>
         

		<!-- 리스트 있을 때 -->
		<c:if test="${ mlist != null }">
        <div class="listWrap">
         <c:forEach var="list" items="${ mlist }" varStatus="status">
            <div class="eachListWrap" onclick="sendReply(${ list.mno })">
            	<!-- 프사 있을 때 -->
            	<c:if test="${ !empty list.photo }">
                <img src="${ contextPath }/resources/images/userProfilePhoto/${list.photo}" class="profilePhoto">
               </c:if> 
                <!-- 프사 없을 때 -->
	            <c:if test="${ empty list.photo }">
	            <img src="${ contextPath }/resources/images/mypage/unknownUser.png" class="profilePhoto">
	            </c:if>
               
                <ul>
                    <li class="nickname">${list.nickname}</li>
                    <li class="dot">•</li>
                    <li class="createDate">${ list.createDate }</li>
                </ul>
                <div class="mcontentWrap">
                    <p class="mcontent">${ list.mcontent }</p>
                </div>
            </div>
         </c:forEach>
        </div>
        </c:if>
        
        <!-- 리스트 없을 때 -->
		<c:if test="${ mlist.size() == 0 }">
		 <div class="listWrap">
			 <div id="textWrap">
				<h2 id="NullListText">리스트가 없습니다 :(</h2>
			 </div>
		 </div>
		</c:if>
        
        
        <!-- 리스트 있을때만 페이징 나타나게하기 -->
		<c:if test="${ mlist.size() != 0 }">
        <div id="pageArea">
           <c:if test="${pi.currentPage <= 0}">
            <a> &lt;&lt;&nbsp; </a>
            </c:if>
             <c:if test="${pi.currentPage > 0}">
            	<c:url var="start" value="/mypage/msgList">
            		<c:param name="page" value="1"/>
            	</c:url>
           		 <a href="${ start }"> &lt;&lt;&nbsp; </a>
            </c:if>
             <c:if test="${pi.currentPage <= pi.startPage}">
            <a> &lt;&nbsp; </a>
            </c:if>
             <c:if test="${pi.currentPage > pi.startPage }">
            	<c:url var="before" value="/mypage/msgList">
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
					<c:url var="pagination" value="/mypage/msgList">
						<c:param name="page" value="${ p }" />
					</c:url>
					<a href="${ pagination }">${ p }</a> &nbsp;
				</c:if>
			</c:forEach>
			<c:if test="${pi.currentPage  >= pi.maxPage}">
            <a> &gt;&nbsp; </a>
            </c:if>
            <c:if test="${pi.currentPage < pi.maxPage }">
            	<c:url var="after" value="/mypage/msgList">
            		<c:param name="page" value="${pi.currentPage +1}"/>
            	</c:url>
           		 <a href="${ after }"> &gt;&nbsp; </a>
            </c:if>
            <c:if test="${pi.currentPage >= pi.maxPage }">
            <a> &gt;&gt;&nbsp; </a>
            </c:if>
            <c:if test="${pi.currentPage < pi.maxPage  }">
            	<c:url var="end" value="/mypage/msgList">
            		<c:param name="page" value="${pi.endPage}"/>
            	</c:url>
           		 <a href="${end}"> &gt;&gt;&nbsp; </a>
            </c:if>
           
        </div>
        
        </c:if>
        
        
    </section>


	<jsp:include page="../common/footer.jsp"/>
	
	 <script>
       // 쪽지 보내기 팝업 창 띄우기
       function sendReply(mno){
            var url = "${contextPath}/mypage/msgReply2?mno="+mno;
            var _width = '400';
            var _height = '640';

            // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
            var _left = Math.ceil(( window.screen.width - _width )/2);
            var _top = Math.ceil(( window.screen.height - _height )/2);

            window.open(url,"PopupWin",'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
       }
    </script>
</body>
</html>