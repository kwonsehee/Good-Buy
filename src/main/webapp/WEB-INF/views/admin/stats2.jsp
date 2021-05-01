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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<!-- 차트 링크 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

<!-- 공통 UI -->
<link href="${ contextPath }/resources/css/admin/admin_stats2.css?"
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


		<div id="div3">
			<button id="button1">
				<a id="b1" href="${ contextPath }/admin/stats">회원 통계</a>
			</button>
			<button id="button1">
				<a id="b2" href="${ contextPath }/admin/stats2">매출 통계</a>
			</button>
			<br>


		</div>




		<div id="div4">

			<div class="row py-2">
				<div class="col-md-6 py-1">
					<div class="card">
						<div class="card-body">
							<canvas id="chDonut1"></canvas>
						</div>
					</div>
					<h1>저번 달 수익</h1>
				</div>
				<div class="col-md-6 py-1">
					<div class="card">
						<div class="card-body">
							<canvas id="chDonut2"></canvas>

						</div>
					</div>
					<h1>이번 달 수익</h1>
				</div>

			</div>



		</div>
		<div class="main-content" style="display:none">
			<div class="main-content-inner">
				<div class="page-content">

					<table id="table">


						<tr>
							<th>안전거래 수수료</th>
							<th>원</th>
						</tr>

						<tbody>
							<c:forEach var="s" items="${ busis }">
								<tr>
									<td>${ s.month1 }</td>
									<td>${ s.busicash }</td>

								</tr>
								<tr></tr>
							</c:forEach>
							<tr>
								<th>안전거래 수수료 수익 총 합(원)</th>
							</tr>
							<tr>
								<th>${ sumbu[0].busicash }</th>
							</tr>
							<tr></tr>
							<tr>
								<th>비즈프로필 광고</th>
								<th>원</th>
							</tr>
							<c:forEach var="r" items="${ revs }">
								<tr>
									<td>${ r.month1 }</td>
									<td>${ r.busicash }</td>

								</tr>
							</c:forEach>
							<tr></tr>
							<tr>
								<th>비즈프로필 광고 수익 총 합(원)</th>
							</tr>
							<tr>
								<th>${ sumre[0].busicash }</th>
							</tr>
						</tbody>

					</table>

				</div>

			</div>
		</div>
		<div id="div5">
			<button id="createButton1" type="button"
				onclick="fnExcelReport('table','굿바이 수익 차트');">엑셀로 받기</button>
		</div>












	</section>

	<jsp:include page="../common/footer.jsp" />
	<script>
		var colors = [ 'red', 'skyblue', 'yellowgreen', '#c3e6cb', '#dc3545',
				'#6c757d' ];
		/* 3 donut charts */
		var donutOptions = {
			cutoutPercentage : 30,
			//도넛두께 : 값이 클수록 얇아짐
			legend : {
				position : 'bottom',
				padding : 5,
				labels : {
					pointStyle : 'circle',
					usePointStyle : true
				}
			}
		};
		// donut 1
		var chDonutData1 = {
			labels : [ '안전거래 수수료', '비즈프로필 광고' ],
			datasets : [ {
				backgroundColor : colors.slice(0, 3),
				borderWidth : 0,
				data : [ ${revs[0].busicash}, ${busis[0].busicash} ]
			} ]
		};
		var chDonut1 = document.getElementById("chDonut1");
		if (chDonut1) {
			new Chart(chDonut1, {
				type : 'pie',
				data : chDonutData1,
				options : donutOptions
			});
		}
		// donut 2
		var chDonutData2 = {
			labels : [ '안전거래 수수료', '비즈프로필 광고' ],
			datasets : [ {
				backgroundColor : colors.slice(0, 3),
				borderWidth : 0,
				data : [ ${revs[1].busicash}, ${busis[1].busicash} ]
			} ]
		};
		var chDonut2 = document.getElementById("chDonut2");
		if (chDonut2) {
			new Chart(chDonut2, {
				type : 'pie',
				data : chDonutData2,
				options : donutOptions
			});
		}
		
	</script>
	<script>
function fnExcelReport(id, title) {
var tab_text = '<html xmlns:x="urn:schemas-microsoft-com:office:excel">';
tab_text = tab_text + '<head><meta http-equiv="content-type" content="application/vnd.ms-excel; charset=UTF-8">';
tab_text = tab_text + '<xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet>'
tab_text = tab_text + '<x:Name>Test Sheet</x:Name>';
tab_text = tab_text + '<x:WorksheetOptions><x:Panes></x:Panes></x:WorksheetOptions></x:ExcelWorksheet>';
tab_text = tab_text + '</x:ExcelWorksheets></x:ExcelWorkbook></xml></head><body>';
 tab_text = tab_text + "<table border='1px'>";
var exportTable = $('#' + id).clone();
exportTable.find('input').each(function (index, elem) { $(elem).remove(); });
tab_text = tab_text + exportTable.html();
tab_text = tab_text + '</table></body></html>';
var data_type = 'data:application/vnd.ms-excel';
var ua = window.navigator.userAgent;
var msie = ua.indexOf("MSIE ");
var fileName = title + '.xls';
//Explorer 환경에서 다운로드
if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./)) {
if (window.navigator.msSaveBlob) {
var blob = new Blob([tab_text], {
type: "application/csv;charset=utf-8;"
});
navigator.msSaveBlob(blob, fileName);
}
} else {
var blob2 = new Blob([tab_text], {
type: "application/csv;charset=utf-8;"
});
var filename = fileName;
var elem = window.document.createElement('a');
elem.href = window.URL.createObjectURL(blob2);
elem.download = filename;
document.body.appendChild(elem);
elem.click();
document.body.removeChild(elem);
}
}
</script>
</body>
</html>