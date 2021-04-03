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
            <button id="button1"><a id="a5" href="${ contextPath }/admin/FAQ">FAQ</a></button>
            <button id="button1"><a id="a6" href="${ contextPath }/admin/stats">통계</a></button>

        </div>

        <div id="div3">
            <table id="table1">
                <thead>
                  <tr>
                    <th>신고 번호</th><th>분류</th><th>신고 작성자</th><th>신고 내용</th><th>신고 상태</th>
                  </tr>
                </thead>
                <tbody>
                  <tr id="tr_hover1" onclick="location.href='${ contextPath }/admin/reportdetail'">
                    <th>1</th><th>글 신고</th><th>최준</th><th>이 글은 사기 글 같아요</th><th><button id="createButton" disabled>처리 완료</button></th>
                  </tr>
                  <tr id="tr_hover2" onClick="location.href='admin_report_detail.html'">
                    <th>2</th><th>회원 신고</th><th>무야호 할아버지</th><th>기분이 좋지않은 회원입니다</th><th><button id="createButton" disabled>처리 전</button></th>
                  </tr>
                  
                  
                </tbody>
              </table>


        </div>




        <div id="div4">
            
            
        </div>


        <div id="div5">
           <p><<&nbsp; <&nbsp; 1&nbsp; 2&nbsp; 3&nbsp; 4&nbsp; 5&nbsp; >&nbsp;>></p>

        </div>
    </section>

    <jsp:include page="../common/footer.jsp"/>


</body>
</html>