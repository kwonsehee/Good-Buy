<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Good-Buy</title>

<link href="${ contextPath }/resources/css/goods/list.css" rel="stylesheet" type="text/css">

</head>
<body> 
<jsp:include page="../common/menubar.jsp"/>
  
 <section id="gbSection">
        
       <table id="goodlist">
           <tr>
            <td>
             <span id="allCate" onclick="showCate();">
                <img src="${ contextPath }/resources/images/filter.png"  id="gfilter">
                전체 </span>
                <div class="catebar">
                  
                    <button onclick="closeCate()">X</button>
                       
                    <ul>
                       <c:url var="selected0" value="/goods/mylist">
            				<c:param name="cate" value="여성의류"/>
            		</c:url>
           		  	<li><a href="${selected0}"> 여성의류 </a></li>
   				 	<c:url var="selected1" value="/goods/mylist">
            				<c:param name="cate" value="패션잡화"/>
            		</c:url>
           		  	<li><a href="${selected1}"> 패션잡화 </a></li>
                        <li><a href="#">디지털/가전</a></li>
                        <li><a href="#">도서/티켓/취미/애완</a></li>
                        <li><a href="#">스타굿즈</a></li>
                        <li><a href="#">생활/문구/가구/식품</a></li>
                        <li><a href="#">스포츠/레저</a></li>
                        <li><a href="#">뷰티/미용</a></li>
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
                    <span>${a.gtitle}</span>
                    <a href="javascript:deletePopup()" style="font-size: 13px; margin-left: 30%; text-decoration: underline;">삭제</a>
                   
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
                    <span>${a.gtitle}</span>
                    <a href="javascript:deletePopup()" style="font-size: 13px; margin-left: 30%; text-decoration: underline;">삭제</a>
                    <br>
                    <span>${a.gprice}원</span>
                    <span>${a.createDate}</span>
                </td>
            </c:forEach>
        </tr>
       </table>
       <div style="margin-top: 3%; padding-left: 8%; float: left; text-decoration: underline;"><a href="${ contextPath }/goods/list">전체 상품 보기</a></div>
   <div id="pageArea">
       		<c:if test="${pi.currentPage <= 0}">
            <a> &lt;&lt;&nbsp; </a>
            </c:if>
            <c:if test="${pi.currentPage > 0}">
            	<c:url var="start" value="/goods/mylist">
            		<c:param name="page" value="1"/>
            	</c:url>
           		 <a href="${ start }"> &lt;&lt;&nbsp; </a>
            </c:if>
            <c:if test="${pi.currentPage <= pi.startPage}">
            <a> &lt;&nbsp; </a>
            </c:if>
            <c:if test="${pi.currentPage > pi.startPage }">
            	<c:url var="before" value="/goods/mylist">
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
					<c:url var="pagination" value="/goods/mylist">
						<c:param name="page" value="${ p }" />
					</c:url>
					<a href="${ pagination }">${ p }</a> &nbsp;
				</c:if>
			</c:forEach>
			<c:if test="${pi.currentPage  >= pi.maxPage}">
            <a> &gt;&nbsp; </a>
            </c:if>
            <c:if test="${pi.currentPage < pi.maxPage }">
            	<c:url var="after" value="/goods/mylist">
            		<c:param name="page" value="${pi.currentPage +1}"/>
            	</c:url>
           		 <a href="${ after }"> &gt;&nbsp; </a>
            </c:if>
            <c:if test="${pi.currentPage >= pi.maxPage }">
            <a> &gt;&gt;&nbsp; </a>
            </c:if>
            <c:if test="${pi.currentPage < pi.maxPage  }">
            	<c:url var="end" value="/goods/mylist">
            		<c:param name="page" value="${pi.endPage}"/>
            	</c:url>
           		 <a href="${end}"> &gt;&gt;&nbsp; </a>
            </c:if>

		</div>
       <button id="writeBtn" onclick="location.href='${ contextPath }/goods/insertView'" >중고거래 글쓰기</button>
    </section>
   <script>
   function showCate(){
       $(".catebar").css("left","0px");   
  }
   function closeCate(){
       $(".catebar").css("left","-300px");   
   }
        function deletePopup(){
            var url = "deletePopup.html";
            var name = "삭제하기";
            var _width = '750';
            var _height = '550';
 
    // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
    var _left = Math.ceil(( window.screen.width - _width )/2);
    var _top = Math.ceil(( window.screen.height - _height )/2); 
 
    window.open(url, name, 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
 
        }
        function selectGoods(gno){
    		location.href="${contextPath}/goods/mydetail?gno="+gno;
    	}
    </script>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>