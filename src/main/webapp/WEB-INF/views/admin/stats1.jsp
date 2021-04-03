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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<!-- 공통 UI -->
<link href="${ contextPath }/resources/css/admin/admin_stats.css?"
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
				<a id="a5" href="${ contextPath }/admin/FAQ">FAQ</a>
			</button>
			<button id="button1">
				<a id="a6" href="${ contextPath }/admin/stats">통계</a>
			</button>

		</div>


		<div id="div3">
			<button id="button1">
				<a id="b1" href="${ contextPath }/admin/stats1">회원 통계</a>
			</button>
			<button id="button1">
				<a id="b2" href="${ contextPath }/admin/stats2">매출 통계</a>
			</button>
			<br>
			<button id="button1" disabled>
				<a style="color: black;">그래프</a>
			</button>

		</div>




		<div id="div4">
			<img src="${ contextPath }/resources/images/admin/그래프.png">


		</div>
		<div id="div5">
			<a style="font-weight: bolder; font-size: 20px;">등급별 통계</a>
			<table id="table1">
				<thead>
					<tr style="background-color: rgb(205, 245, 255);">
						<th>등급</th>
						<th>회원 수</th>
						<th>비율</th>
						<td>비율 그래프</td>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<tr id="tr_hover1">
						<td>일반</td>
						<td>600</td>
						<td>60%</td>
						<td>■■■■■■□□□□</td>
						<td></td>
					</tr>
					<tr id="tr_hover2">
						<td>일반</td>
						<td>400</td>
						<td>40%</td>
						<td>■■■■□□□□□□</td>
						<td></td>
					</tr>


				</tbody>
			</table>

		</div>

		<div id="div5">
			<a style="font-weight: bolder; font-size: 20px;">지역별 통계</a>
			<table id="table1">
				<thead>
					<tr style="background-color: rgb(205, 245, 255);">
						<th>지역</th>
						<th>회원 수</th>
						<th>비율</th>
						<td>비율 그래프</td>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<tr id="tr_hover1">
						<td>서울</td>
						<td>100</td>
						<td>6%</td>
						<td>■■■■■■□□□□</td>
						<td></td>
					</tr>
					<tr id="tr_hover2">
						<td>경기</td>
						<td>200</td>
						<td>4%</td>
						<td>■■■■□□□□□□</td>
						<td></td>
					</tr>
					<tr id="tr_hover1">
						<td>인천</td>
						<td>300</td>
						<td>6%</td>
						<td>■■■■■■□□□□</td>
						<td></td>
					</tr>
					<tr id="tr_hover2">
						<td>대구</td>
						<td>400</td>
						<td>4%</td>
						<td>■■■■□□□□□□</td>
						<td></td>
					</tr>
					<tr id="tr_hover1">
						<td>대전</td>
						<td>500</td>
						<td>6%</td>
						<td>■■■■■■□□□□</td>
						<td></td>
					</tr>
					<tr id="tr_hover2">
						<td>광주</td>
						<td>600</td>
						<td>4%</td>
						<td>■■■■□□□□□□</td>
						<td></td>
					</tr>
					<tr id="tr_hover1">
						<td>울산</td>
						<td>700</td>
						<td>6%</td>
						<td>■■■■■■□□□□</td>
						<td></td>
					</tr>
					<tr id="tr_hover2">
						<td>제주</td>
						<td>800</td>
						<td>4%</td>
						<td>■■■■□□□□□□</td>
						<td></td>
					</tr>
					<tr id="tr_hover1">
						<td>강원</td>
						<td>900</td>
						<td>6%</td>
						<td>■■■■■■□□□□</td>
						<td></td>
					</tr>
					<tr id="tr_hover2">
						<td>경북</td>
						<td>800</td>
						<td>4%</td>
						<td>■■■■□□□□□□</td>
						<td></td>
					</tr>
					<tr id="tr_hover1">
						<td>경남</td>
						<td>700</td>
						<td>6%</td>
						<td>■■■■■■□□□□</td>
						<td></td>
					</tr>
					<tr id="tr_hover2">
						<td>전북</td>
						<td>600</td>
						<td>4%</td>
						<td>■■■■□□□□□□</td>
						<td></td>
					</tr>
					<tr id="tr_hover1">
						<td>전남</td>
						<td>500</td>
						<td>6%</td>
						<td>■■■■■■□□□□</td>
						<td></td>
					</tr>
					<tr id="tr_hover2">
						<td>충북</td>
						<td>400</td>
						<td>4%</td>
						<td>■■■■□□□□□□</td>
						<td></td>
					</tr>
					<tr id="tr_hover2">
						<td>충남</td>
						<td>400</td>
						<td>4%</td>
						<td>■■■■□□□□□□</td>
						<td></td>
					</tr>

				</tbody>
			</table>

		</div>









	</section>

	<jsp:include page="../common/footer.jsp" />

</body>
</html>