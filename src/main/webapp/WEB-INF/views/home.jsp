<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<title>당신 근처의 굿-바이 마켓 Good-Buy!</title>
<link href="${ contextPath }/resources/css/main.css" rel="stylesheet" type="text/css">
 <!--sweetalert2-->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
</head>
<body>
	<jsp:include page="common/menubar.jsp"/>
	   <!-- 간편로그인으로 동네가 없을시 동네설정하라고 하기-->
 <c:if test="${!empty sessionScope.loginUser && mtlist[0]  eq '동네없음' }">
   		<script>
            swal.fire({
  title: '동네를 설정해주세요',
  html: '<br>간편로그인시 동네설정이 필요합니다.<br>고객님의 동네를 설정해주세요:)<br>',
  imageUrl: '${ contextPath }/resources/images/logo.png',
  imageWidth: 232,
  imageHeight: 90,
  imageAlt: 'Custom image',
}).then(function(){
	location.href="${contextPath}/mypage/setMyTown";
});
   		
   		</script>
   </c:if>
	<section id="gbSection">
	<img src="${ contextPath }/resources/images/main/yellowdot.png" id="yellowdot">
	<div id="titleWrap">
	<img src="${ contextPath }/resources/images/main/doublequotes.png" id="doublequotes">
	<h1>누구나 배울 수 있는 세상</h1>
	<p>믿을 수 있는 중고거래</p>
	<p>중고 거래부터 동네 정보까지, 이웃과 함께 해요.<br>
	   가깝고 따뜻한 당신의 근처를 만들어요.</p>
	<img src="${ contextPath }/resources/images/main/doublequotes.png" id="doublequotes2">
	</div>
	
	<div id="mainImgWrap">
	<img src="${ contextPath }/resources/images/main/bigdot.png" id="bigdot">
	<img src="${ contextPath }/resources/images/main/sofa.png" id="sofa">
	<img src="${ contextPath }/resources/images/main/plant.png" id="plant">
	</div>
	
	<div id="threePhotoWrap">
		<img src="${ contextPath }/resources/images/main/main2.jpg" class="mainPhoto" id="mainPhoto1">
		<div id="saveWrap1">
		<p>매번 기다려야만 했던 택배 운송 시간<br>이젠 직거래를 통해 시간을 절약하세요</p>
		<div class="save">Save Time !</div>
		</div>
		<img src="${ contextPath }/resources/images/main/main1.jpg" class="mainPhoto" id="mainPhoto2">
		<div id="saveWrap2">
		<p>새 것 같은 중고 물품 거래로<br>돈을 절약하세요</p>
		<div class="save">Save Money !</div>
		</div>
		<img src="${ contextPath }/resources/images/main/main3.jpg" class="mainPhoto" id="mainPhoto3">
		<img src="${ contextPath }/resources/images/main/forrest.png" id="forrest">
		<div id="saveWrap3">
		<p>서로에게 필요한 물건을 사고 파는 재활용을 통해<br>버려진 자원으로 지친 지구를 아껴주세요</p>
		<div class="save save2">Save Earth !</div>
		</div>
	</div>
	
	<div id="bestGoodsWrap">
		<div class="bestWrap">
			<span class="circle"></span> 
			<span class="bestText">중고상품 인기매물</span>
			<span class="circle"></span>
			
			<div class="glistWrap" style="margin-top:40px;">
			 <c:forEach var="g" items="${ glist }" end="3">
			 <div class="goodsWrap"  onclick="gotoGoodsDetailV(${g.gno})">
			<img src="${ contextPath }/resources/images/goodupload/${g.changeName}" class="gPhoto">

			<p class="gtitle">${ g.gtitle }</p>
			<p class="gprice">${ g.gprice }원</p>
			<p class="gtown">${ g.address_1 }&nbsp;${ g.address_2 }&nbsp;${ g.address_3 }</p>
			<p class="repCnt">좋아요&nbsp;${ g.likecnt }&nbsp;•&nbsp;댓글 ${ g.rep_cnt }</p>
			</div>
			</c:forEach>
			
			</div>
			
			<div class="glistWrap">
			 <c:forEach var="g" items="${ glist }" begin="4">
			 <div class="goodsWrap" onclick="gotoGoodsDetailV(${g.gno})">
			<img src="${ contextPath }/resources/images/goodupload/${g.changeName}" class="gPhoto">

			<p class="gtitle">${ g.gtitle }</p>
			<p class="gprice">${ g.gprice }원</p>
			<p class="gtown">${ g.address_1 }&nbsp;${ g.address_2 }&nbsp;${ g.address_3 }</p>
			<p class="repCnt">좋아요&nbsp;${ g.rep_cnt }&nbsp;•&nbsp;댓글 ${ g.likecnt }</p>
			</div>
			</c:forEach>
			
			</div>
			
		</div>
		
	</div>
	
	<div id="bestSearch">
	<p>중고거래 인기 검색어</p>
	<ul>
	<c:forEach var="k" items="${klist}">
		<li><a onclick="searchGoods('${k.keyword}')">${ k.keyword }</a></li>
	</c:forEach>
	</ul>
	</div>
	<script>
		function gotoGoodsDetailV(gno){
			location.href = '${contextPath}/goods/detail?gno='+gno;
		}
		function searchGoods(search){
			location.href = '${contextPath}/goods/search?search='+search;
		}
	</script>
	</section>
	
	<jsp:include page="common/footer.jsp"/>
	
</body>
</html>
