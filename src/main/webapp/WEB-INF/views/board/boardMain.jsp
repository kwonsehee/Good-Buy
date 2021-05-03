<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	   <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신 근처의 굿-바이 마켓 Good-Buy!</title>


<link href="${contextPath }/resources/css/board/boardMain.css"
	rel="stylesheet" type="text/css">

</head>

<body>
	<jsp:include page="../common/menubar.jsp" />
	<!--============================================================================================================================-->
	<br>
	<br>
	<section id="gbSection">
		<!-- 카테고리 -->
		<br>
		<br>
		<div id="maintitle">
			<a>내동네생활</a> <br> <br> <br> <br> <br>
		</div>
		<ul class="categorys">
			<li><a href="${contextPath }/board/list"><img
					class="categorya"
					src="${contextPath }/resources/images/board/life.png"></a><br>일상</li>
			<li><a href="${contextPath }/board/list"><img
					class="categorya"
					src="${contextPath }/resources/images/board/dog.png"></a><br>동물</li>
			<li><a href="${contextPath }/board/list"><img
					class="categorya"
					src="${contextPath }/resources/images/board/food.png"></a><br>맛집</li>
			<li><a href="${contextPath }/board/list"><img
					class="categorya"
					src="${contextPath }/resources/images/board/town.png"></a><br>기타</li>
		</ul>

		<br> <br> <br>
		<!-- 검색바 -->






		<!-- 추천 게시글-->

			<div id="title1">
			<a>내동네생활 인기글</a> <a href="${contextPath }/board/list" id="Viewmore"
				style="font-size: 14px; text-decoration: underline; color: black;">더보기</a>
		</div>

		<br> <br> <br>
		
		     <c:forEach var="c" items="${ likelist }">
		<div id="townstory1">
			<div class="townboard">
				<img src="${contextPath}/resources/images/boardupload/${c.bfile}"
					id="storyimage"> <br>
				<div class="title">
					${c.btitle}<br>
				</div>
					<div class="name">${c.userid }</div>
					<div class="heart">
						<img src="${contextPath }/resources/images/mypage/heart.png"
							style="width: 18px; height: 16px;">
							${c.postno}
					</div>
			

				<label class="boarddate">${c.bcreatedate}</label>


				<p class="story">${ fn:substring(c.bhistory,0,30) }
				<c:if test="${fn:length(c.bhistory )>30}">
           		 ...
                </c:if>				
				</p>
			</div>
			
		</div>
	 </c:forEach>
		<br>
		<br>
		<br>
	<br>
	
		<!--내동네생활 최신글 -->
		<div id="title1">
			<a>내동네생활 최신글</a> <a href="${contextPath }/board/list" id="Viewmore"
				style="font-size: 14px; text-decoration: underline; color: black;">더보기</a>
		</div>
			<br>
		<br>

		
		
		     <c:forEach var="b" items="${  lastestlist }">
		<div id="townstory1">
			<div class="townboard">
				<img src="${contextPath}/resources/images/boardupload/${b.bfile}"
					id="storyimage"> <br>
				<div class="title">
					${b.btitle}<br>
				</div>
			
					<div class="name">${b.userid }</div>
					<div class="heart">
						<img src="${contextPath }/resources/images/mypage/heart.png"
							style="width: 18px; height: 16px;">
							${b.postno}
					</div>
				
				<label class="boarddate">${b.bcreatedate}</label>


					<p class="story">${ fn:substring(b.bhistory,0,30) }
				<c:if test="${fn:length(b.bhistory )>30}">
           		 ...
                </c:if>		
			</div>
			
		</div>
	 </c:forEach>
	
		<div class="townserch">
			<input type="text" id="townbox" placeholder="동네생활을 검색하세요!"
				style="color: #05AAD1;">
			<button type="submit" id="townbutton"
				onclick="${contextPath}/board/serch'" style="margin-left: 15px;">검색</button>

		</div>
		</div>
		<button id="writeBtn"
			onclick="location.href='${contextPath }/board/write'">동네 생활
			글쓰기</button>
	</section>

	<jsp:include page="../common/footer.jsp" />


</body>
</html>