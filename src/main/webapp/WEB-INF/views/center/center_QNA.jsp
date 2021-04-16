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
     <link href="${ contextPath }/resources/css/admin/admin_membercenter_QNA.css?" rel="stylesheet" type="text/css">
  <style>
      
  </style>
</head>
<body>
     <jsp:include page="../common/menubar.jsp" />

    <section id="gbSection">


        <div id="div1">
            <h1 id="head1"><a href="${ contextPath }/center/join">고객센터</a></h1>
        </div>


        <div id="div2">
            
            <button id="button1"><a id="a1" href="${ contextPath }/center/join">공지사항</a></button>
            <button id="button1"><a id="a2" href="${ contextPath }/center/FAQ">FAQ</a></button>
            <button id="button1"><a id="a3" href="${ contextPath }/center/QNA">문의</a></button>
        </div>


        <div id="div3">
            <p style="font-size: 50px; font-family: 'Nanum Myeongjo', serif; font-weight: bold;">문의하기<br>
                <p style="font-size: 20px; font-family: 'Nanum Myeongjo', serif; padding-bottom: 30px;">어떠한 내용이라도 답변드릴 준비가 되어 있습니다!<br>
                    문의를 보내주세요! 가능한 한 빨리 답변 드리도록 하겠습니다.<br>
                </p>
                <button id="createButton1" onclick="location.href='${ contextPath }/center/QNA_Q'" style="margin-bottom: 30px;">질문하기</button><hr>
            </p>
            

        </div>
        <div id="div3_1">
            <p style="font-size: 30px; font-family: 'Nanum Myeongjo', serif; padding-top: 60px; font-weight: bold;">내 문의 내역</p>
        </div>



        <div id="div4">
            

              <table id="table1"> 
              
            <tr style="background-color: #F1FCFF;">
                <th>제목</th><th>아이디</th><th>문의 접수 번호</th><th>작성일</th><th>상태</th>
              </tr>

            <tbody>
            <c:forEach var="q" items="${ list }">  
              <tr id="tr_hover1" onclick="selectQNA(${q.qa_no})">
              <c:choose>
              <c:when test="${ q.qa_status == 'Y' }">
                <th>${ q.qa_title }</th><th>${ q.user_id }</th><th>${ q.qa_no }</th><th>${ q.qa_date }</th><th>답변 대기</th>
                </c:when>
                <c:when test="${ q.qa_status == 'N' }">
                <th>${ q.qa_title }</th><th>${ q.user_id }</th><th>${ q.qa_no }</th><th>${ q.qa_date }</th><th>답변 완료</th>
                </c:when>
                </c:choose>
            </tr>
			</c:forEach>
            
              
            </table> 
            
            
        </div>


                
                
                
               




     <script>
    $(document).ready(function(){
        // memu 클래스 바로 하위에 있는 a 태그를 클릭했을때
        $(".menu>a").click(function(){
            // 현재 클릭한 태그가 a 이기 때문에
            // a 옆의 태그중 ul 태그에 hide 클래스 태그를 넣던지 빼던지 한다.

        });
    });

    $(document).ready(function(){
        // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
        $(".menu>a").click(function(){
            var submenu = $(this).next("ul");
 
            // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
            if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
        });
    });

</script>
<script>
      function selectQNA(qa_no){
         location.href='${contextPath}/center/QNA_A?qa_no=' + qa_no + '&page=${ pi.currentPage }';
      }
   </script>
<jsp:include page="../common/footer.jsp" />


</body>
</html>