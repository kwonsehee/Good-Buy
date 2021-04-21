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
    <link href="${ contextPath }/resources/css/admin/admin_product_detail.css?" rel="stylesheet" type="text/css">
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
             <form action="${ contextPath }/admin/productsearch" method="get">
        <select name="searchCondition" id="option1">
                <option value="proname" <c:if test="${ param.searchCondition == 'proname' }">selected</c:if>>상품명</option>
                <option value="username" <c:if test="${ param.searchCondition == 'username' }">selected</c:if>>판매자 명</option>
              
            </select>
            <input type="search" name="searchValue" value="${ param.searchValue }">
            <button id="createButton">검 색</button>
		</form>

        </div>

        <div id="div4">
            <table id="table1">
                <thead>
                  <tr style="background-color: #F1FCFF;">
                    <th>상품명</th><th></th><th>판매가</th><th>등록일</th><th>판매자</th><th>상품 번호</th><th></th><th></th><th></th>
                  </tr>
                </thead>
                <tbody>
                  <c:choose>
                  <c:when test="${ goods.gstatus == 'Y' }">
                  <tr id="tr_hover2"  style="background-color: rgb(182, 228, 255);">
                    <th><img src="${ contextPath }/resources/images/goodupload/${ goods.changeName }" id="src1"></th><th>${ goods.gtitle }</th><th>${ goods.gprice }</th><th>${goods.createDate}</th><th>${goods.user_id }</th><th colspan="3">${goods.gno }</th><th><button id="createButton1">신고 처리</button></th>
                  </tr>
                 <tr style="height: 200px; font-size: 30px;">
                    <th></th><th></th><td>상품신고 처리</td><td><input type="checkbox"  style="width:40px;height:40px;" checked></td><td>상품판매 정지</td><td><input type="checkbox"  style="width:40px;height:40px;"><td><th></th><th></th>
                 </tr>
                 </c:when>
                 <c:when test="${ goods.gstatus == 'N' }">
                 <tr id="tr_hover2"  style="background-color: rgb(182, 228, 255);">
                    <th><img src="${ contextPath }/resources/images/goodupload/${ goods.changeName }" id="src1"></th><th>${ goods.gtitle }</th><th>${ goods.gprice }</th><th>${goods.createDate}</th><th>${goods.user_id }</th><th colspan="3">${goods.gno }</th><th></th>
                  </tr>
                 <tr style="height: 200px; font-size: 30px;">
                    <th></th><th></th><td>상품신고 처리</td><td><input type="checkbox"  style="width:40px;height:40px;" checked></td><td>상품판매 정지</td><td><input type="checkbox"  style="width:40px;height:40px;"><td><th></th><th></th>
                 </tr>
                 </c:when>
                 
                 </c:choose>
                  
                  
                </tbody>
              </table>

        </div>
        <div id="div5">
            <button id="createButton">확 인</button>
 
         </div>
    </section>

    <jsp:include page="../common/footer.jsp"/>

</body>
</html>