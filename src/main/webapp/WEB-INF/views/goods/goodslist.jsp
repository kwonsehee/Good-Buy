<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Good-Buy</title>
<!-- css -->
<link href="${ contextPath }/resources/css/goods/list.css?v=0" rel="stylesheet" type="text/css">

</head>
<body>
 <section id="gbSection">
       <jsp:include page="../common/menubar.jsp"/>
 
       <table id="goodlist" >
           <tr>
            <td>
                <img src="${ contextPath }/resources/images/filter.png" onclick="showCate();" id="gfilter"> 전체
                <div class="catebar">
                  
                    <button onclick="closeCate()">X</button>
                       
                    <ul>
                        <li><a href="${contextPath }/goods/list?cate='여성의류'">여성의류</a></li>
                        <li><a href="${contextPath }/goods/list?cate'패션잡화'">패션잡화</a></li>
                        <li><a href="${contextPath }/goods/list">디지털/가전</a></li>
                        <li><a href="${contextPath }/goods/list">도서/티켓/취미/애완</a></li>
                        <li><a href="${contextPath }/goods/list">스타굿즈</a></li>
                        <li><a href="${contextPath }/goods/list">생활/문구/가구/식품</a></li>
                        <li><a href="${contextPath }/goods/list">스포츠/레저</a></li>
                        <li><a href="${contextPath }/goods/list">뷰티/미용</a></li>
                    </ul>
                </div>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
           </tr>
           <tr>
            	 <c:forEach var="a" items="${ glist }" end="4">
               <td onclick="selectGoods(${a.gno});"> 
                   <img src="${ contextPath }/resources/images/goodupload/${a.changeName}" class="goodlistimg">
                    <br>
                    <span>${a.gtitle}</span><span>${a.user_id}</span>
                    <br>
                    <span>${a.gprice}원</span>
                    <span>${a.createDate}</span>
                </td>
            </c:forEach>
           </tr>
           <tr>
           <c:forEach var="a" items="${ glist }" begin="5">
               <td onclick="selectGoods(${a.gno});"> 
                   <img src="${ contextPath }/resources/images/goodupload/${a.changeName}" class="goodlistimg">
                    <br>
                    <span>${a.gtitle}</span><span>${a.user_id}</span>
                    <br>
                    <span>${a.gprice}원</span>
                    <span>${a.createDate}</span>
                </td>
            </c:forEach>
        </tr>
       </table>
       <div style="margin-top: 3%; padding-left: 8%; float: left; text-decoration: underline;">
       		
       		 <c:if test="${ !empty sessionScope.loginUser }">
       		<a href="${ contextPath }/goods/mylist">내 상품 모아보기</a>
       		</c:if>
       		 <c:if test="${ empty sessionScope.loginUser }">
       		<a href="${ contextPath }/goods/mylist">팝업띄우기</a>
       		</c:if>
       </div>
       <div id="pageArea">
       		<c:if test="${pi.currentPage <= 0}">
            <a> &lt;&lt;&nbsp; </a>
            </c:if>
            <c:if test="${pi.currentPage > 0}">
            	<c:url var="start" value="/goods/list">
            		<c:param name="page" value="1"/>
            	</c:url>
           		 <a href="${ start }"> &lt;&lt;&nbsp; </a>
            </c:if>
            <c:if test="${pi.currentPage <= 0}">
            <a> &lt;&nbsp; </a>
            </c:if>
            <c:if test="${pi.currentPage > 0 }">
            	<c:url var="before" value="/goods/list">
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
					<c:url var="pagination" value="/goods/list">
						<c:param name="page" value="${ p }" />
					</c:url>
					<a href="${ pagination }">${ p }</a> &nbsp;
				</c:if>
			</c:forEach>
			<c:if test="${pi.currentPage  >= pi.maxPage}">
            <a> &gt;&nbsp; </a>
            </c:if>
            <c:if test="${pi.currentPage < pi.maxPage }">
            	<c:url var="after" value="/goods/list">
            		<c:param name="page" value="${pi.currentPage +1}"/>
            	</c:url>
           		 <a href="${ after }"> &gt;&nbsp; </a>
            </c:if>
            <c:if test="${pi.currentPage >= pi.maxPage }">
            <a> &gt;&gt;&nbsp; </a>
            </c:if>
            <c:if test="${pi.currentPage < pi.maxPage  }">
            	<c:url var="end" value="/goods/list">
            		<c:param name="page" value="${pi.endPage}"/>
            	</c:url>
           		 <a href="${end}"> &gt;&gt;&nbsp; </a>
            </c:if>

		</div>
       <button id="writeBtn" onclick="location.href='${ contextPath }/goods/insertView'" >중고거래 글쓰기</button>
    </section>
    <script type="text/javascript">
    function showCate(){
        $(".catebar").css("left","0px");   
   }
    function closeCate(){
        $(".catebar").css("left","-300px");   
    }
    function selectGoods(){
		location.href="${contextPath}/goods/detail";
	}
	
    </script>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>