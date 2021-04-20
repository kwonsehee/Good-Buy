<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>당신 근처의 굿-바이 마켓 Good-Buy!</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <!-- 공통 UI -->
    <link href="${ contextPath }/resources/css/admin/admin_member.css?" rel="stylesheet" type="text/css">
  <style>
      
  
  </style>
</head>
<body>
    

     <jsp:include page="../common/menubar.jsp"/>

    <section id="gbSection">


        <div id="div1" >
       <h1><a href="${ contextPath }/admin/join" id="head1" style="color : black;">관리자 페이지</a></h1>
        </div>


        <div id="div2">
            <button id="button1"><a id="a1" href="${ contextPath }/admin/notice">공지사항</a></button>
            <button id="button1"><a id="a2" href="${ contextPath }/admin/report">신고</a></button>
            <button id="button1"><a id="a3" href="${ contextPath }/admin/product">상품관리</a></button>
            <button id="button1"><a id="a4" href="${ contextPath }/admin/member">회원관리</a></button>
            <button id="button1"><a id="a5" href="${ contextPath }/admin/FAQ">FAQ/문의</a></button>
            <button id="button1"><a id="a6" href="${ contextPath }/admin/stats">통계</a></button>

        </div>
  
        <div id="div3">
            <div id="div3_1">
            <form action="${ contextPath }/admin/search" method="get">
            <label>ID</label>
            <select name="searchCondition" id="option1">
                <option value="common" <c:if test="${ param.searchCondition == 'common' }">selected</c:if>>일반</option>
                <option value="business" <c:if test="${ param.searchCondition == 'business' }">selected</c:if>>비즈</option>
              </select>
            <input type="search" name="searchValue" value="${ param.searchValue }">
            <button id="createButton1">검색</button><br>
            </form>
              </div>

            <label>가입일</label>
            
            <input type="date" id="option1" name="date1">
            <label>~</label>
            <input type="date" name="date2">
        </div>

        <div id="div4">
            <table id="table1">
                <thead>
                  <tr style="background-color: #F1FCFF;">
                    <th>닉네임</th><th>아이디</th><th>비즈니스</th><th>휴대폰</th><th>이메일</th><th>가입일</th><th></th>
                  </tr>
                </thead>
                <tbody>
                  
                  <c:forEach var="m" items="${ list }">
               <tr id="tr_hover2" >
                  <td>${ m.nickname }</td>
                  <td>${ m.user_id }</td>
                  <td>${ m.is_business }</td>
                  <td>${ m.phone }</td>
                  <td>${ m.email }</td>
                  <td>${ m.enroll_date }</td>
                  <td><button type="button" id="createButton2" onclick="selectMemberDetail('${m.user_id}')">보기</button></td>
               </tr>
            </c:forEach>
                  
                  
                </tbody>
                
            
				
              </table>


        </div>
        <div id="div5">
            <div id="pageArea">
           <c:if test="${pi.currentPage <= 0}">
            <a> &lt;&lt;&nbsp; </a>
            </c:if>
             <c:if test="${pi.currentPage > 0}">
            	<c:url var="start" value="/admin/member">
            		<c:param name="page" value="1"/>
            	</c:url>
           		 <a href="${ start }"> &lt;&lt;&nbsp; </a>
            </c:if>
             <c:if test="${pi.currentPage <= pi.startPage}">
            <a> &lt;&nbsp; </a>
            </c:if>
             <c:if test="${pi.currentPage > pi.startPage }">
            	<c:url var="before" value="/admin/member">
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
					<c:url var="pagination" value="/admin/member">
						<c:param name="page" value="${ p }" />
					</c:url>
					<a href="${ pagination }">${ p }</a> &nbsp;
				</c:if>
			</c:forEach>
			<c:if test="${pi.currentPage  >= pi.maxPage}">
            <a> &gt;&nbsp; </a>
            </c:if>
            <c:if test="${pi.currentPage < pi.maxPage }">
            	<c:url var="after" value="/admin/member">
            		<c:param name="page" value="${pi.currentPage +1}"/>
            	</c:url>
           		 <a href="${ after }"> &gt;&nbsp; </a>
            </c:if>
            <c:if test="${pi.currentPage >= pi.maxPage }">
            <a> &gt;&gt;&nbsp; </a>
            </c:if>
            <c:if test="${pi.currentPage < pi.maxPage  }">
            	<c:url var="end" value="/admin/member">
            		<c:param name="page" value="${pi.endPage}"/>
            	</c:url>
           		 <a href="${end}"> &gt;&gt;&nbsp; </a>
            </c:if>
 
         </div>

         </div>
    </section>

    <jsp:include page="../common/footer.jsp"/>

<script>
      function selectMemberDetail(user_id){
      	 console.log(user_id);
         location.href='${contextPath}/admin/memberdetail?user_id=' + user_id + '&page=${ pi.currentPage }';
         // => 상세 페이지 접근 시 기존 page 값도 파라미터로 전달
      }
   </script>

</body>
</html>