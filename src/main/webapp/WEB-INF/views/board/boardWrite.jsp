<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>


<%-- 공통UI --%>
<link href="${ contextPath }/resources/css/menustyle.css" rel="stylesheet" type="text/css">

<title>글쓰기</title>
<script>
$(document).ready(function() {
	  $('#summernote').summernote({
 	    	placeholder: 'content',
	        minHeight: 370,
	        maxHeight: null,
	        focus: true, 
	        lang : 'ko-KR'
	  });
	});
</script>

<!-- <script>
		function loginPopup() {
			window.open("loginForm.html", "PopupWin", "width=500,height=600");
		}
		function closeNavi() {
			$(".sidebar").css("left", "-300px");
		}

		function showNavi() {
			$(".sidebar").css("left", "0px");
		}


    </script>
     -->
<style>
#writeBtn{ 
    position:relative;
    margin-bottom: 10%;
    left: 67%;
    top: 20px;
    margin-left: 23%; 
    display: inline-block;
     width: 130px;
     height: 45px;
     border-radius: 27px;
     font-size: 14px;
     background-color: #000000;
     border: 0px;
   color : white;
   }
   .subject{
     position:relative;
   bottom:14px;
  font-size: 18px;
  
   margin-left:50px;
   }
   #sub{
    position:relative;
    top:20px;

   }
   #tt{
    position:relative;
    top:35px;
    font-size:25px;
    
   }
   #ts{
    position:relative;
   left: 4%;
    top: 7px;
    
   }
  
</style>
</head>
<body>
 <header id="gbHeader">
        <div class="nav_container">
            <ul class="common_ul">
                <li class="li_1">
                    <img src="${ contextPath }/resources/images/menu.png" id="menuicon" onclick="showNavi()">
                </li>
                <li class="li_2"><a href="${ contextPath }"><img src="${ contextPath }/resources/images/logo.png" id="mainLogo"></a></li>
                <li class="li_3">
                    <input type="text" id="searchbox" placeholder="중고 매물을 검색하세요!" style=" color:#05AAD1;">
                    <button type="submit">검색</button>
                </li>
                <li class="li_4">
                <!-- 1. 로그인 유저가 없을 때 -->
                <c:if test="${ empty sessionScope.loginUser }">
                <a data-bs-toggle="modal" data-bs-target="#loginModal"><img src="${ contextPath }/resources/images/person.png" id="person"></a>
                </c:if>
                <!-- 2. 로그인 유저가 있을 때(일반회원)-->
                <c:if test="${ !empty sessionScope.loginUser }">
                <p>${ loginUser.nickname }님 </p>
                <p onclick="location.href='${ contextPath }/member/logout'">log out</p>
                </c:if>
                </li>
                <li class="li_5"><a href="#"><img src="${ contextPath }/resources/images/truck.png" id="truck"></a></li>
                <li class="li_6"><a href="#"><img src="${ contextPath }/resources/images/alarm.png" id="alarm"></a></li>
                <li class="li_7"><a href="#"><img src="${ contextPath }/resources/images/heart.png" id="heart"></a></li>
            </ul>

            <div class="sidebar">
                <div class="topWrap">
                    <button onclick="closeNavi()">X</button>
                </div>      
                <ul>

                    <li><a href="${contextPath }/goods/list">중고거래</a></li>
                    <li><a href="${contextPath }/business/list">내근처</a></li>
                    <li><a href="${contextPath }/board/main">동네생활</a></li>
                    <li><a href="#">공지사항</a></li>
                    <li><a href="${ contextPath }/center/join">고객센터</a></li>
                    <li><a href="${ contextPath }/mypage/main">마이페이지</a></li>
                    <li><a href="${ contextPath }/admin/join">관리자페이지</a></li>
                    <li><a href="#">로그아웃</a></li>
                </ul>
            </div>
        </div>
    </header>


	<!-- 로그인 Modal -->
	<div class="modal fade" id="loginModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<div class="titleWrap">
						<span class="circle"></span> <span class="welcome">Welcome!</span>
						<span class="circle"></span>
					</div>
				</div>

				
					<div class="modal-body">
						<div class="loginformWrap">
							<form action="${ contextPath }/member/login" method="post" id="loginForm">
								<input type="text" name="user_id" placeholder="ID"><br>
								<input type="password" name="user_pwd" placeholder="PASSWORD"><br>
								<p class="simLog_p">간편 로그인</p>
								<div class="imgWrap">
									<a href="#"><img src="${ contextPath }/resources/images/google.png"></a>
								    <a href="#"><img src="${ contextPath }/resources/images/kakao.png"></a> 
								    <a href="#"><img src="${ contextPath }/resources/images/facebook.png"></a>
								</div>
								<button type="submit" style="font-weight: bold;">Log in</button>
							</form>
							<p style="font-size: 14px;">
								아직 회원이 아니신가요? 
								<a href="${ contextPath }/member/join">회원가입</a>
							</p>
						</div>

					</div>
					<div class="modal-footer">
						<a href="${ contextPath }/member/find" id="find_id_pwd">아이디/비밀번호 찾기</a>
						<!-- 새 창 띄우기-->

						<button type="button" id="closeBtn" data-bs-dismiss="modal">닫기</button>
						
					</div>
			</div>
		</div>
	</div>

	<section id="gbSection">
		<h2 style="text-align: center;">글 작성</h2>
		<br>
		<br>
		<br> 
		
		<div style="width: 60%; margin: auto;">
	<form method="post" action="${contextPath }/board/insert">
		<input type="text" name="writer" style="width: 20%;" placeholder="작성자"/><br>
		<input type="text" name="title" style="width: 40%;" placeholder="제목"/>
		<br><br> 
		<textarea id="summernote" name="content"></textarea>
