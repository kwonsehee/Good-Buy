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
				<a id="a5" href="${ contextPath }/admin/FAQ">FAQ</a>
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
			</button><br>
            <button id="button1" disabled><a style="color : black;">매출 비율 그래프</a></button>

        </div>




        <div id="div4">
            <img src="${ contextPath }/resources/images/admin/그래프2.PNG" width="800px" height="400px">
                
              
        </div>
        <div id="div5">
            <a style="font-weight: bolder; font-size: 20px;">매출 상세</a>
            <table id="table1">
                <thead>
                  <tr style="background-color: rgb(205, 245, 255);">
                    <th>매출 수단</th><th>매출액</th><th>비율</th><td>비율 그래프</td><th></th>
                  </tr>
                </thead>
                <tbody>
                  <tr id="tr_hover1">
                    <td>비즈니스 프로필</td><td>600,000</td><td>60%</td><td style="color : rgb(255, 123, 145);">■■■■■■□□□□</td><td></td>
                  </tr>
                  <tr id="tr_hover2">
                    <td>끌어올리기</td><td>200,000</td><td>20%</td><td style="color : rgb(45, 56, 223);">■■□□□□□□□□</td><td></td>
                  </tr>
                  <tr id="tr_hover2">
                    <td>안전거래</td><td>200,000</td><td>20%</td><td style="color : rgb(216, 204, 37);">■■□□□□□□□□</td><td></td>
                  </tr>
                  
                  
                </tbody>
              </table>

        </div>

       

                
                
                
                

        

        
    </section>

<jsp:include page="../common/footer.jsp" />

</body>
</html>