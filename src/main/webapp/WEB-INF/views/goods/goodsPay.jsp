<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<!-- iamport  -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<style>
#gbSection{
    margin-top: 3%;
}
#pay_tb{
    margin: auto;
   
    width: 30%;
}
#pay_title{
    text-align: center;
    font-size: 24px;
}
#pay_tb img{
    width: 80px;
    height: 80px; 
    margin-right: 5%;
    float: left;
}
#pay_info{
    float: left;
    display: inline;
}
#price_area{
    font-size: 18px;
    font-weight: bold;
}
#name_area{
    font-size: 14px;
    color :  #9a9999;
}
#point_area{
    font-size: 18px;
    font-weight: bolder;

}
#input_area{
    font-size: 16px;
    width: 450px;
    height: 30px;
}
#point_btn{
    border :0;
    border-radius: 10%;
    background-color: #c7c2c2;
    height: 38px;
    width: 80px;
    margin-left: 20px;

}
.cursor {
cursor : pointer !important;
}
.left_area{
    text-align: left;
    color :  #9a9999;
}
.right_area{
    margin-top: -40px;
    text-align: right;
    
}
#payBtn{
    width: 100%;
    height: 50px;
    border :0;
    border-radius: 10px;
    background-color: #c7c2c2;
    font-size: 17px;
}
</style>
<body>
<jsp:include page="../common/menubar.jsp"/>
	
 <section id="gbSection"style="margin-top: 50px;">
 
               <div id="pay_tb">
                <p id="pay_title">결제하기</p>
                
                <img src="${ contextPath }/resources/images/goodupload/${g.filelist[0]}"  id="menuicon">

                <div id="pay_info">
                    <span id="price_area">${g.gprice }원 </span><br>
                    <span id="name_area">${g.gtitle }</span>
                </div>
                <br><br><br>
                <hr>
                <c:if test="${way.equals('point')}">
                <p id="point_area">포인트</p>
                  <div>
                        <input type="text" id="input_area"placeholder="포인트 입력"/>
                        <button type="button" id="point_btn" class="cursor">전액사용</button>    <br> <br>
                        <span style="color : #9a9999; font-size: 15px;">사용 가능한 포인트</span>&nbsp;&nbsp;
                        <span id="point"style="font-weight: bolder;">${point }P</span>  <br><br>
                        <span style="color : #9a9999; font-size: 14px;">
                        포인트는 1회 사용 시 최대 5만원까지 100원 단위로 안전거래 수수료에서 차감됩니다.</span>   <br><br>
                </div>
                </c:if>
                   
                <p style=" font-weight: bolder; font-size: 18px;">결제금액</p>
                <div>
                   
                    <p class="left_area">상품금액</p>
                    <p class="right_area">${g.gprice}원</p>
                    <p class="left_area">안전거래 수수료</p>
                    <p class="right_area">
                    <fmt:formatNumber var ='fees' value="${g.gprice*0.05}" type="number" pattern="0"/>
                    ${fees}원</p>
                    <c:if test="${way.equals('point')}">
                    <p class="left_area">포인트사용</p>
                    <p class="right_area" id="used_point">원</p>
                    </c:if>
                </div>
                
                <button type="button" id="payBtn" class="cursor"><span id="total_money">${g.gprice+fees}</span>원 결제하기</button>
        
                
             </div>
        <script>
        var total;
            $("#point_btn").click(function(){
            var point1 = ${point};
            var fee = ${fees};
            total=${g.gprice+fees};
            if(point1>=fee){
            	$('#input_area').val(fee);
    			$('#used_point').html("-"+fee+ "원");
    			 
    			total -=fee;
            }else{
            	$('#input_area').val(point1);
    			$('#used_point').html("-"+point1+ "원");
    			 
    			total -=point1;
            }
			
			$('#total_money').html(total);
		});
            $('#input_area').keyup(function(e) {
    			var content = $(this).val();
    			var point2 = ${point};
    			var point3 = ${fees};
    			var total=${g.gprice+fees};
    			
    			$('#used_point').html("-"+content+ "원");
    			total-=content;
    			$('#total_money').html(total);
    		
    			if (point3>= point2) {
    				if(content > point2){
    					alert('포인트보다 더 큰 금액을 입력하실 수 없습니다.');
        				$('#input_area').val(point2);
        				$('#used_point').html("-"+point2+ "원");
        				total =${g.gprice}-point2; 
        				$('#total_money').html(total);
    				}
    				

    			}
    			else if (point2> point3) {
    				if(content > point3){
    					alert('안전거래 수수료보다 더 큰 금액을 입력하실 수 없습니다.');
        				$('#input_area').val(point3);
        				$('#used_point').html("-"+point3+ "원");
        				total =${g.gprice}-point3; 
        				$('#total_money').html(total);
    				}
    				

    			}
    			
    			
				
    		});
            $("#payBtn").click(function() {
            	var amount = 100;
            	var user_point =$("#input_area").val();
        	    var IMP = window.IMP;
        	    IMP.init('imp97294679');
        	    IMP.request_pay({
        	        pg : 'html5_inicis',
        	        pay_method : 'card',
        	        merchant_uid : 'merchant_' + new Date().getTime(),
        	        user_point : user_point,
        	        amount : amount,
        	        buyer_email : "${loginUser.email}",
        	        buyer_name : "${loginUser.user_id}",
        	        buyer_tel : "${loginUser.phone}",
        	        buyer_addr : '',
        	        buyer_postcode : ''
        	    }, function(rsp) {
        	        if ( rsp.success ) {
        	            var msg = '결제가 완료되었습니다!';
        	            msg += '결제 금액 : ' + rsp.paid_amount;
        	            location.href = '${contextPath}/member/payment?amount='+amount+'&user_point='+user_point+'&gno='+${g.gno};
        	        } else {
        	            var msg = '결제에 실패하였습니다. 다시 시도해주세요.';
        	        }
        	    
        	        alert(msg);
        	    });
          	});
            
        </script>
 </section>

  
 

    

 
 <jsp:include page="../common/footer.jsp"/>
</body>
</html>