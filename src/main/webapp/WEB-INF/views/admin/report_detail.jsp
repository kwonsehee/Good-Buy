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
    <link href="${ contextPath }/resources/css/admin/admin_report_detail.css?" rel="stylesheet" type="text/css">
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
            <table id="table1">
                <thead>
                  <tr>
                    <th>신고 번호</th><th>신고 제목</th><th>신고 대상자</th><th>신고 내용</th><th>신고 상태</th>
                  </tr>
                </thead>
                <tbody>
                  <tr id="tr_hover1" onClick="location.href='admin_report_detail.html'">
                    <th>${ report.re_no }</th><th>${ report.retitle }</th><th>${ report.reported_id }</th><th>${ report.re_content }</th>
                    <c:if test="${ report.re_result == 'Y' }">
						<th><button id="createButton" disabled>처리 완료</button></th>
					</c:if>
					<c:if test="${ report.re_result == 'N' }">
						<th><button id="createButton" disabled>처리 전</button></th>
					</c:if>
                  </tr>
                  
                  
                  
                </tbody>
              </table>


        </div>




        <div id="div4">
            <div id="div4_1">
              <div id="div4_1_1">
            <label id="la1">상품 정보</label><br>
            <label id="la2">상품 번호 ${ report.gno }</label><br>
          </div>
          <div id="div4_1_2">
            <img id="src1" src="${ contextPath }/resources/images/goodupload/${report.change_name}"><br>
            
            </div>
            

            </div>

            <div id="div4_2">
              <div id="div4_2_1">
                <label id="la1">신고 정보</label><br>
                <label id="la2">신고 번호 ${ report.re_no }</label><br>
              </div>
                <div id="div4_2_2">
                <label id="la3" class="la3_1">신고 내용</label><br>
                <label id="la3">${ report.re_content }<br></label><br>
                </div>
                
                
              

            </div>
    
        </div>
        <div id="div5">
          <button id="createButton2" onclick="location.href='${ contextPath }/admin/goodsdetail?gno=${ report.gno }'">상품 상세</button>
          <form action="${ contextPath }/admin/reportupdate" id="writeForm" method="post">
          <input type="hidden" name="re_no" value="${ report.re_no }"/>
          <input type="hidden" name="reported_id" value="${ report.reported_id }">
          <input type="hidden" name="re_result" value="Y"/>
          <button id="createButton2">신고 처리</button>
          </form>


        </div>


       
    </section>

     <jsp:include page="../common/footer.jsp"/>


</body>
</html>