<button type="submit" style="float: right;">
글쓰기</button>
		
	</form>
 
</div>
		
		
		
<!--  
		<div style="width: 1264px; margin: auto;">
			<form method="post" action="${contextPath}/board/insert">
				<div id="title" style=" position:relative; 
    top: 40px;"><h4>제목:</h4></div>
				<input type="text" id="ts" name="titles"
					style="width: 40%; height: 20%;"> <br>

				<h4 id="sub">주제:</h4>
				
				<div class="subject">
					<input type="radio" id="radio1" name="catagoryc" value="일상">일상 
					<input type="radio" id="radio2" name="catagoryc" value="동물">동물 
					<input type="radio" id="radio3" name="catagoryc" value="맛집">맛집
					<input type="radio" id="radio4" name="catagoryc" value="기타">기타
				</div>
				<textarea id="summernote" name="content"></textarea>
				<button id="writeBtn" type="submit">작성 완료</button>


			</form>
		</div>
		-->
		
	</section>
	
	<br><br><footer id="gbFooter">
        <div class="footerbox">
            
            <table id="tb_footer">
                <tr>
                    <td rowspan="2"> <img src="${ contextPath }/resources/images/logo2.png" id="footer_logo"></td> 
                    <td><p id="footer1">믿을 수 있는 중고거래</p></td>
                    <td rowspan="2"><p class="footer2">고객문의 cs@goodbuy.com 제휴문의 contact@goodbuy.com<br>
                        지역광고 ad@goodbuy.com PR문의 pr@goodbuy.com<br>
                        사업자 등록번호 : 123-54-11234<br>
                        서울특별시 강남구 굿바이로 30길 20 606호<br>
                        ©Good-buy Market Inc.</p></td>
                </tr>
                <tr>
                    <td><p class="footer3">
                        중고 거래부터 동네 정보까지, 이웃과 함께 해요.<br>
                            가깝고 따뜻한 당신의 근처를 만들어요.</p></td>
                     
                </tr>

            </table>
        </div>
    </footer>
    <script>
function goWrite(frm) {
	var title = frm.title.value;
	var writer = frm.writer.value;
	var content = frm.content.value;
	
	if (title.trim() == ''){
		alert("제목을 입력해주세요");
		return false;
	}
	if (writer.trim() == ''){
		alert("작성자를 입력해주세요");
		return false;
	}
	if (content.trim() == ''){
		alert("내용을 입력해주세요");
		return false;
	}
	frm.submit();
}
</script>	
   </body>
   </html>