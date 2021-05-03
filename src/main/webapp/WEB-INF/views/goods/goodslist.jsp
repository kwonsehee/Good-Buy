<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Good-Buy</title>
<!-- css -->
<link href="${ contextPath }/resources/css/goods/list.css?v=0" rel="stylesheet" type="text/css">
<!--sweetalert2-->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

</head>
<body>
       <jsp:include page="../common/menubar.jsp"/>
       
 <section id="gbSection">
 
       <table id="goodlist" >
           <tr>
            <td>
                 <span id="allCate" onclick="showCate();">
                <img src="${ contextPath }/resources/images/filter.png"  id="gfilter">
                전체 </span>
                  <div class="catebar">
                  
                    <button onclick="closeCate()">X</button>
                       
                    <ul>
                    <c:url var="selected0" value="/goods/list">
            				<c:param name="cate" value="여성의류"/>
            		</c:url>
           		  	<li><a href="${selected0}"> 여성의류 </a></li>
   				 	<c:url var="selected1" value="/goods/list">
            				<c:param name="cate" value="패션잡화"/>
            		</c:url>
           		  	<li><a href="${selected1}"> 패션잡화 </a></li>
                        <li><a href="${contextPath }/goods/list">디지털•가전</a></li>
                        <li><a href="${contextPath }/goods/list">도서•티켓•취미•애완</a></li>
                        <li><a href="${contextPath }/goods/list">스타굿즈</a></li>
                        <li><a href="${contextPath }/goods/list">생활•문구•가구•식품</a></li>
                        <li><a href="${contextPath }/goods/list">스포츠•레저</a></li>
                        <li><a href="${contextPath }/goods/list">뷰티•미용</a></li>
                    </ul>
                </div>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
           </tr>
           
           <tr class="goodsWrapTr">
            <c:forEach var="a" items="${ glist }" end="4">
               <td onclick="selectGoods(${a.gno});"> 
                   <img src="${ contextPath }/resources/images/goodupload/${a.changeName}" class="goodlistimg">
                    <br>
                    <span class="title_font">${fn:substring(a.gtitle,0,15)}
                    <c:if test="${fn:length(a.gtitle )>15}">
                    ...
                    </c:if>
                    </span>
                    <p class="id_font">${a.user_id}</p>
                    <br>
                    <p class="price_font">${a.gprice}원</p>
                    <p class="date_font">${a.createDate}</p>
                </td>
            </c:forEach>
           </tr>
           
           <tr class="goodsWrapTr">
           <c:forEach var="a" items="${ glist }" begin="5">
               <td onclick="selectGoods(${a.gno});"> 
                   <img src="${ contextPath }/resources/images/goodupload/${a.changeName}" class="goodlistimg">
                    <br>
                     <span class="title_font">${fn:substring(a.gtitle,0,15)}
                    <c:if test="${fn:length(a.gtitle )>15}">
                    ...
                    </c:if></span>
                     <p class="id_font">${a.user_id}</p>
                    <br>
                    <p class="price_font">${a.gprice}원</p>
                    <p class="date_font">${a.createDate}</p>
                </td>
            </c:forEach>
             <c:if test="${glist.size()< 5 }">
            <td style="height : 220px;"></td>
            </c:if>
        </tr>
       </table>
       <div style="margin-top: 3%; padding-left: 8%; float: left; text-decoration: underline;">
       		
       		 <c:if test="${ !empty sessionScope.loginUser }">
       		<a href="${ contextPath }/goods/mylist" style="color:black;">내 상품 모아보기</a>
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
            <c:if test="${pi.currentPage <= pi.startPage}">
            <a> &lt;&nbsp; </a>
            </c:if>
            <c:if test="${pi.currentPage > pi.startPage }">
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
		<c:if test="${ !empty sessionScope.loginUser }">
		
			<c:if test="${ writeActive eq 'y' }">
      		 <button id="writeBtn" onclick="location.href='${ contextPath }/goods/insertView'" >중고거래 글쓰기</button>
       		</c:if>
       		<c:if test="${ writeActive eq 'n' }">
      		 <button id="writeBtn" onclick="wrierActive();" >중고거래 글쓰기</button>
       		</c:if>
       </c:if>
       
    </section>
    <script type="text/javascript">
    function wrierActive(){
        Swal.fire({
title: '글쓰기 비활성화',
html: '<br>회원님은 신고횟수 3회 이상으로 글쓰기가 비활성화 되었습니다.<br>글쓰기는 신고로부터 15일 이후부터 작성가능합니다.<br>',
imageUrl: '${ contextPath }/resources/images/logo.png',
imageWidth: 232,
imageHeight: 90,
imageAlt: 'Custom image',
})
    }
    function showCate(){
        $(".catebar").css("left","0px");   
   }
    function closeCate(){
        $(".catebar").css("left","-300px");   
    }
    function selectGoods(gno){
		location.href="${contextPath}/goods/detail?gno="+gno;
	}
    </script>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>