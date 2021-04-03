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
            <button id="button1"><a id="a5" href="${ contextPath }/admin/FAQ">FAQ</a></button>
            <button id="button1"><a id="a6" href="${ contextPath }/admin/stats">통계</a></button>

        </div>

        <div id="div3">
            <div id="div3_1">
            <label>ID</label>
            <select name='value' id="option1">
                <option value='1'  selected>일반</option>
                <option value='2'>비즈</option>
              </select>
            <input type="text">
            <button id="createButton1">검색</button><br>
              </div>

            <label>가입일</label>
            
            <input type="date" id="option1">
            <label>~</label>
            <input type="date">
        </div>

        <div id="div4">
            <table id="table1">
                <thead>
                  <tr style="background-color: #F1FCFF;">
                    <th>회원번호</th><th>이름</th><th>아이디</th><th>휴대폰</th><th>이메일</th><th>가입일</th><th></th>
                  </tr>
                </thead>
                <tbody>
                  <tr id="tr_hover1">
                    <th>1</th><th>김수민</th><th>sumin1234</th><th>010-2231-9173</th><th>compu9173@naver.com</th><th>2021/03/06</th><th><button id="createButton2" onclick="location.href='${ contextPath }/admin/memberdetail'">보기</button></th>
                  </tr>
                  <tr id="tr_hover2">
                    <th>2</th><th>권세희</th><th>sehee6789</th><th>010-1234-1234</th><th>s@naver.com</th><th>2021/02/07</th><th><button id="createButton2">보기</button></th>
                  </tr>
                  <tr id="tr_hover1">
                    <th>3</th><th>정희준</th><th>gea1453</th><th>010-5234-3564</th><th>asdqwd@naver.com</th><th>2021/04/08</th><th><button id="createButton2">보기</button></th>
                  </tr>
                  <tr id="tr_hover1">
                    <th>4</th><th>임홍규</th><th>rht746</th><th>010-2453-4756</th><th>crfgwe@naver.com</th><th>2021/02/08</th><th><button id="createButton2">보기</button></th>
                  </tr>
                  <tr id="tr_hover2">
                    <th>5</th><th>윤세홍</th><th>nfgyuj4756</th><th>010-6254-6857</th><th>nsfgrea@naver.com</th><th>2021/01/04</th><th><button id="createButton2">보기</button></th>
                  </tr>
                  <tr id="tr_hover1">
                    <th>6</th><th>최준</th><th>dntghg1234</th><th>010-0896-6978</th><th>fweajytd@naver.com</th><th>2021/03/06</th><th><button id="createButton2">보기</button></th>
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