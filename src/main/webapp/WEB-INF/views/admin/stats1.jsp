<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type"
	content="application/vnd.ms-excel;charset=euc-kr">

<title>당신 근처의 굿-바이 마켓 Good-Buy!</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<!-- 공통 UI -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<!-- 차트 링크 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

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
				<a id="a5" href="${ contextPath }/admin/FAQ">FAQ/문의</a>
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
			

		</div>




		<div id="div4">
			<div class="container">
				<canvas id="myChart"></canvas>
			</div>
		</div>


		
		<div class="main-content" style="display:none">
			<div class="main-content-inner">
				<div class="page-content">
					
						<table id="table">
						
							<thead>
								<tr>
									<th>지역</th>
									<th>명</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="s" items="${ Seoul }">
								<tr>
									<td>${ s.address_1 }</td>
									<td>${ s.cnt }</td>
									</c:forEach>
							</tbody>
							
						</table>
					
				</div>
				
			</div>
		</div>
		<div id="div5">
		<button id="createButton1" type="button" onclick="fnExcelReport('table','지역별 회원 수');">엑셀로 받기</button></div>




		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
			integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
			crossorigin="anonymous"></script>

		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
			integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
			crossorigin="anonymous"></script>

		<script
			src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
			integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
			crossorigin="anonymous"></script>







	</section>

	<jsp:include page="../common/footer.jsp" />
	<script>
//var seoulcnt =  Seoul[0].cnt
//console.log(seoulcnt);

var ctx = document.getElementById('myChart');
var myChart = new Chart(ctx, { type: 'bar', data: { labels: ['${ Seoul[0].address_1}', '${ Seoul[1].address_1}', '강원', '충청', '전라', '경상'],
	datasets: [{ label: '지역 별 회원 수',
		data: [${ Seoul[0].cnt},
			${ Seoul[1].cnt},
			3,
			5,
			2,
			3],
		backgroundColor: [ 'rgba(255, 99, 132, 0.2)',
							'rgba(54, 162, 235, 0.2)',
							'rgba(255, 206, 86, 0.2)',
							'rgba(75, 192, 192, 0.2)',
							'rgba(153, 102, 255, 0.2)',
							'rgba(255, 159, 64, 0.2)' ],
		borderColor: [ 'rgba(255, 99, 132, 1)',
						'rgba(54, 162, 235, 1)',
						'rgba(255, 206, 86, 1)',
						'rgba(75, 192, 192, 1)',
						'rgba(153, 102, 255, 1)',
						'rgba(255, 159, 64, 1)' ],
		borderWidth: 1 }] },
		options: { scales: { yAxes: [{ ticks: { beginAtZero: true } }] } } }); 
		
		
		
		
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