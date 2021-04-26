<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<title>당신 근처의 굿-바이 마켓 Good-Buy!</title>
<link href="${ contextPath }/resources/css/main.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="common/menubar.jsp"/>
	
	<section id="gbSection">
	
	<div id="titleWrap">
	<img src="${ contextPath }/resources/images/main/doublequotes.png" id="doublequotes">
	<h1>당신 근처의 굿-바이 마켓</h1>
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
		</div>
	</div>
	
	<div id="bestSearch">
	<p>중고거래 인기 검색어</p>
	<ul>
		<li>자전거</li>
		<li>노트북</li>
		<li>아이패드</li>
		<li>의자</li>
		<li>커피머신</li>
		<li>에어팟</li>
		<li>모니터</li>
		<li>노트북</li>
		<li>텀블러</li>
		<li>캠핑</li>
	</ul>
	</div>
	
	
	
	
	
	</section>
	
	<jsp:include page="common/footer.jsp"/>
	
</body>
</html>
