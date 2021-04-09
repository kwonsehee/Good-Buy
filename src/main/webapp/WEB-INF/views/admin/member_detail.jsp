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
    <link href="${ contextPath }/resources/css/admin/admin_member_detail.css?" rel="stylesheet" type="text/css">
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

        

        <div id="div4">
            <table id="table1">
                <thead>
                  <tr >
                    <th>닉네임</th><th>아이디</th><th>포인트</th><th>휴대폰</th><th>이메일</th><th>가입일</th>
                  </tr>
                </thead>
                <tbody>
                  <tr id="tr_hover1" style="background-color: #F1FCFF;">
                    <th>${ member.nickname }</th><th>${ member.user_id }</th><th>${ member.point }</th><th>${ member.phone }</th><th>${ member.email }</th><th>${ member.enroll_date }</th>
                  </tr>
                
                </tbody>
              </table>


        </div>
        <form action="${ contextPath }/admin/memberupdate" id="writeForm" method="post">
        <div id="div5">
            
            <div id="div5_1">
            
                <table>
                    <tr height="80">
                        <td>아이디</td><td><input type="text" id="label1" name="user_id" style="border-right: white; border-left: white; border-top: white;" size="30px" 
            value="${ member.user_id }" readonly></td>
                    </tr>
                    <tr height="80">
                        <td>닉네임</td><td><input type="text" id="label1" name="notice_title" style="border-right: white; border-left: white; border-top: white;" size="30px" 
            value="${ member.nickname }" readonly></td>
                    </tr>
                    <tr height="80">
                        <td>휴대전화</td><td><input type="text" id="label1" name="notice_title" style="border-right: white; border-left: white; border-top: white;" size="30px" 
            value="${ member.phone }" readonly></td>
                    </tr>
                    <tr height="80">
                        <td>이메일</td><td><input type="text" id="label1" name="notice_title" style="border-right: white; border-left: white; border-top: white;" size="30px" 
            value="${ member.email }" readonly></td>
                    </tr>
                    <tr height="80">
                        <td>관리자 메모</td><td><input type="text" id="label1" name="admin_memo" style="border-right: white; border-left: white; border-top: white;" size="30px" 
            value="${ member.admin_memo }" ></td>
                    </tr>
                    
                </table>
            </div>
            <div id="div5_2">
            
              <table>
              
                <tr height="80">
                    <td>비밀번호</td><td><input type="text" id="label1" name="notice_title" style="border-right: white; border-left: white; border-top: white;" size="30px" 
        value="${ member.user_pwd }" readonly></td>
                </tr>
                <tr height="80">
                  <td>회원등급</td>
                  <c:choose>
      			<c:when test="${ member.is_business == 'Y' }">
      			<td>
                  <input type="text" id="label1" name="notice_title" style="border-right: white; border-left: white; border-top: white;" size="30px" value="비즈니스">
                  </td>
      			</c:when>
      			<c:when test="${ member.is_business == 'N' }">
      			<td>
      			 <input type="text" id="label1" name="notice_title" style="border-right: white; border-left: white; border-top: white;" size="30px" value="일반">
      			 </td>
      			</c:when>
      			</c:choose>
              </tr>
              <tr height="80">
                <td>포인트</td><td><input type="text" id="label1" name="point" style="border-right: white; border-left: white; border-top: white;" size="30px" 
    value="${ member.point }"></td>
            </tr>
             </table>
                <button id="createButton1"  type="submit">수정/확인</button>
                
                <button id="createButton1" onClick="location.href='admin_member.html'">목록</button>
            </div>
        </div>
        </form>
    </section>

    <jsp:include page="../common/footer.jsp"/>

</body>
</html>