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
   
    <link href="${ contextPath }/resources/css/businessCss/myNear.css" rel="stylesheet" type="text/css">
 
</head>

<body>
	<c:if test="${ !empty sessionScope.loginUser }">
     <jsp:include page="../common/menubar.jsp"/>

    <section id="gbSection">
        <!--카테고리 부분 시작-->
        <div id="cateArea">
            <ul id="category">
                <li><img class="cateimg" src="${contextPath}/resources/images/business/일자리1.png"></li>
                <li><img class="cateimg" src="${contextPath}/resources/images/business//과외1.png"></li>
                <li><img class="cateimg" src="${contextPath}/resources/images/business/농수산물1.png"></li>
                <li><img class="cateimg" src="${contextPath}/resources/images/business/부동산1.png"></li>
                <li><img class="cateimg" src="${contextPath}/resources/images/business/중고차1.png"></li>
                <li><img class="cateimg" src="${contextPath}/resources/images/business/전시1.png"></li>
                <li><img class="cateimg" src="${contextPath}/resources/images/business/지역업체1.png"></li>
            </ul>
        </div>
        <!--카테고리 부분 끝-->

        <!--내 근처  시작-->
        <h3 id="nearNews">내 근처 소식</h3>
        <div class="nearArea">
            <div class="nearList">
                <img src="${contextPath}/resources/images/business/내근처샘플.png">
                <p class="title">바이올린1대1맞춤강습해요</p>
                <pre class="content">정적이고 아름다운 바이올린 눈높이에
 맞춰 친절히 가르쳐 드릴게요~~</pre>
                <div class="lastInfo">
                <img src="${contextPath}/resources/images/business/미니프로필샘플.png">
                <label class="name">바이바이</label>
                <label class="address">구월동</label>
                </div>
            </div>
            <div class="nearList">
                <img src="${contextPath}/resources/images/business/내근처샘플.png">
                <p class="title">바이올린1대1맞춤강습해요</p>
                <pre class="content">정적이고 아름다운 바이올린 눈높이에
 맞춰 친절히 가르쳐 드릴게요~~</pre>
                <div class="lastInfo">
                <img src="${contextPath}/resources/images/business/미니프로필샘플.png">
                <label class="name">바이바이</label>
                <label class="address">구월동</label>
                </div>
            </div>
            <div class="nearList">
                <img src="${contextPath}/resources/images/business/내근처샘플.png">
                <p class="title">바이올린1대1맞춤강습해요</p>
                <pre class="content">정적이고 아름다운 바이올린 눈높이에
 맞춰 친절히 가르쳐 드릴게요~~</pre>
                <div class="lastInfo">
                <img src="${contextPath}/resources/images/business/미니프로필샘플.png">
                <label class="name">바이바이</label>
                <label class="address">구월동</label>
                </div>
            </div>
            <div class="nearList">
                <img src="${contextPath}/resources/images/business/내근처샘플.png">
                <p class="title">바이올린1대1맞춤강습해요</p>
                <pre class="content">정적이고 아름다운 바이올린 눈높이에
 맞춰 친절히 가르쳐 드릴게요~~</pre>
                <div class="lastInfo">
                <img src="${contextPath}/resources/images/business/미니프로필샘플.png">
                <label class="name">바이바이</label>
                <label class="address">구월동</label>
                </div>
            </div>
        </div>
        
        

        <div class="btnArea">
        <button id="nearBtn" onclick="location.href='${contextPath}/business/near/list'">내 근처 소식 전체보기</button>
        </div>
        <!--내 근처 끝-->

        <!--이웃들의 추천 가게 시작-->
        
        <h3 id="likeShopArea">이웃들의 추천 가게</h3>
        <div id="star">
        <a>별점순</a>
        <a>후기순</a>
        </div>
        <div class="likeArea">
            <img id="left" src="${contextPath}/resources/images/business/화살표.png">
            <div class="likeList">
                <img src="${contextPath}/resources/images/business/추천가게샘플.png">
                <div class="firstLike">
                    <label class="shopName">휘트니스88</label>
                    <label class="shopAddress">주안동</label>
                </div>
                <div class="secondLike">
                    <p>프리미엄 1:1 개인 트레이닝 센터 FINTNESS...</p>
                </div>
                <div class="thirdLike">
                    <label class="reviewCount">후기 1</label>
                    <label class="likeCount">단골 2</label>
                    <img src="${contextPath}/resources/images/business/별점.png" height="12px" >
                </div>
                <div class="fourthLike">
                    <p class="review"><b>익룡님</b> 지금 약 20회 PT 받은 회원입니다!</p>
                </div>
            </div>
            <div class="likeList">
                <img src="${contextPath}/resources/images/business/추천가게샘플.png">
                <div class="firstLike">
                    <label class="shopName">휘트니스88</label>
                    <label class="shopAddress">주안동</label>
                </div>
                <div class="secondLike">
                    <p>프리미엄 1:1 개인 트레이닝 센터 FINTNESS...</p>
                </div>
                <div class="thirdLike">
                    <label class="reviewCount">후기 1</label>
                    <label class="likeCount">단골 2</label>
                    <img src="${contextPath}/resources/images/business/별점.png" height="12px">
                </div>
                <div class="fourthLike">
                    <p class="review"><b>익룡님</b> 지금 약 20회 PT 받은 회원입니다!</p>
                </div>
            </div>
            <div class="likeList">
                <img src="${contextPath}/resources/images/business/추천가게샘플.png">
                <div class="firstLike">
                    <label class="shopName">휘트니스88</label>
                    <label class="shopAddress">주안동</label>
                </div>
                <div class="secondLike">
                    <p>프리미엄 1:1 개인 트레이닝 센터 FINTNESS...</p>
                </div>
                <div class="thirdLike">
                    <label class="reviewCount">후기 1</label>
                    <label class="likeCount">단골 2</label>
                    <img src="${contextPath}/resources/images/business/별점.png" height="12px">
                </div>
                <div class="fourthLike">
                    <p class="review"><b>익룡님</b> 지금 약 20회 PT 받은 회원입니다!</p>
                </div>
            </div>
            <img id="right" src="${contextPath}/resources/images/business/화살표.png">
            </div>
        </div>
        <div class="btnArea">
        	<c:if test="${ sessionScope.loginUser.is_business eq 'Y' }">
            <button id="businessBtn"><img src="${contextPath}/resources/images/business/shop 1.png"><label onclick="location.href='${contextPath}/business/setting'">비즈 프로필 관리</label></button>
            </c:if>
            <c:if test="${ sessionScope.loginUser.is_business eq 'N'}">
            <button id="businessBtn"><img src="${contextPath}/resources/images/business/shop 1.png"><label onclick="location.href='${contextPath}/business/create'">비즈 프로필 생성</label></button>
            </c:if>
           
        </div>

        
        <!--이웃들의 추천 가게 끝-->
       
    </section>
    <script>
    	$(".nearList,.likeList").click(function(){
    		location.href="${contextPath}/business/detail";
    	})
    </script>

    <jsp:include page="../common/footer.jsp"/>
   

	</c:if>
	<c:if test="${ empty sessionScope.loginUser }">
		<h3>로그인 후 이용해주세요</h3>
	</c:if>
</body>
</html>