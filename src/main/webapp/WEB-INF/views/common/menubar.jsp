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
<link href="${ contextPath }/resources/css/menustyle.css?" rel="stylesheet" type="text/css">
 
</head>
<body>
<!-- 메세지가 있다면 출력하고 지우기 -->
  <%--  <c:if test="${ !empty msg }">
   		<script>alert('${ msg }')</script>
   		<c:remove var="msg" />
   </c:if> --%>
   
   <header id="gbHeader">
        <div class="nav_container">
            <ul class="common_ul">
                <li class="li_1">
                   <div><img src="${ contextPath }/resources/images/menu.png" id="menuicon" onclick="showNavi()"></div> 
                </li>
                <li class="li_2"><a href="${ contextPath }"><img src="${ contextPath }/resources/images/logo.png" id="mainLogo"></a></li>
                <li class="li_3">
                <form action="${ contextPath }/goods/search" method="get">
                    <input type="text" id="searchbox" name="search" placeholder="중고 매물을 검색하세요!" style=" color:#05AAD1;">
                    <button type="submit">검색</button>
                </form>
                </li>
                <!-- 내 동네 선택 : 로그인 시에만 나타나야 함  -->
                <c:if test="${ !empty sessionScope.loginUser }">
	                <li class="userTownli">
	                <c:if test="${ mtlist.size() == 1 }">
	                	<p>${ mtlist.get(0) }</p>
	                	<p>내 동네 설정</p>
	           		</c:if>
	               	<c:if test="${ mtlist.size() == 2 }">
	                	<p>${ mtlist.get(0) }</p>
	                	<p>${ mtlist.get(1) }</p>
	                	<p>내 동네 설정</p> 
	           		</c:if>
	           		
	                </li>
	                <li class="userTownli2"><img src="${ contextPath }/resources/images/downarrow.png"></li>
                </c:if>
                <!-- 로그아웃 시에도 메뉴바 레이아웃 비율 같아야 함 비어있는 li -->
                <c:if test="${ empty sessionScope.loginUser }">
	           		 <li class="userTownli"></li>
	                <li class="userTownli2"><img src="${ contextPath }/resources/images/downarrow.png" style="opacity:0;"></li>
               </c:if> 
               
                <li class="li_4">
                <!-- 1. 로그인 유저가 없을 때 -->
                <c:if test="${ empty sessionScope.loginUser }">
                <a data-bs-toggle="modal" data-bs-target="#loginModal"><img src="${ contextPath }/resources/images/person.png" id="person"></a>
                </c:if>
                <!-- 2. 로그인 유저가 있을 때(일반회원)-->
                <c:if test="${ !empty sessionScope.loginUser }">
                <a href="${ contextPath }/mypage/main"><img src="${ contextPath }/resources/images/person.png" id="person"></a>
                </c:if>
                </li>
                <li class="li_5"><a href="${ contextPath }/mypage/dealHistoryList"><img src="${ contextPath }/resources/images/truck.png" id="truck"></a></li>
                <li class="li_6"><a href="#"><img src="${ contextPath }/resources/images/alarm.png" id="alarm"></a></li>
                <li class="li_7"><a href="${ contextPath }/mypage/likeGoodsList"><img src="${ contextPath }/resources/images/heart.png" id="heart"></a></li>
            </ul>

            <div class="sidebar">
                <div class="topWrap">
                <ul class="sidebarUserInfo">
                	<li> <button onclick="closeNavi()">X</button> </li>
                	 <!-- 1. 로그인 유저가 없을 때 -->
                	   <c:if test="${ empty sessionScope.loginUser }">
                	   <p>로그인을 해주세요  :)</p>
                	   </c:if>
                	  <!-- 2. 로그인 유저가 있을 때(일반회원)-->
                	 <c:if test="${ !empty sessionScope.loginUser }">
                	<li> 
                		<!-- 프사 있을 때 -->
			            <c:if test="${ !empty loginUser.photo }">
			            <img src="${ contextPath }/resources/images/userProfilePhoto/${loginUser.photo}" id="loginUserPhoto">
			            </c:if>
			             <!-- 프사 없을 때 -->
			            <c:if test="${ empty loginUser.photo }">
			            <img src="${ contextPath }/resources/images/mypage/unknownUser.png" id="loginUserPhoto">
			            </c:if>
                	</li>
                	<li id="loinUserNickname">${ loginUser.nickname } 님</li>
                	<li><a href="${ contextPath }/member/logout" id="logoutText">로그아웃</a></li>
                	</c:if>
                </ul>
                   
                </div>      
                <ul class="menuUl">
                    <li><a href="${contextPath }/goods/list">중고거래</a></li>
                    <li><a href="${contextPath }/business/list">내근처</a></li>
                    <li><a href="#">동네생활</a></li>
                    <li><a href="#">공지사항</a></li>
                    <li><a href="${ contextPath }/center/join">고객센터</a></li>
                   
                     <c:if test="${ !empty sessionScope.loginUser }">
                    <li><a href="${ contextPath }/mypage/main">마이페이지</a></li>
                    </c:if>
                    <c:if test="${ empty sessionScope.loginUser }">
                    <li><a href="#" onclick="alert('로그인을 해주세요 :)')">마이페이지</a></li>
                    </c:if>
                    
                    <li><a href="${ contextPath }/admin/join">관리자페이지</a></li>
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




	<script>
		function closeNavi() {
			$(".sidebar").css("left", "-300px");
		}
		function showNavi() {
			$(".sidebar").css("left", "0px");
		}
		
		
		/* 메뉴바 내동네(화살표 아이콘)누르면 하단에 나오게 */
		$(document).ready(function(){
			$(".userTownli2").click(function(){
				if($(".userTownli p:nth-last-child(1)").css("display") == "none"){
					$(".userTownli p").slideDown(350);
				}else{
					$(".userTownli p:nth-child(2)").slideUp(350);
					$(".userTownli p:nth-last-child(1)").slideUp(350);
				}
			});
			$(".userTownli").click(function(){
				if($(".userTownli p:nth-last-child(1)").css("display") == "none"){
					$(".userTownli p").slideDown(350);
				}else{
					$(".userTownli p:nth-child(2)").slideUp(350);
					$(".userTownli p:nth-last-child(1)").slideUp(350);
				}
			});
			
			
			$("#gbSection").click(function(){
				/* 섹션 부분 누르면 메뉴바 내동네 리스트 닫힘 */
				/* if($(".userTownli p:nth-last-child(1)").css("display") != "none"){
					$(".userTownli p:nth-child(2)").slideUp(350);
					$(".userTownli p:nth-last-child(1)").slideUp(350);
				} */
				/* 섹션 부분 누르면 사이드바 닫힘 */
				if($(".sidebar").css("left") == "0px"){
					$(".sidebar").css("left", "-300px");
				}
			});
		});
		
		/* 메뉴바에서 동네 바꾸기(ajax) */
		$(".userTownli p:nth-child(2)").click(function(){
			var townName = event.target.innerText;
		
			var contextPath = "${pageContext.request.requestURI}";
			
			console.log(contextPath);
			
			
			if(townName =="내 동네 설정"){
				location.href="${contextPath}/mypage/setMyTown";
			} else{
				location.href= "${contextPath}/mypage/changeTownType2?contextPath="+contextPath;
			}
			
		});
		
		// 메뉴 아이콘 hover 효과
		$("#menuicon").mouseenter(function(){
			$(".li_1 div").css({"background":"#e9eef0","border-radius":"50px"});
		});
		
		$("#menuicon").mouseleave(function(){
			$(".li_1 div").css({"background":"#fff"});
		});
		
	</script>
    
	<!-- Optional JavaScript; choose one of the two! -->  
    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>

    
</body>
</html>