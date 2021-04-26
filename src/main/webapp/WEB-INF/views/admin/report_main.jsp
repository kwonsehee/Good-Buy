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
    <link href="${ contextPath }/resources/css/admin/admin_report.css?" rel="stylesheet" type="text/css">
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
        <p>상품 신고</p>
            <table id="table1">
                <thead>
                  <tr>
                    <th>신고 번호</th><th>신고 제목</th><th>신고 대상자</th><th>신고 내용</th><th>신고 상태</th>
                  </tr>
                </thead>
                <tbody>
                  
                  <c:forEach var="r" items="${ list1 }">
               
               <tr id="tr_hover1" onclick="selectReport(${r.re_no})">
                    <th>${ r.re_no }</th><th>${ r.retitle }</th><th>${ r.reported_id }</th><th>${ r.re_content }</th>
                    <c:if test="${ r.re_result == 'Y' }">
						<th><button id="createButton" disabled>처리 완료</button></th>
					</c:if>
					<c:if test="${ r.re_result == 'N' }">
						<th><button id="createButton" disabled>처리 전</button></th>
					</c:if>
                    
                  </tr>
            </c:forEach>
                  
                </tbody>
              </table>


        </div>




        <div id="div3">
            
        <p>회원 신고</p>
            <table id="table1">
                <thead>
                  <tr>
                    <th>신고 번호</th><th>신고 제목</th><th>신고 대상자</th><th>신고 내용</th><th>신고 상태</th>
                  </tr>
                </thead>
                <tbody>
                  
                  <c:forEach var="r" items="${ list2 }">
               
               <tr id="tr_hover1" onclick="selectReport(${r.re_no})">
                     <th>${ r.re_no }</th><th>${ r.retitle }</th><th>${ r.reported_id }</th><th>${ r.re_content }</th>
                    <c:if test="${ r.re_result == 'Y' }">
						<th><button id="createButton" disabled>처리 완료</button></th>
					</c:if>
					<c:if test="${ r.re_result == 'N' }">
						<th><button id="createButton" disabled>처리 전</button></th>
					</c:if>
                    
                  </tr>
            </c:forEach>
                  
                </tbody>
              </table>


      
            
        </div>


        <div id="div3">
        <p>내 동네 게시글 신고</p>
            <table id="table1">
                <thead>
                  <tr>
                    <th>신고 번호</th><th>신고 제목</th><th>신고 대상자</th><th>신고 내용</th><th>신고 상태</th>
                  </tr>
                </thead>
                <tbody>
                  
                  <c:forEach var="r" items="${ list3 }">
               
               <tr id="tr_hover1" onclick="selectReport(${r.re_no})">
                    <th>${ r.re_no }</th><th>${ r.retitle }</th><th>${ r.reported_id }</th><th>${ r.re_content }</th>
                    <c:if test="${ r.re_result == 'Y' }">
						<th><button id="createButton" disabled>처리 완료</button></th>
					</c:if>
					<c:if test="${ r.re_result == 'N' }">
						<th><button id="createButton" disabled>처리 전</button></th>
					</c:if>
                    
                  </tr>
            </c:forEach>
                  
                </tbody>
              </table>


        </div>
    </section>

    <jsp:include page="../common/footer.jsp"/>
<script>
      function selectReport(re_no){
         location.href='${contextPath}/admin/reportdetail?re_no=' + re_no + '&page=${ pi.currentPage }';
         // => 상세 페이지 접근 시 기존 page 값도 파라미터로 전달
      }
   </script>

</body>
</html>