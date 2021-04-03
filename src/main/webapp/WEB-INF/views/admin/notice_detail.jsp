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
    <link href="${ contextPath }/resources/css/admin/admin_notice_detail.css?" rel="stylesheet" type="text/css">
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
            <label style="font-weight : bold; font-size: 20px;">글 제목</label>
            <input type="text" id="notice_title" name="notice_title" style="border-right: white; border-left: white; border-top: white;" size="100px" 
            value="믿을 수 있는 중고거래 굿바이 중고거래 페이지 공지사항입니다">
             </div>


        <div id="textareadiv">
            <label id="label2" style="font-weight : bold; font-size: 20px; text-align: top;">글 내용</label>
            <textarea id="notice_content" name="notice_content" >안녕하세요 !</textarea>
<br>
        
            <button id="createButton">
                수 정
            </button>
            <button id="createButton">
                삭 제
            </button>
            
        </div>


        
    </section>

     <jsp:include page="../common/footer.jsp"/>


</body>
</html>