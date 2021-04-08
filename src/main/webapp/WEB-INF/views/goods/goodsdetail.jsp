<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Good-Buy</title>
<!-- 공통 UI -->
<link href="${ contextPath }/resources/css/goods/goodsdetail.css" rel="stylesheet" type="text/css">

</head>
<body>

	<jsp:include page="../common/menubar.jsp"/>
 <section id="gbSection"style="margin-top: 50px;">
        <table id="goods_detail">
            <tr>
                <td>
                    <img src="${ contextPath }/resources/images/filter.png" style="width: 18px;height: 18px;"> 카테고리 : 의류 -> 신발
                </td>
                <td colspan="3" id="selectTown" style="text-align: right;">
                    <span style="font-weight: bold; font-size: 15px;">내 동네</span>
                    <span style=" padding-left: 20px;">수원 팔달구 우만동</span>
                    <img src="${ contextPath }/resources/images/recycle.png" style="width: 25px;height: 25px; ">     
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
                    <a class="btn_gray" href = "${ contextPath }/goods/sellerInfo">판매자 정보</a>&nbsp;
                    <a class="btn_gray" data-bs-toggle="modal" data-bs-target="#reportModal">신고하기</a>
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
                <td><button type="button" class="btn_small"><img src="${ contextPath }/resources/images/heart.png" /><p>&nbsp;&nbsp;찜하기</p></button></td>
                <td><button type="button" class="btn_small" onclick="sendmsgPopup();"><img src="${ contextPath }/resources/images/airplane.png"/><p>쪽지보내기</p></button></td>
                <td><button type="button" class="btn_small" data-bs-toggle="modal" data-bs-target="#paymentModal"><img src="${ contextPath }/resources/images/shoppingbag.png" /><p>&nbsp;구매하기</p></button></td>    
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
                    <td class="reviews"><img src="${ contextPath }/resources/images/reply.png" style="width : 20px;"><span style="font-size: 1.3em;">&nbsp;1</span></td>
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
                    <td class="reviews"><img src="${ contextPath }/resources/images/reply.png"  style="width : 20px;"><span style="font-size: 1.3em;">&nbsp;1</span></td>
                </tr>
                <tr>
                    <td style="padding-left: 80px;">나는 판매자</td>
                    <td colspan="2">2021.03.08 02:12</td>
                </tr>
                <tr>
                    <td colspan="3"><img src="${ contextPath }/resources/images/right-arrow.png" style="width: 20px; padding-right: 10px;">안됩니다. </td>
   
                    
                </tr>
            </table>
            <form method="POST">
            <div id="replyWrite">
                <p>데세헤</p>
                <textarea placeholder="댓글을 작성하시려면 로그인을 해주세요"></textarea>
                <span id="counter">0 / 1000</span>
                <button type="submit" id="writeBtn">등록하기</button>
            </div>
            </form>
        </div>
    </section>
	<!-- 안전거래 Modal -->
	<div class="modal fade" id="paymentModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				
				<div class="modal-body">
					<table id="payment_tb">
						
							<tr>
								<td colspan="2"><img src="${ contextPath }/resources/images/logo.png" width="40%;"
									style="margin: auto;"></td>

							</tr>
							<tr>
								<td colspan="2"><p>안전거래 수수료는 포인트 결제가 가능합니다.</p></td>
							</tr>
							<tr>
								<td colspan="2">포인트는 커뮤니티 댓글 작성, 후기작성, <br> 팔로우 10N명
									달성시 지급받으실 수 있습니다.
								</td>
							</tr>
							<tr>
							<td><button type="submit" id="gsubmit"
									onclick="pointPopup()">포인트결제</button></td>
							<td><button type="reset" id="greset"
									onclick="window.close();">일반결제</button></td>
							</tr>
					
					</table>


					<div class="modal-footer">
						
						<button type="button" id="closeBtn" data-bs-dismiss="modal">닫기</button>
					</div>
				</div>

			</div>
		</div>
	</div>
<!-- 신고 Modal -->
	<div class="modal fade" id="reportModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-body">
					<form method="POST" action="reportConfirm.html">
						<table id="report_tb">
							<tr>
								<td colspan="2"><img src="${ contextPath }/resources/images/logo.png" width="40%;"
									style="margin: auto;"></td>

							</tr>
							<tr>
								<td colspan="2"><p>상품 신고 사유</p></td>
							</tr>
							<tr>
								<td colspan="2"><select id="reportSelect">
										<option>입금완료했는데 상품을 수령하지 못했어요.</option>
										<option>광고성(상점홍보, 낚시글 도배글)이에요</option>
										<option>거래 금지 품목을 거래하고 있어요.</option>
										<option>물품 정보(카테고리, 가격, 사진)이 부정확해요.</option>
										<option>언어폭력(비방, 욕설, 성희롱)이 기재되어 있어요.</option>
										<option>기타.</option>
								</select></td>
							</tr>

							<tr>
								<td colspan="2">
									<p>신고 내용</p>
								</td>
							</tr>
							<tr>
								<td colspan="2"><textarea> </textarea></td>

							</tr>
							<tr>
							<td><button type="reset" id="greset" data-bs-dismiss="modal" style="margin-bottom : 10%;">취소하기</button></td>
							<td><button type="submit" id="gsubmit" style="margin-bottom : 10%;">신고하기</button></td>
							</tr>
						</table>
					</form>
					
				</div>

			</div>
		</div>
	</div>
	<script>
        function click0(){
            Swal.fire({
  title: '신고내용 접수 완료',
  html: '<br>소중한 신고 감사드립니다.<br>좋은 Good-buy가 될 수 있도록 노력하겠습니다.<br>',
  imageUrl: 'images/logo.png',
  imageWidth: 232,
  imageHeight: 90,
  imageAlt: 'Custom image',
});
        }

		$('#replyWrite textarea').keyup(function(e) {
			var content = $(this).val();
			$('#counter').html("(" + content.length + " / 1000)");

			if (content.length > 1000) {
				alert('최대 1000자까지 입력 가능합니다.');
				$(this).val(content.substring(0, 1000));
				$('#counter').html("(1000 / 1000)");

			}
		});
		
		function sendmsgPopup() {
			var url = "${ contextPath }/goods/sendmsgPopup";
			var name = "쪽지보내기";
			var _width = '500';
			var _height = '550';

			// 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
			var _left = Math.ceil((window.screen.width - _width) / 2);
			var _top = Math.ceil((window.screen.height - _height) / 2);

			window.open(url, name, 'width=' + _width + ', height=' + _height
					+ ', left=' + _left + ', top=' + _top);

		}
	</script>
     	<jsp:include page="../common/footer.jsp"/>
</body>
</html>