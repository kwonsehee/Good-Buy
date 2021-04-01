<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Good-Buy</title>
<!-- 공통 UI -->
<link href="${ contextPath }/resources/css/goods/goodsmydetail.css" rel="stylesheet" type="text/css">
  <!--sweetalert2-->
  <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
  <!--https://sweetalert2.github.io/ 에 다양하게 사용할 수 있는 방법이 나와있다.-->
<!-- 예를들어 이미지 등을 바꿀 수 있다. 확인 취소버튼을 추가한다거나 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<!-- Optional: include a polyfill for ES6 Promises for IE11 -->
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>

</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
 <section id="gbSection" style="margin-top: 50px;">
        <table id="goods_detail">
            <tr>
                <td>
                    <img src="${ contextPath }/resources/images/filter.png" style="width: 18px;height: 18px;"> 카테고리 : 의류 -> 신발
                </td>
                <td colspan="4" id="selectTown" style="text-align: right;">
                    <span style="font-weight: bold; font-size: 15px;">내 동네</span>
                    <span style=" padding-left: 20px;">수원 팔달구 우만동</span>
                    <img src="${ contextPath }/resources/images/recycle.png" style="width: 25px;height: 25px; padding-left: 25px;">     
                </td>
               </tr>
            <tr>
                <td rowspan="7">
                    <img src="${ contextPath }/resources/images/goods.jpeg" style="width: 400px;height: 400px;margin-right: 10px;">
                </td>
            </tr>
            <tr>
                <td colspan="2" id="goodsTitle">뉴발란스신발어쩌구</td>
                <td colspan="2" style="text-align: right;">
                </td>
            </tr>
            <tr>
                <td colspan="4" id="gprice">230,000원</td>
            </tr>

            <tr>
                <td colspan="4">상태 : 미개봉</td>
            </tr>
            <tr>
                <td colspan="4">거래지역 : 수원시 우만동 팔달구</td>
            </tr>
            <tr>
                <td colspan="4" id="goodsContent">새학기 프로모션 행사할때 받은 비츠스튜디오3와이어리스 무광블랙 미개봉입니다. 언제든지 연락주세요 
                    쿨거래시 머시기머시기 네고머시기합니다. 새학기 프로모션 행사할때 받은 비츠스튜디오3와이어리스 무광블랙 미개봉입니다. 언제든지 연락주세요 
                    쿨거래시 머시기머시기 네고머시기합니다. 새학기 프로모션 행사할때 받은 비츠스튜디오3와이어리스 무광블랙 미개봉입니다. 언제든지 연락주세요 
                    쿨거래시 머시기머시기 네고머시기합니다. 
                    </td>
            </tr>
            <tr>
                <td><button type="button" class="btn_small"><img src="${ contextPath }/resources/images/heart.png" /><p>&nbsp;&nbsp;찜&nbsp;+12</p></button></td>
                <td><button type="button" class="btn_small"data-bs-toggle="modal" data-bs-target="#upgoodsModal"><img src="${ contextPath }/resources/images/up-arrow.png"/><p>끌어올리기</p></button></td>
                <td><button type="button" class="btn_small" onclick="hideBtn()"><img src="${ contextPath }/resources/images/private.png" /><p>상품숨기기</p></button></td>    
                <td><button type="button" class="btn_small" onclick="soldOutBtn()"><img src="${ contextPath }/resources/images/shoppingbag.png" /><p>&nbsp;판매완료</p></button></td>    
            </tr>
        </table>
        <div id="replySection">
            <p style="color: #9a9999; padding: 10px 0 0 10px;">댓글</p>
            <table>
                <tr>
                    <td>동춘동피바다</td>
                    <td colspan="2">2021.03.08 02:12</td>
                </tr>
                <tr>
                    <td colspan="2">1만원 네고 가능할까요~?1만원 네고 가능할까요~?1만원 네고 가능할까요~?1만원 네고 가능할까요~?</td>
                    <td><img src="${ contextPath }/resources/images/reply.png" style="width : 20px;padding-left: 80%;"><span style="font-size: 1.3em;">&nbsp;1</span></td>
                </tr>
                <tr>
                    <td style="padding-left: 80px;">나는 판매자</td>
                    <td colspan="2">2021.03.08 02:12</td>
                </tr>
                <tr>
                    <td colspan="3"><img src="${ contextPath }/resources/images/right-arrow.png" style="width: 20px; padding-right: 10px;">안됩니다. </td>
   
                    
                </tr>
                <tr>
                    <td>동춘동피바다</td>
                    <td colspan="2">2021.03.08 02:12</td>
                </tr>
                <tr>
                    <td colspan="2">1만원 네고 가능할까요~?1만원 네고 가능할까요~?1만원 네고 가능할까요~?1만원 네고 가능할까요~?</td>
                    <td><img src="${ contextPath }/resources/images/reply.png"  style="width : 20px;padding-left: 80%;"><span style="font-size: 1.3em;">&nbsp;1</span></td>
                </tr>
                <tr>
                    <td style="padding-left: 80px;">나는 판매자</td>
                    <td colspan="2">2021.03.08 02:12</td>
                </tr>
                <tr>
                    <td colspan="3"><img src="${ contextPath }/resources/images/right-arrow.png" style="width: 20px; padding-right: 10px;">안됩니다. </td>
   
                    
                </tr>
            </table>
            <form action="">
            <div id="replyWrite">
                <p>데세헤</p>
                <textarea placeholder="댓글을 작성하시려면 로그인을 해주세요"></textarea>
                <span id="counter">0 / 1000</span>
                <button type="submit" id="writeBtn">등록하기</button>
            </div>
            </form>
        </div>
    </section>
	<!-- 끌어올리 Modal -->
	<div class="modal fade" id="upgoodsModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<form method="POST" action="reportConfirm.html">
						<table id="upGoods_tb">
							
								<tr>
									<td colspan="2"><img src="${ contextPath }/resources/images/logo.png" width="40%;"
										style="margin: auto;"></td>

								</tr>
								<tr>
									<td colspan="2"><p>‘비츠 스튜디오3...’ 상품을 끌어올리시겠습니까?</p></td>
								</tr>
								<tr>
									<td colspan="2">상품을 끌어올리면 가장 상단에 상품이 위치하게 되며<br>
										끌어올리기 위해 500포인트 결제가 필요합니다.<br> 결제 하시겠습니까?
									</td>
								</tr>
								<tr>
								<td><button type="reset" id="greset"data-bs-dismiss="modal">아니요</button></td>
								<td><button type="submit" id="gsubmit">네,결제할게요.</button></td>
								</tr>
						</table>
					</form>

				</div>

			</div>
		</div>
	</div>
	<script>
           $('#replyWrite textarea').keyup(function (e){
		    var content = $(this).val();
		    $('#counter').html("("+content.length+" / 1000)");   
		    
		    if(content.length > 1000){
		    	alert('최대 1000자까지 입력 가능합니다.');
		    	$(this).val(content.substring(0, 1000));
		    	$('#counter').html("(1000 / 1000)");
		    	
		    }
		 });
       
        function hideBtn(){
            Swal.fire({
  title: '숨김처리 완료',
  html: '<br>해당 상품이 숨김 처리 되었습니다.<br>마이페이지를 통해 숨김처리 상품을 관리할 수 있습니다.<br>',
  imageUrl: '${ contextPath }/resources/images/logo.png',
  imageWidth: 232,
  imageHeight: 90,
  imageAlt: 'Custom image',
});
        }
        function soldOutBtn(){
            Swal.fire({
  title: '판매 완료',
  html: '<br>해당 상품이 판매완료 되었습니다.<br>마이페이지를 통해 판매완료 상품을 관리할 수 있습니다.<br>',
  imageUrl: '${ contextPath }/resources/images/logo.png',
  imageWidth: 232,
  imageHeight: 90,
  imageAlt: 'Custom image',
});
        }
    </script>
     	<jsp:include page="../common/footer.jsp"/>
</body>
</html>