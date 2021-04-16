<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Good-Buy</title>
<!-- 공통 UI -->
<link href="${ contextPath }/resources/css/goods/goodsdetail.css" rel="stylesheet" type="text/css">
<!--sweetalert2-->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<!-- Optional: include a polyfill for ES6 Promises for IE11 -->
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
 <section id="gbSection"style="margin-top: 50px;">
 <!-- 메세지가 있다면 출력하고 지우기 -->
   <c:if test="${ !empty msg && msg.equals('success')}">
   		<script>
            swal.fire({
  title: '신고내용 접수 완료',
  html: '<br>소중한 신고 감사드립니다.<br>좋은 Good-buy가 될 수 있도록 노력하겠습니다.<br>',
  imageUrl: '${ contextPath }/resources/images/logo.png',
  imageWidth: 232,
  imageHeight: 90,
  imageAlt: 'Custom image',
});
   		
   		</script>
   		<c:remove var="msg" />
   </c:if>
     <c:if test="${ !empty msg && msg.equals('fail')}">
   		<script>
            swal.fire({
  title: '신고내용 접수 실패',
  html: '<br>사용에 불편을 드려서 죄송합니다. <br>좋은 Good-buy가 될 수 있도록 노력하겠습니다.<br>',
  imageUrl: '${ contextPath }/resources/images/logo.png',
  imageWidth: 232,
  imageHeight: 90,
  imageAlt: 'Custom image',
});
   		
   		</script>
   		<c:remove var="msg" />
   </c:if>
    <c:if test="${ !empty msg && msg.equals('결제 성공')}">
   		<script>
            swal.fire({
  title: '상품 결제 성공',
  html: '<br>고객님이 상품을 받을 경우 결제가 완료 됩니다. <br>일주일간 상품을 받지 못할경우 환불됩니다.<br>',
  imageUrl: '${ contextPath }/resources/images/logo.png',
  imageWidth: 232,
  imageHeight: 90,
  imageAlt: 'Custom image',
});
   		
   		</script>
   		<c:remove var="msg" />
   </c:if>
   <c:if test="${ !empty msg && msg.equals('결제 실패')}">
   		<script>
            swal.fire({
  title: '상품 결제 실패',
  html: '<br>사용에 불편을 드려서 죄송합니다. <br>좋은 Good-buy가 될 수 있도록 노력하겠습니다.<br>',
  imageUrl: '${ contextPath }/resources/images/logo.png',
  imageWidth: 232,
  imageHeight: 90,
  imageAlt: 'Custom image',
});
   		
   		</script>
   		<c:remove var="msg" />
   </c:if>
        <table id="goods_detail">
            <tr>
                <td>
                    <img src="${ contextPath }/resources/images/filter.png" style="width: 18px;height: 18px;">
                     카테고리 : ${g.goodcate.lfilter}-> ${g.goodcate.mfilter}-> ${g.goodcate.sfilter}
                </td>
                <td colspan="3" id="selectTown" style="text-align: right;">
              	    <a class="btn_gray" href = "${ contextPath }/goods/sellerInfo">판매자 정보</a>&nbsp;
                    <c:if test="${ !empty loginUser }">
                    <a class="btn_gray" data-bs-toggle="modal" data-bs-target="#reportModal">신고하기</a>
                   	</c:if>
                   	<c:if test="${ empty loginUser }">
                    <a class="btn_gray" onclick="noUser()">신고하기</a>
                    </c:if>
                </td>
               </tr>
            <tr>
                <td rowspan="7">
                    <img src="${ contextPath }/resources/images/goodupload/${g.filelist[0]}" style="width: 400px;height: 400px;margin-right: 25px;">
                </td>
            </tr>
            <tr>
                <td colspan="4" id="goodsTitle">${g.gtitle}</td>
            
            </tr>
            <tr>
                <td colspan="4" id="gprice">${g.gprice}원</td>
            </tr>

            <tr>
                <td colspan="4">상태 :${g.gcondition}</td>
            </tr>
            <tr>
                <td colspan="4">거래지역 : ${g.town.address_1}&nbsp; ${g.town.address_2}&nbsp; ${g.town.address_3}</td>
            </tr>
            <tr >
                <td colspan="4" id="goodsContent">${g.gcomment}${likes}
                    </td>
            </tr>
            <tr>
                <td id="like_area">
                
                <c:if test="${ empty loginUser }">
                <button type="button" class="btn_small" onclick="noUser()">
               	<img src="${ contextPath }/resources/images/heart.png" />
                <p>&nbsp;&nbsp;찜 하기</p>
                </button>
                </c:if>
                
                <c:if test="${ !empty likes && !empty loginUser}">
                <button type="button" class="btn_small" id="likegoods">
                <img src="${ contextPath }/resources/images/fillHeart1.png" id="likes"/>
                <p>&nbsp;&nbsp;찜 취소</p>
                </button>
                </c:if>
                
                <c:if test="${ empty likes && !empty loginUser}">        
                <button type="button" class="btn_small" id="dislikegoods">
                <img src="${ contextPath }/resources/images/heart.png" />
                <p>&nbsp;&nbsp;찜하기</p>
                </button>
                </c:if>
        
                </td>
                <td>
                <c:if test="${ empty loginUser }">
                     <button type="button" class="btn_small"  onclick="noUser()"><img src="${ contextPath }/resources/images/airplane.png"/><p>쪽지보내기</p></button>
                </c:if>
                <c:if test="${ !empty loginUser }">
                     <button type="button" class="btn_small" onclick="sendmsgPopup();"><img src="${ contextPath }/resources/images/airplane.png"/><p>쪽지보내기</p></button>
                
                </c:if>
           		</td>
                <td>
                 <c:if test="${ empty loginUser }">
                    <button type="button" class="btn_small"  onclick="noUser()"><img src="${ contextPath }/resources/images/shoppingbag.png" /><p>&nbsp;구매하기</p></button>
                </c:if>
                <c:if test="${ !empty loginUser }">
                    <button type="button" class="btn_small" data-bs-toggle="modal" data-bs-target="#paymentModal"><img src="${ contextPath }/resources/images/shoppingbag.png" /><p>&nbsp;구매하기</p></button>
                </c:if>
                </td>    
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
							<td><button type="button" id="gsubmit" onclick="goPayment('point')">포인트결제</button></td>
							<td><button type="button" id="greset" onclick="goPayment('pay')">일반결제</button></td>
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
					<form method="POST" action="${ contextPath }/report/goodsinsert">
					<input type="hidden" name="gno" value="${g.gno }">
					<input type="hidden" name="report_id" value="${g.user_id }">
						<table id="report_tb">
							<tr>
								<td colspan="2"><img src="${ contextPath }/resources/images/logo.png" width="40%;"
									style="margin: auto;"></td>

							</tr>
							<tr>
								<td colspan="2"><p>상품 신고 사유</p></td>
							</tr>
							<tr>
								<td colspan="2"><select id="retitle" name="retitle">
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
								<td colspan="2"><textarea name="re_content"> </textarea></td>

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
	
	 $(function(){
         $(document).on("click","#likegoods",function(){
        	 var g_no = ${g.gno}
        	 document.getElementById("like_area").value='';
       	  
            $.ajax({
               url : "likegoods",
               data : {gno : g_no},
               type : "post",
               success : function(data){
                  if(data == "success"){
                	  values ="<button type='button' class='btn_small' id='dislikegoods'>" 
                		  +"<img src='${ contextPath }/resources/images/heart.png'/>"
                          +"<p>&nbsp;&nbsp;찜하기</p>"
                	  
                	  
                	  $("#like_area").html(values);
                  }  
                  else{
                	  alert("찜하기 취소 실패!");
                  }
                     
               },
               error : function(e){
                  alert("error code : " + e.status + "\n"
                        + "message : "+ e.responseText);
               }
            })
         })
      })
       $(function(){
       	 $(document).on("click","#dislikegoods",function(){
        	 var g_no = ${g.gno}
        	 document.getElementById("like_area").value='';
       	  
            $.ajax({
               url : "dislikegoods",
               data : {gno : g_no},
               type : "post",
               success : function(data){
                  if(data == "success"){
                	  values ="<button type='button' class='btn_small' id='likegoods'>" 
                		  +"<img src='${ contextPath }/resources/images/fillHeart1.png' id='likes'/>"
                          +"<p>&nbsp;&nbsp;찜 취소</p>"
                      
             
                	  $("#like_area").html(values);
                  }  
                  else{
                	  alert("찜하기 실패!");
                  }
                     
               },
               error : function(e){
                  alert("error code : " + e.status + "\n"
                        + "message : "+ e.responseText);
               }
            })
         })
      })
        
     function noUser(){
         Swal.fire({
title: '로그인 필요',
html: '<br>해당 기능은 로그인시 가능합니다.<br> 로그인시 Good-buy의 다양한 기능을 사용할 수 있습니다.<br>',
imageUrl: '${ contextPath }/resources/images/logo.png',
imageWidth: 232,
imageHeight: 90,
imageAlt: 'Custom image',
}).then(function(){
	$('#loginModal').modal("show");
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
		function goPayment(way){
			location.href='${contextPath }/goods/pay?way='+way;
		}
		
	</script>
     	<jsp:include page="../common/footer.jsp"/>
</body>
</html>