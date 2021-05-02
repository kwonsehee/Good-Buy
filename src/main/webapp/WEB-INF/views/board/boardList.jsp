<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
       <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>당신 근처의 굿-바이 마켓 Good-Buy!</title>
  
   
    <link href="${contextPath }/resources/css/board/boardList.css" rel="stylesheet" type="text/css">
   
</head>
<body>
<jsp:include page="../common/menubar.jsp"/>
    
<br>
    <section id="gbSection">
        <br> <br>   <div id="maintitle">
            <a>내동네생활</a>
            <br>
    </div>
        <br><br><br>
        <select id="townselect">
            <option value="">카테고리 ▼</option>
            <option value="">일상</option>
            <option value="">동물</option>
            <option value="">맛집</option>
            <option value="">기타</option>
        </select>
        <div class="list">
         <c:forEach var="b" items="${ list }">
         <div class="start" onclick="location.href='${contextPath }/board/detail?bno=${b.bno }'">
                <ul>
                    <li><div class="kind"><p class="subject">${b.bcatename}</p></div></li>
                <img src="${contextPath}/resources/images/boardupload/${b.bfile}" class="Photo">
                    <li><div id="title">${b.btitle}</div></li>
                    <br>
                    <li class="name" style="color: black;">${b.userid }</li>
                    <li class="Date">${b.bcreatedate}</li>
                    <li class="hearts"><img src="${contextPath}/resources/images/mypage/heart.png" style="width:24px; height:21px;">
                    ${b.postno}</li>
                   
                      <p class="bcontent">${ fn:substring(b.bhistory,0,60) }
				<c:if test="${fn:length(c.bhistory )>60}">
           		 ...
                </c:if>				
                </ul>
                
            </div>
            <br> <br>
             </c:forEach>
       
 
              
            <br><br>
        <button id="writeBtn" onclick="location.href='${contextPath}/board/write'">동네 생활 글쓰기</button>
            <div class="townserch">
                <input type="text" id="townbox" placeholder="동네생활을 검색하세요!" style=" color:#05AAD1;">
                <button type="submit" id="townbutton"  onclick="location.href='${contextPath}/board/serch'"  style="margin-left: 15px;">검색</button>
               
            
            </div>
          
            
        </div>
        <table class="pagingArea">
          	<td colspan="6">
					<!-- [이전] -->
					<c:if test="${ pi.currentPage <= 1 }">
						[이전] &nbsp;
					</c:if>
					<c:if test="${ pi.currentPage > 1 }">
						<c:url var="before" value="/board/list">
							<c:param name="page" value="${ pi.currentPage -1 }" />
						</c:url>
						<a href="${ before }">[이전]</a> &nbsp;
					</c:if>
					<!-- 페이지 숫자 -->
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:if test="${ p eq pi.currentPage }">
							<font color="red" size="4"><b>[${ p }]</b></font> &nbsp;
						</c:if>
						<c:if test="${ p ne pi.currentPage }">
							<c:url var="pagination" value="/board/list">
								<c:param name="page" value="${ p }"/>
							</c:url>
							<a href="${ pagination }">${ p }</a> &nbsp;
						</c:if>
					</c:forEach>
					<!-- [다음] -->
					<c:if test="${ pi.currentPage >= pi.maxPage }">
						[다음]
					</c:if>
					<c:if test="${ pi.currentPage < pi.maxPage }">
						<c:url var="after" value="/board/list">
							<c:param name="page" value="${ pi.currentPage + 1 }" />
						</c:url>
						<a href="${ after }">[다음]</a>
					</c:if>
					</td> 
				</tr>
        </table>
    </section>
    <jsp:include page="../common/footer.jsp"/>
    
    
    


</body>
</html>