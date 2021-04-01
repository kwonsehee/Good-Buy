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
    <link href="${ contextPath }/resources/css/admin/admin_product.css?" rel="stylesheet" type="text/css">
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
            <button id="button1"><a id="a5" href="${ contextPath }/admin/FAQ">FAQ</a></button>
            <button id="button1"><a id="a6" href="${ contextPath }/admin/stats">통계</a></button>

        </div>

        <div id="div3">
            <label id="la1">상품 이름</label><input type="text" id="text1">
            <label id="la1">판매자 명</label><input type="text" id="text1">
            <button id="createButton">검 색</button>

        </div>

        <div id="div4">
            <table id="table1">
                <thead>
                  <tr style="background-color: #F1FCFF;">
                    <th>상품명</th><th></th><th>판매가</th><th>등록일</th><th>판매자</th><th>지역</th><th></th>
                  </tr>
                </thead>
                <tbody>
                  <tr id="tr_hover1" onclick="location.href='${ contextPath }/admin/productdetail'">
                    <th><img src="${ contextPath }/resources/images/admin/닌텐.png" id="src1"></th><th>닌텐도</th><th>400,000</th><th>2021/03/06</th><th>김수민</th><th>경기</th><th></th>
                  </tr>
                  <tr id="tr_hover2" onclick="location.href='${ contextPath }/admin/productdetail'">
                    <th><img src="images/에어.png" id="src1"></th><th>에어팟</th><th>100,000</th><th>2021/03/06</th><th>정희준</th><th>인천</th><th><button id="createButton1">상품 정지</button></th>
                  </tr>
                  <tr id="tr_hover2" onclick="location.href='${ contextPath }/admin/productdetail'">
                    <th><img src="images/아이패드.jpg" id="src1"></th><th>아이패드</th><th>700,000</th><th>2021/03/07</th><th>권세희</th><th>인천</th><th><button id="createButton1">신고 처리</button></th>
                  </tr>
                  <tr id="tr_hover2" onclick="location.href='${ contextPath }/admin/productdetail'">
                    <th><img src="images/무스패딩.jpg" id="src1"></th><th>무스너클 패딩</th><th>400,000</th><th>2021/03/07</th><th>윤세홍</th><th>경기</th><th></th>
                  </tr>
                  
                  
                </tbody>
              </table>

        </div>
        <div id="div5">
            <p><<&nbsp; <&nbsp; 1&nbsp; 2&nbsp; 3&nbsp; 4&nbsp; 5&nbsp; >&nbsp;>></p>
 
         </div>
    </section>

    <jsp:include page="../common/footer.jsp"/>


</body>
</html>