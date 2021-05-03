<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>당신 근처의 굿-바이 마켓 Good-Buy!</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<!-- 공통 UI -->
<link href="${ contextPath }/resources/css/admin/admin_FAQ_detail.css?"
	rel="stylesheet" type="text/css">
<style>
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />

	<section id="gbSection">


		<div id="div1">
			<h1>
				<a href="${ contextPath }/admin/join" id="head1"
					style="color: black;">관리자 페이지</a>
			</h1>
		</div>


		<div id="div2">
			<button id="button1">
				<a id="a1" href="${ contextPath }/admin/notice">공지사항</a>
			</button>
			<button id="button1">
				<a id="a2" href="${ contextPath }/admin/report">신고</a>
			</button>
			<button id="button1">
				<a id="a3" href="${ contextPath }/admin/product">상품관리</a>
			</button>
			<button id="button1">
				<a id="a4" href="${ contextPath }/admin/member">회원관리</a>
			</button>
			<button id="button1">
				<a id="a5" href="${ contextPath }/admin/FAQ">FAQ/문의</a>
			</button>
			<button id="button1">
				<a id="a6" href="${ contextPath }/admin/stats">통계</a>
			</button>

		</div>

		<form action="${ contextPath }/admin/FAQupdate" id="writeForm" method="post">
		<div id="div3">
			<label style="font-weight: bold; font-size: 20px;">FAQ 제목</label> <input
				type="text" id="notice_title" name="qa_title"
				style="border-right: white; border-left: white; border-top: white;"
				size="100px" value="${ QNA.qa_title }">
		</div>


		<div id="textareadiv">
			<label id="label2"
				style="font-weight: bold; font-size: 20px; text-align: top;">FAQ
				내용</label>
			<textarea id="notice_content" name="qa_content">${ QNA.qa_content }</textarea>
			<br>
			<input type="hidden" name="qa_no" value="${ QNA.qa_no }"/>
			<button id="createButton">수 정</button>
			<button id="createButton" type="button" onclick="location.href='${ contextPath}/admin/FAQdelete?qa_no=${ QNA.qa_no }'">삭 제</button>

		</div>
	</form>
	</section>



	<script>
		$(document).ready(function() {
			// memu 클래스 바로 하위에 있는 a 태그를 클릭했을때
			$(".menu>a").click(function() {
				// 현재 클릭한 태그가 a 이기 때문에
				// a 옆의 태그중 ul 태그에 hide 클래스 태그를 넣던지 빼던지 한다.
				$(this).next("ul").toggleClass("hide");
			});
		});

		$(document).ready(function() {
			// menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
			$(".menu>a").click(function() {
				var submenu = $(this).next("ul");

				// submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
				if (submenu.is(":visible")) {
					submenu.slideUp();
				} else {
					submenu.slideDown();
				}
			});
		});
	</script>
	<jsp:include page="../common/footer.jsp" />
<script>



	var str = document.getElementById("notice_content").value;

	str = str.replaceAll("<br>", "\r\n");

	document.getElementById("notice_content").value = str;
	
	
	
	</script>




</body>
</html>