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

<!-- 구글로그인 -->  
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="1037543872234-n1umg3c5vhatclcmg0dodjhdar33s57u.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<title>Good-Buy</title>
<!--jQuery-->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<!-- naver 로그인 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<!-- 공통 UI -->
<link href="${ contextPath }/resources/css/menustyle.css?" rel="stylesheet" type="text/css">

</head>
<body>

   <header id="gbHeader">
        <div class="nav_container">
            <ul class="common_ul">
                <li class="li_1">
                   <div><img src="${ contextPath }/resources/images/menu.png" id="menuicon" onclick="showNavi()"></div> 
                </li>
                <li class="li_2"><a href="${ contextPath }"><img src="${ contextPath }/resources/images/logo.png" id="mainLogo"></a></li>
                <li class="li_3">
                <form action="${ contextPath }/goods/search" method="get">
                    <c:if test="${search eq null }">
                    <input type="text" id="searchbox" name="search" placeholder="중고 매물을 검색하세요!" style=" color:#05AAD1;">
                    </c:if>
                     <c:if test="${search ne null }">
                    <input type="text" id="searchbox" name="search" placeholder="중고 매물을 검색하세요!"  value="${search }" style=" color:#05AAD1;">
                    </c:if>
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
                
                <!-- 쪽지 -->
                <li class="li_5" id="msgContent">
                	<a onclick="msgPopup()">
                	<img src="${ contextPath }/resources/images/messenger.png" id="truck">
                	</a>
              
                </li>
                
                <li class="li_6" id="alarmContent">
                	<a onclick="alarmPopup();"style="border : 1px solid red;">
               			<img src="${ contextPath }/resources/images/alarm.png" id="alarm">
                	</a>
                </li>
                
                
                
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
                    <c:if test="${ !empty sessionScope.loginUser }">
                    <li><a href="${contextPath }/business/list">내근처</a></li>
                    </c:if>
                    <c:if test="${ empty sessionScope.loginUser }">
                    <li><a href="#" onclick="alert('로그인을 해주세요 :)');$('#loginModal').modal('show');">내근처</a></li>
                    </c:if>
                    <c:if test="${ !empty sessionScope.loginUser }">
                    <li><a href="${contextPath }/board/main">동네생활</a></li>
                    </c:if>
                    <c:if test="${ empty sessionScope.loginUser }">
                    <li><a href="#" onclick="alert('로그인을 해주세요 :)');$('#loginModal').modal('show');">동네생활</a></li>
                    </c:if>
                    
                    
                  
                    <li><a href="${ contextPath }/center/join">고객센터</a></li>
                   
                     <c:if test="${ !empty sessionScope.loginUser }">
                    <li><a href="${ contextPath }/mypage/main">마이페이지</a></li>
                    </c:if>
                    <c:if test="${ empty sessionScope.loginUser }">
                    <li><a href="#" onclick="alert('로그인을 해주세요 :)');$('#loginModal').modal('show');">마이페이지</a></li>
                    </c:if>
                    <c:if test="${ loginUser.user_type == 0 }">
                    <li><a href="${ contextPath }/admin/join">관리자페이지</a></li>
                    </c:if>
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
								
							<a href="https://kauth.kakao.com/oauth/authorize?client_id=5a7a733b7acbd667518c7886e00f1231&redirect_uri=http://localhost:8082/goodbuy/member/auth/kakao/callback&response_type=code">   
							<img src="${ contextPath }/resources/images/kakao_login.png" id="kakaoBtn"></a> 
									
							<div id = "naver_id_login"><a href="${url}">
							<img id="naver" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a>
							
							</div>
							</div>
								<button type="submit" id="loginBtn">Log in</button>
							</form>
							<p style="font-size: 14px;">
								아직 회원이 아니신가요? 
								<a href="${ contextPath }/member/join">회원가입</a>
							</p>
						</div>

					</div>
					<div class="modal-footer">
					
						<a href="${ contextPath }/member/find" id="find_id_pwd" style="color:black;">아이디/비밀번호 찾기</a>
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
		function alarm(user_id){
			console.log(user_id);
		}
		/* 쪽지관련 */
		$(document).ready(function(){
		if(${ !empty sessionScope.loginUser }){
			 $.ajax({
				   url : "${contextPath}/member/msgCount",
				  type : "post",
				  dataType : "json",
				  success : function(data){
					 console.log("쪽지관련"+data);
					 if(Object.keys(data).length>0){
					
						tableBody = $("#msgContent");
						
			            tableBody.html("");
						console.log("여기오니?");
						var a = "<a onclick='msgPopup()'><img src='${ contextPath }/resources/images/onmessenger.png' id='truck'></a>"; 
						a+="<div id='msgArea'>";
						for(var i in data){
						var m_no = data[i].mno;
						if(data[i].gno>0){
	                	a +="<div class='msgDiv' onclick='gotomsgDiv1(";
	                	a+=m_no;
	                	a+=")'>";
	                	
						}else{
							a +="<div class='msgDiv' onclick='gotomsgDiv2(";
		                	a+=m_no;
		                	a+=")'>";
							
						}
	                	a+="<span>";
	                	a+=data[i].caller;
	                	
	                	a+="님이 메세지를 보냈습니다.</span></div><button onclick='closemsgDiv(";
	                	a+=m_no;
	                	a+=")' id='deleteMsg'>X</button>";
	                	
	                	
						}
						a+="</div>"
						tableBody.append(a);
					 }else{
						 
					/* alert(data); */
					console.log(data);
					 }
	                     
				  }
             
				  
			});
		}
		});
		
		/* 알림관련 */
		$(document).ready(function(){
		if(${ !empty sessionScope.loginUser }){
			 $.ajax({
				   url : "${contextPath}/member/alram",
				  type : "post",
				  dataType : "json",
				  success : function(data){
					 console.log("새알림관련"+data);
					
					 if(Object.keys(data).length>0){
					 console.log("새알림길이"+Object.keys(data).length);
					
						tableBody = $("#alarmContent");
						
			            tableBody.html("");
						console.log("새알림관련 여기오니?");
						
						var a = "<a onclick='alarmPopup()'><img src='${ contextPath }/resources/images/alarm.png' id='alarm'></a>"; 
						a+="<div id='alarmArea'>";
						for(var i in data){
						var aType = data[i].alarm_type;
						console.log(aType);
						var goVal=data[i].ref_no;
						var ano =data[i].alarm_no;
						if(aType ==5||aType ==8||aType ==10 ){
						
	                	a +="<div class='alarmDiv' onclick='gotoGoodsDetail(";
	                	a+=goVal+","+ano;
	                	a+=")'>";
	                	
	                	a+="<img src='${ contextPath }/resources/images/goodupload/";
	                	a+=data[i].goods_thum;
	                	
	                	a+="' class='alarmImg'>";
	               
	                	
						}else if(aType==13 ||aType ==2){
							a +="<div class='alarmDiv' onclick='gotoReportDetail(";
		                	a+=ano;
		                	a+=")'>";
		                	
		                	a+="<img src='${ contextPath }/resources/images/goodupload/";
		                	a+=data[i].goods_thum;
		                	
		                	a+="' class='alarmImg'>";
		               
						}else if(aType==0 ){
							a +="<div class='alarmDiv' onclick='gotoQnADetail(";
		                	a+=goVal;
		                	a+=")'>";
		                	
						    
						}
						else if(aType==1 ){
							a +="<div class='alarmDiv' onclick='gotoReportDetail(";
						 	a+=ano;
		                	a+=")'>";
		                	
						    
						}else if(aType==3||aType==4 ){
							a +="<div class='alarmDiv' onclick='gotoBisDetail(";
		                	a+=ano;
		                	a+=")'>";
		                	
						    
						}else if(aType==11||aType==12 ){
							a +="<div class='alarmDiv' onclick='gotoSellerDetail(";
		                	a+=goVal;
		                	a+=")'>";
		                	
						    
						}
	                	a+="<span>";
	                	a+=data[i].alarm_content;
	                	
	                	a+="</span></div><button onclick='closealarmDiv(";
	                	a+=ano;
	                	a+=")' id='deleteAlarm'>X</button>";
	                	
						}
	                	a+="</div>";
	                	console.log("여기까지 출력하면끝!");
						tableBody.append(a);
						
					 }else{
						 
					/* alert(data); */
					console.log(data);
					 }
	                     
				  }
             
				  
			});
		}
	});
		function msgPopup(){
			var control = document.getElementById("msgArea");   
			if (control.style.display == 'block') {
	               control.style.display = 'none';
	           } else {
	               control.style.display = 'block';
	           }
    		
		}
		function alarmPopup(){
			var control3 = document.getElementById("alarmArea");   
			if (control3.style.display == 'block') {
	               control3.style.display = 'none';
	           } else {
	               control3.style.display = 'block';
	           }
    		
		}
		function closemsgDiv(mno){
			console.log(mno);
			 $.ajax({
				   url : "${contextPath}/member/checkMsg",
				  type : "post",
				  data : {mno : mno},
				  dataType : "json",
				  success : function(data){
					 console.log("쪽지확인함"+data);
					 if(Object.keys(data).length>0){
							
							tableBody = $("#msgContent");
				            tableBody.html("");
							console.log("여기오니?");
							var a = "<a onclick='msgPopup()'><img src='${ contextPath }/resources/images/onmessenger.png' id='truck'></a>"; 
							a+="<div id='msgArea'>";
							for(var i in data){
							var m_no = data[i].mno;
							if(data[i].gno>0){
								
							 	a +="<div onclick=\"location.href=\'${contextPath}/mypage/msgList\'\" class='msgDiv'>";
								}else{
									a +="<div onclick='' class='msgDiv'>";
								}
		                	a+="<span>";
		                	a+=data[i].caller;
		                	
		                	a+="님이 메세지를 보냈습니다.</span></div><button onclick='closemsgDiv(";
		                	a+=m_no;
		                	a+=")' id='deleteMsg'>X</button>";
		                	
		                	
							}
							a+="</div>"
							tableBody.append(a);
							
						 }else{
							 
						/* alert(data); */
						 }
					 var control2 = document.getElementById("msgArea");   
					control2.style.display = 'block';
						console.log(control2);
						console.log("display는 : "+ control2.style.display);
				  }
           
				  
			});
   		
		}
           
				
		function closealarmDiv(mno){
			console.log(mno);
			 $.ajax({
				   url : "${contextPath}/member/checkAlarm",
				  type : "post",
				  data : {mno : mno},
				  dataType : "json",
				  success : function(data){
						 console.log("새알림관련"+data);
						
						 if(Object.keys(data).length>0){
							 console.log("새알림길이"+Object.keys(data).length);
							
								tableBody = $("#alarmContent");
								
					            tableBody.html("");
								console.log("새알림관련 여기오니?");
								
								var a = "<a onclick='alarmPopup()'><img src='${ contextPath }/resources/images/alarm.png' id='alarm'></a>"; 
								a+="<div id='alarmArea'>";
								for(var i in data){
								var aType = data[i].alarm_type;
								console.log(aType);
								var goVal=data[i].ref_no;
								var ano =data[i].alarm_no;
								if(aType ==5||aType ==8||aType ==10 ){
								
			                	a +="<div class='alarmDiv' onclick='gotoGoodsDetail(";
			                	a+=goVal+","+ano;
			                	a+=")'>";
			                	
			                	a+="<img src='${ contextPath }/resources/images/goodupload/";
			                	a+=data[i].goods_thum;
			                	
			                	a+="' class='alarmImg'>";
			               
			                	
								}else if(aType==13 ||aType ==2){
									a +="<div class='alarmDiv' onclick='gotoReportDetail(";
				                	a+=ano;
				                	a+=")'>";
				                	
				                	a+="<img src='${ contextPath }/resources/images/goodupload/";
				                	a+=data[i].goods_thum;
				                	
				                	a+="' class='alarmImg'>";
				               
								}else if(aType==0 ){
									a +="<div class='alarmDiv' onclick='gotoQnADetail(";
				                	a+=goVal;
				                	a+=")'>";
				                	
								    
								}
								else if(aType==1 ){
									a +="<div class='alarmDiv' onclick='gotoReportDetail(";
								 	a+=ano;
				                	a+=")'>";
				                	
								    
								}else if(aType==3||aType==4 ){
									a +="<div class='alarmDiv' onclick='gotoBisDetail(";
				                	a+=ano;
				                	a+=")'>";
				                	
								    
								}else if(aType==11||aType==12 ){
									a +="<div class='alarmDiv' onclick='gotoSellerDetail(";
				                	a+=goVal;
				                	a+=")'>";
				                	
								    
								}
			                	a+="<span>";
			                	a+=data[i].alarm_content;
			                	
			                	a+="</span></div><button onclick='closealarmDiv(";
			                	a+=ano;
			                	a+=")' id='deleteAlarm'>X</button>";
			                	
								}
			                	a+="</div>";
							tableBody.append(a);
							
							var control4 = document.getElementById("alarmArea");   
							control4.style.display = 'block';
							
						 }else{
							 
						/* alert(data); */
						console.log(data);
						 }
		                     
		                     
				  }
           
				  
			});
   		
		}
		function gotomsgDiv1(mno){
			console.log(mno);
			closemsgDiv(mno);
			location.href='${contextPath}/mypage/msgList';
   		
		}
		function gotomsgDiv2(mno){
			console.log(mno);
			closemsgDiv(mno);
			location.href='${contextPath}/mypage/userMsgList';
   		
		}
		function gotoGoodsDetail(mno, ano){
			console.log("여기오니?"+mno);
			console.log("여기오니?"+ano);
			closealarmDiv(ano);
			location.href='${contextPath}/goods/detail?gno='+mno;
   		
		}
		function gotoBisDetail(ano){
			console.log(ano);
			closealarmDiv(ano);
			var bisno=0;

			location.href='${contextPath}/business/godetail';
   		
		}function gotoReportDetail(mno){
			console.log(mno);
			closealarmDiv(ano);
			location.href='${ contextPath }/mypage/reportedList';
   		
		}
		function gotoQnADetail(mno, ano){
			console.log(mno);
			closealarmDiv(ano);
			location.href='${contextPath}/center/QNA_A?qa_no='+mno;
   		
		}function gotoSellerDetail(ano){
			console.log(ano);
			closealarmDiv(ano);
			location.href='${contextPath}/mypage/main';
   		
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
				 if($(".userTownli p:nth-last-child(1)").css("display") != "none"){
					$(".userTownli p:nth-child(2)").slideUp(350);
					$(".userTownli p:nth-last-child(1)").slideUp(350);
				} 
				/* 섹션 부분 누르면 사이드바 닫힘 */
				if($(".sidebar").css("left") == "0px"){
					$(".sidebar").css("left", "-300px");
				}
			});
		});
		
		/* 메뉴바에서 동네 바꾸기(ajax) */
		/* 동네 1개일 때 */
	 	$(".userTownli p:nth-child(2)").click(function(){
			var townName = event.target.innerText;
			var contextPath = "${pageContext.request.requestURI}";
			
			console.log(contextPath);
			
			if(townName === "내 동네 설정"){
				location.href="${contextPath}/mypage/setMyTown";
			} else{
				location.href= "${contextPath}/mypage/changeTownType2?contextPath="+contextPath;
			}
			
		});
		/* 동네 2개일 때 */
		$(".userTownli p:nth-last-child(1)").click(function(){
			var townName = event.target.innerText;
			var contextPath = "${pageContext.request.requestURI}";
			
			console.log(contextPath);
		 	console.log(townName);
		 	
			if(townName === "내 동네 설정"){
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
	<!-- <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
		//d1adf014b3056ac5a17a91d128256bce
		window.Kakao.init("d1adf014b3056ac5a17a91d128256bce");
		
		function kakaoLogin(){
			window.Kakao.Auth.login({
				scope:'profile, account_email',
				success:function(authObj){
					console.log(authObj);
					window.Kakao.API.request({
						url : '/v2/user/me', 
						success:res =>{
							const kakao_account = res.kakao_account;
							console.log(kakao_account);
						
						}
					});
				}
			});
			
		}
	</script>
	
    <script>
      function onSignIn(googleUser) {
        // Useful data for your client-side scripts:
        var profile = googleUser.getBasicProfile();
        console.log("ID: " + profile.getId()); // Don't send this directly to your server!
        console.log('Full Name: ' + profile.getName());
       /*  console.log('Given Name: ' + profile.getGivenName());
        console.log('Family Name: ' + profile.getFamilyName()); 
        console.log("Image URL: " + profile.getImageUrl());*/
        console.log("Email: " + profile.getEmail());

        // The ID token you need to pass to your backend:
        var id_token = googleUser.getAuthResponse().id_token;
        console.log("ID Token: " + id_token);
        if(profile.getId() != null){
        	 // form
		console.log("여기오니 ");
            var form = document.createElement("form");     

            form.setAttribute("method","post");                    
            form.setAttribute("action","${contextPath}/member/googlelogin");        

            document.body.appendChild(form);                        

            //input
            var input_id = document.createElement("input");  

            input_id.setAttribute("type", "hidden");                 
            
            input_id.setAttribute("user_id",profile.getId());                        
            input_id.setAttribute("email", profile.getEmail());                          
            input_id.setAttribute("nickname", profile.getName());                          

            form.appendChild(input_id);

             

            //폼전송
              form.submit();    
        }
      
       
      }
      function signOut(){
    	  gapi.auth2.getAuthInstance().disconnect();
      }
    </script> -->
    
	<!-- Optional JavaScript; choose one of the two! -->  
    <!-- Option 1: Bootstrap Bundle with Popper -->
    <!-- <script type="text/javascript">
  	var naver_id_login = new naver_id_login("KFl4i7obB3Ho4a_pNH32", "http://localhost:8082/member/auth/naver/callback");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("white", 2,40);
  	naver_id_login.setDomain("http://localhost:8082");
  	naver_id_login.setState(state);
  	naver_id_login.setPopup();
  	naver_id_login.init_naver_id_login();
  </script>
  <script type="text/javascript">
  var naver_id_login = new naver_id_login("KFl4i7obB3Ho4a_pNH32", "http://localhost:8082/member/auth/naver/callback");
  // 접근 토큰 값 출력
  alert(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
    alert(naver_id_login.getProfileData('email'));
    alert(naver_id_login.getProfileData('nickname'));
    alert(naver_id_login.getProfileData('age'));
  }
</script> -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>

    
</body>
</html>