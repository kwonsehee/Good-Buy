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
	
	
	
	
	
	</section>
	
	<jsp:include page="common/footer.jsp"/>
	
</body>
</html>
