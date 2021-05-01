<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Good-Buy</title>
<!-- css -->
<link href="${ contextPath }/resources/css/goods/sellerInfo.css" rel="stylesheet" type="text/css">
<link href="${ contextPath }/resources/css/goods/sellerfollowing.css" rel="stylesheet" type="text/css">
  <!--sweetalert2-->
  <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
  <!--https://sweetalert2.github.io/ 에 다양하게 사용할 수 있는 방법이 나와있다.-->
<!-- 예를들어 이미지 등을 바꿀 수 있다. 확인 취소버튼을 추가한다거나 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<!-- Optional: include a polyfill for ES6 Promises for IE11 -->
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
</head>
<body>
 <section id="gbSection">
 
       <jsp:include page="../common/menubar.jsp"/>
       <!-- 메세지가 있다면 출력하고 지우기 -->
   <c:if test="${ !empty msg && msg.equals('userReportSuccess')}">
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
   <c:if test="${ !empty msg && msg.equals('userReportFail')}">
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
        
        <h3 style="display: inline-block; margin-left: 45%; margin-top: 4%; ">판매자 페이지</h3>
        <a class="btn_gray" data-bs-toggle="modal" data-bs-target="#reportModal">신고하기</a>
      
        <table id="seller_tb">
            <tr>
                <td>
                <c:if test="${ seller.photo ne null }">
                <img src="${ contextPath }/resources/images/userProfilePhoto/${ seller.photo }" style="width: 150px; border: 1px solid black; border-radius: 100%;">
                </c:if>
                 <c:if test="${ seller.photo eq null }">
                
                <img src="${ contextPath }/resources/images/person.png" style="width: 150px; border: 1px solid black; border-radius: 100%;">
                </c:if>
                </td>
                <td colspan="2" style="padding-left:5%;">안녕하세요~ 서로 좋은 물건 공유합시다
                    아나바다 운동을 일으켜봅시당@@#@하이하이 저는 뭐시기입니아아</td>
            </tr>
            <tr>
                <th id="seller_id">${ seller.nickname }</th>
                <td style="padding-left:5%;" id="follow_area">
                <c:if test="${follow==0 }">
              	  <button type="button" class="btn_small" id="followBtn">	
              	  <img src="${ contextPath }/resources/images/follower.png" />
              	  <p>&nbsp;&nbsp;&nbsp;팔로우</p></button>
              	 </c:if>
              	 <c:if test="${follow>0 }">
              	  <button type="button" class="btn_small" id="canselfollowBtn">	
              	 
              	  <p>&nbsp;&nbsp;&nbsp;&nbsp;팔로우&nbsp;&nbsp;취소</p></button>
              	 </c:if>
                </td>
                <td><button type="button" class="btn_small" onclick="sendToseller();"><img src="${ contextPath }/resources/images/airplane.png"/><p>쪽지보내기</p></button></td>
            </tr>
            
        </table>
        <!-- 신고 Modal -->
	<div class="modal fade" id="reportModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-body">
					<form method="POST" action="${ contextPath }/report/userinsert">
					<input type="hidden" name="reported_id" value="${seller.user_id }">
					<table id="report_tb">
      
        <tr>
            <td  colspan="2"> <img src="${ contextPath }/resources/images/logo.png" width="40%;" style="margin: auto;"></td>

        </tr>
        <tr><td colspan="2"><p>판매자 신고 사유</p></td></tr>
        <tr>
            <td colspan="2">
                <select id="reportSelect" name="retitle">
                    <option>이상한 상품을 올려놨어요.</option>
                    <option>사적으로 연락이 와요. </option>
                    <option>거래 금지 품목을 거래하고 있어요.</option>
                    <option>물품 정보(카테고리, 가격, 사진)이 부정확해요.</option>
                    <option>언어폭력(비방, 욕설, 성희롱)이 기재되어 있어요.</option>
                    <option>기타.</option>
                </select>
            </td>
        </tr>
   
        <tr><td colspan="2"> <p>신고 내용</p></td></tr>
        <tr>
            <td colspan="2">
                <textarea name="re_content">

                </textarea>
            </td>
            
        </tr>
        <tr>
        <td><button type="reset" id="greset"data-bs-dismiss="modal">취소하기</button></td>
        <td><button type="submit" id="gsubmit" >신고하기</button></td>
        </tr>
   
    </table>
					</form>
					
				</div>

			</div>
		</div>
	</div>
	

        <script>
         
        function sendToseller(){
        	var seller_id = $("#seller_id").text();
            var url = "${ contextPath }/goods/sendToseller?seller="+seller_id;
            var name = "쪽지보내기";
            var _width = '500';
            var _height = '550';
 
    // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
    var _left = Math.ceil(( window.screen.width - _width )/2);
    var _top = Math.ceil(( window.screen.height - _height )/2); 
 
    window.open(url, name, 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
 
        }
        
        
        $(function(){
            $(document).on("click","#followBtn",function(){
            	var seller_id = $("#seller_id").text();
           
            console.log(seller_id);
           	 document.getElementById("follow_area").value='';
          	  
               $.ajax({
                  url : "${contextPath}/member/follow",
                  data : {seller : seller_id},
                  type : "post",
                  success : function(data){
                     if(data == "success"){
                   	  values ="<button type='button' class='btn_small' id='canselfollowBtn'>" 
                   		 
                             +"<p>&nbsp;&nbsp;&nbsp;&nbsp;팔로우&nbsp;&nbsp;취소</p></button>"
                   	  
                             
                   	   $("#follow_area").html(values);
                   		swal.fire({
                     	  title: 'Follow',
                     	  html: '<br>\'데세헤\' 님을 팔로우하였습니다.<br>판매자의 상품을 더욱더 빨리 만나보실 수 있습니다.<br>',
                     	  imageUrl: '${ contextPath }/resources/images/logo.png',
                     	  imageWidth: 232,
                     	  imageHeight: 90,
                     	  imageAlt: 'Custom image',
                     	}); 
                     }  
                     else{
                    	 /* swal.fire({
                    	   	  title: 'Follow',
                    	   	  html: '<br>\'데세헤\' 님을 팔로우에 실패하였습니다.<br>이용에 불편을 드려서 죄송합니다.<br>',
                    	   	  imageUrl: '${ contextPath }/resources/images/logo.png',
                    	   	  imageWidth: 232,
                    	   	  imageHeight: 90,
                    	   	  imageAlt: 'Custom image',
                    	   	}); */
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
          $(function(){
          	 $(document).on("click","#canselfollowBtn",function(){
          		var seller_id = $("#seller_id").text();
              	 document.getElementById("follow_area").value='';
               $.ajax({
                  url : "${contextPath}/member/unfollow",
                  data : {seller : seller_id},
                  type : "post",
                  success : function(data){
                      if(data == "success"){
                    	  values ="<button type='button' class='btn_small' id='followBtn'>" 
                    		  +"<img src='${ contextPath }/resources/images/follower.png'/>"
                              +"<p>&nbsp;&nbsp;&nbsp;팔로우</p></button>"
                    	  
                              
                    	  $("#follow_area").html(values);
                    		swal.fire({
                      	  title: 'Follow',
                      	  html: '<br>\'데세헤\' 님을 팔로우를 취소하였습니다.<br>판매자의 상품을 더욱더 빨리 만나보실 수 있습니다.<br>',
                      	  imageUrl: '${ contextPath }/resources/images/logo.png',
                      	  imageWidth: 232,
                      	  imageHeight: 90,
                      	  imageAlt: 'Custom image',
                      	});
                      }  
                      else{
                     	 swal.fire({
                     	   	  title: 'Follow',
                     	   	  html: '<br>\'데세헤\' 님을 팔로우에 실패하였습니다.<br>이용에 불편을 드려서 죄송합니다.<br>',
                     	   	  imageUrl: '${ contextPath }/resources/images/logo.png',
                     	   	  imageWidth: 232,
                     	   	  imageHeight: 90,
                     	   	  imageAlt: 'Custom image',
                     	   	});
                      }
                         
                   },
                   error : function(e){
                      alert("error code : " + e.status + "\n"
                            + "message : "+ e.responseText);
                   }
                })
             })
          })
        </script>
        
  	<div id="reviewSection" style="border : 1px solid red;">
		<div style="text-align: center; padding-bottom: 2%;">
			<a class="goods_text" onclick="changeMenu(0)" style="color: #9a9999; font-weight: bold;">상품</a>
			<a class="review_text" onclick="changeMenu(1)"style="color: #9a9999;" >거래후기</a>
			<a class="following_text" onclick="changeMenu(2)" style="color: #9a9999;">팔로잉</a> 
			<a class="follower_text" onclick="changeMenu(3)" style="color: #9a9999;">팔로우</a>
		</div>
		<div id="followlist_area" class="following_div" style="border : 1px solid blue;">
        <!-- 판매자를 팔로우하는 list 부분 -->
       	<jsp:include page="../goods/sellerfollowing.jsp"/>
        </div>
        <div id="followlist_area" class="review_div" style="border : 1px solid blue;">
        <!--리뷰 list 부분 -->
		<jsp:include page="../goods/reviewDiv.jsp"/>
		</div>
		<div id="followlist_area" class="follower_div" style="border : 1px solid blue;">
        <!-- 판매자가 팔로우하는 list 부분 -->
    	<jsp:include page="../goods/sellerfollow.jsp"/> 
    	</div>
    	<div id="followlist_area" class="goods_div" style="border : 1px solid blue;"> 
        <!-- 판매자의 상품 list 부분 -->
        <jsp:include page="../goods/sellerGoods.jsp"/>   
		</div>
		
	</div>
       
    <script type="text/javascript">
    function changeMenu(num){
    	console.log(num);
    	if(num==0){
    		 $(".review_div").css("display","none");
    		 $(".follower_div").css("display","none");
    		 $(".following_div").css("display","none");
    		 $(".goods_div").toggle();
    		 $(".following_text .follower_text .review_text").css("color","#9a9999");
    		 $(".following_text .follower_text .review_text").css("font-weight","");
    		 $(".goods_text").css("color","black");
    		 $(".goods_text").css("font-weight","bold");
    		 
    	}else if(num==1){
   		 $(".goods_div").css("display","none");
		 $(".follower_div").css("display","none");
		 $(".following_div").css("display","none");
		 $(".review_div").toggle();
		 $(".following_text .goods_text .follower_text").css("color","#9a9999");
		 $(".following_text .goods_text .follower_text").css("font-weight","");
		 $(".review_text").css("color","black");
		 $(".review_text").css("font-weight","bold");
		 
	}
    	else if(num==2){
      	 $(".goods_div").css("display","none");
   		 $(".follower_div").css("display","none");
   		 $(".review_div").css("display","none");
   		 $(".following_div").toggle();
   		 $(".review_text .goods_text .follower_text").css("color","#9a9999");
   		 $(".review_text .goods_text .follower_text").css("font-weight","");
   		 $(".following_text").css("color","black");
   		 $(".following_text").css("font-weight","bold");
   		 
   	}
    	else if(num==3){
      	 $(".goods_div").css("display","none");
   		 $(".review_div").css("display","none");
   		 $(".following_div").css("display","none");
   		 $(".follower_div").toggle();
   		 $(".following_text .goods_text .review_text").css("color","#9a9999");
   		 $(".following_text .goods_text .review_text").css("font-weight","");
   		 $(".follower_text").css("color","black");
   		 $(".follower_text").css("font-weight","bold");
   		 
   	}
    	
    	
       
     }
    </script>
    </section>

	<jsp:include page="../common/footer.jsp"/>
</body>
</html>