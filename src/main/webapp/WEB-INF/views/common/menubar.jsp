<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 메뉴바는 어떤 페이지이든 포함하고 있으므로 contextPath 변수 선언 후 application에서 모두 사용 -->
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Good-Buy</title>
<!--jQuery-->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<!-- 공통 UI -->
<link href="${ contextPath }/resources/css/menustyle.css" rel="stylesheet" type="text/css">
 
</head>
<body>
<!-- 메세지가 있다면 출력하고 지우기 -->
   <c:if test="${ !empty msg }">
   		<script>alert('${ msg }')</script>
   		<c:remove var="msg" />
   </c:if>
   
   <header id="gbHeader">
        <div class="nav_container">
            <ul class="common_ul">
                <li class="li_1">
                    <img src="${ contextPath }/resources/images/menu.png" id="menuicon" onclick="showNavi()">
                </li>
                <li class="li_2"><a href="common.html"><img src="${ contextPath }/resources/images/logo.png" id="mainLogo"></a></li>
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
                    <li><a href="#">중고거래</a></li>
                    <li><a href="#">내근처</a></li>
                    <li><a href="#">동네생활</a></li>
                    <li><a href="#">공지사항</a></li>
                    <li><a href="#">고객센터</a></li>
                    <li><a href="mypageMain.html">마이페이지</a></li>
                    <li> <a href="#">관리자페이지</a></li>
                    <li><a href="#">로그아웃</a></li>
                </ul>
            </div>
        </div>
    </header>

    <section id="gbSection">
    
    
     </section>
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
	

	<script>
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
    
	<!-- Optional JavaScript; choose one of the two! -->  
    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>

    
</body>
</html>