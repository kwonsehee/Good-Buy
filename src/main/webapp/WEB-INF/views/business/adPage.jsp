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
   <!-- iamport  -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <link href="${ contextPath }/resources/css/businessCss/adPage.css" rel="stylesheet" type="text/css">
   

</head>
<body>
    <jsp:include page="../common/menubar.jsp"/>
    <section id="gbSection">
        <div class="area"> 
            <div class="cashArea">
                <label id="cash">광고 캐시</label>
                <label id="money">${ business.adCash }원</label>
                <button id="cashBtn" data-bs-toggle="modal" data-bs-target="#cashModal">충전</button>
            </div>
            <c:if test="${viewCnt == 0 }">
            <div class="logoArea">
                <img src="${contextPath}/resources/images/logo2.png">
                <p>진행중인 광고가 없어요</p>
                <p>비즈 프로필을 광고해 보세요.</p>
            </div>
            <div class="btnArea"> 
                <button id="createBtn" data-bs-toggle="modal" data-bs-target="#adModal">광고 만들기</button>
            </div>
            </c:if>
            <c:if test="${viewCnt != 0  }">
            <div class="logoArea">
                <img src="${contextPath}/resources/images/logo2.png">
                <p> ${ viewCnt }회</p>
                <p>현재 남은 광고 조회수 입니다.</p>
            </div>
            </c:if>
        </div>
        
           <!--review Modal -->
	<div class="modal fade" id="cashModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<div class="titleWrap">
						<span class="circle"></span> <span class="welcome">캐시 충전</span>
						<span class="circle"></span>
					</div>
				</div>

				
					<div class="cash-body">
						<div class="cashformWrap">
							
								 <div id="cashWrite">
							        
							         <input type="text" id="cashInput" placeholder="충전 요금을 입력 해주세요." required>
							       
							        <div id="cashbtnArea">
							            <button id="cashInsertBtn">완료</button>
							        </div>
							    </div>
						
							
						</div>

					</div>
					<div class="modal-footer">
					
						<button type="button" id="closeBtn" data-bs-dismiss="modal">닫기</button>
					</div>
			</div>
		</div>
	</div>
	
	<!-- 광고하기 Modal -->
	<div class="modal fade" id="adModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<div class="titleWrap">
						<span class="circle"></span> <span class="welcome">조회수 설정</span>
						<span class="circle"></span>
					</div>
				</div>

				
					<div class="modal-body">
						<div class="adformWrap">
							
							<table id="viewCount">
						        <tr >
						            <td><h3>조회수 설정</h3></td>
						        </tr>
						        <tr>
						            <td><label>설정한 조회수 만큼 광고가 유지 됩니다 조회수를 설정 해주세요.</label></td>
						        </tr>
						        <tr>
						            <td><input type="range" id="countInput" name="countInput" min="1" max="4" value="1" step="1" onchange="showValue(this)" ></td>
						        </tr>
						        <tr>
						            <td id="count">조회수 500회</td>
						        </tr>
						        <tr id="btnArea">
						            <td><button id="finalBtn" onclick="adCreate(${business.adCash})">5,000원 광고하기</button></td>
						        </tr>
						    </table>
						    

					</div>
					<div class="modal-footer">
						<button type="button" id="closeBtn" data-bs-dismiss="modal">닫기</button>
					</div>
			</div>
		</div>
	</div>
        
    </section>

 	<jsp:include page="../common/footer.jsp"/>

    <script>
    
    function showValue(value){
        //    var mytown = $("#mytown").text;
           var val = $("#countInput").val();
          console.log(val);
        //   console.log(mytown);

          if(val == 1){

            $("#finalBtn").html("5,000원 광고하기");
            $("#count").html("조회수 500회");
          } else if(val == 2){
  
            $("#finalBtn").html("10,000원 광고하기");
            $("#count").html("조회수 1,000회");
          } else if(val == 3){
            $("#finalBtn").html("13,000원 광고하기");
            $("#count").html("조회수 1,500회");
          } else {
            $("#finalBtn").html("15,000원 광고하기");
            $("#count").html("조회수 2,000회");
          }
       };
    
    	function adCreate(adCash){
    		var view = $("#countInput").val();
    		var cash = 0;
    	
    		console.log(adCash);
    		if(view == 1){
    			cash = 5000;
    		}else if(view == 2){
    			cash = 10000;
    		}else if(view == 3){
    			cash = 13000;
    		}else if(view == 4){
    			cash = 15000;
    		}
    		
    		if(cash <= adCash){
    			location.href="${contextPath}/business/ad/create?cash="+cash;
    		}else{
    			alert("잔액이 부족합니다 충전 후 이용 바랍니다.");
    		}
    	}
    

       $("#cashInsertBtn").click(function(){
    	   var amount = $("#cashInput").val();
    	   IMP.init('imp53881560');
			
    	   IMP.request_pay({
    	       pg : 'inicis', // version 1.1.0부터 지원.
    	       pay_method : 'card',
    	       merchant_uid : 'merchant_' + new Date().getTime(),
    	       name : '주문명:결제테스트',
    	       amount : amount, //판매 가격
    	       buyer_email : "${loginUser.email}",
   	        buyer_name : "${loginUser.user_id}",
   	        buyer_tel : "${loginUser.phone}",
   	        buyer_addr : '',
   	        buyer_postcode : ''
    	   }, function(rsp) {
    	       if ( rsp.success ) {
    	           var msg = '결제가 완료되었습니다.';
    	           msg += '고유ID : ' + rsp.imp_uid;
    	           msg += '상점 거래ID : ' + rsp.merchant_uid;
    	           msg += '결제 금액 : ' + rsp.paid_amount;
    	           msg += '카드 승인번호 : ' + rsp.apply_num;
    	           location.href="${contextPath}/business/cash?amount="+amount;
    	       } else {
    	           var msg = '결제에 실패하였습니다.';
    	           msg += '에러내용 : ' + rsp.error_msg;
    	       }
    	       alert(msg);
    	   });
       });
    </script>


</body>
</html>