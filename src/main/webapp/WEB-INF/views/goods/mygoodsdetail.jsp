<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
 <!-- 메세지가 있다면 출력하고 지우기 -->
   <c:if test="${ !empty msg && msg.equals('끌올성공')}">
   		<script>
            swal.fire({
  title: '끌어올리기 성공',
  html: '<br>끌어올리기에 성공하였습니다.<br>상품이 가장 위에 있는 것을 확인 할 수 있습니다.<br>',
  imageUrl: '${ contextPath }/resources/images/logo.png',
  imageWidth: 232,
  imageHeight: 90,
  imageAlt: 'Custom image',
});
   		
   		</script>
   		<c:remove var="msg" />
   		</c:if>
        <table id="goods_detail" style="border :1px solid red;">
            <tr>
                <td>
                    <img src="${ contextPath }/resources/images/filter.png" style="width: 18px;height: 18px;"> 
                    카테고리 : ${g.goodcate.lfilter}-> ${g.goodcate.mfilter}-> ${g.goodcate.sfilter}
                </td>
                <%-- <td colspan="4" id="selectTown" style="text-align: right;">
                    <span style="font-weight: bold; font-size: 15px;">내 동네</span>
                    <span style=" padding-left: 20px;">수원 팔달구 우만동</span>
                    <img src="${ contextPath }/resources/images/recycle.png" style="width: 25px;height: 25px;">     
                </td> --%>
                <td></td>
                <td></td>
                <td style="text-align: right; padding-right:7%;"><a class="btn_gray" onclick="href='${ contextPath }/goods/editView'">수정하기</a></td>
               </tr>
            <tr>
                <td rowspan="7">
                   <div class="slider">
                <img src="${ contextPath }/resources/images/left.png" id="back">
                
                <ul>
                <c:forEach var="f" items="${ g.filelist }">
                   <li  class="item"> <img src="${ contextPath }/resources/images/goodupload/${f}" class="slide_img"></li>
                </c:forEach>
                
                </ul>
                <img src="${ contextPath }/resources/images/left.png" id="next">
		
                </div>
                </td>
            </tr>
            <tr>
                <td colspan="3" id="goodsTitle">${g.gtitle}</td>
                
            </tr>
            <tr>
                <td colspan="3" id="gprice">${g.gprice}원</td>
            </tr>

            <tr>
                <td colspan="3">상태 :${g.gcondition}</td>
            </tr>
            <tr>
                <td colspan="3">거래지역 : ${g.town.address_1}&nbsp; ${g.town.address_2}&nbsp; ${g.town.address_3}</td>
            </tr>
            <tr>
                <td colspan="3" id="goodsContent">${g.gcomment}
                    </td>
            </tr>
            <tr>
                <td><button type="button" class="btn_small" data-bs-toggle="modal" data-bs-target="#likeModal" ><img src="${ contextPath }/resources/images/heart.png" /><p>&nbsp;&nbsp;찜&nbsp;+${fn:length(likelist)}</p></button></td>
                <td><button type="button" class="btn_small"data-bs-toggle="modal" data-bs-target="#upgoodsModal"><img src="${ contextPath }/resources/images/up-arrow.png"/><p>끌어올리기</p></button></td>
                <td><button type="button" class="btn_small" onclick="hideBtn();"><img src="${ contextPath }/resources/images/private.png" /><p>상품숨기기</p></button></td>    
               
            </tr>
        </table>
             <div id="replySection">
            <p style="color: #9a9999; padding: 10px 0 0 10px;">댓글</p>
            <table id="replyTable">
            <c:if test="${ !empty rlist }">
            	<c:forEach var="r" items="${ rlist }">
                <tr>
                    <td colspan="2">${r.user_id } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${r.createDate }</td>
                    
                </tr>
                <tr>
                    <td style="width:950px;">${r.rcontent }</td>
                    <td class="reviews"><img src="${ contextPath }/resources/images/reply.png" style="width : 20px;"><span style="font-size: 1.3em;">&nbsp;1</span></td>
                </tr>
             </c:forEach>
             </c:if>
   			<c:if test="${ empty rlist }">
   				<tr><td colspan="3">작성된 댓글이 없습니다.</tr>
   			</c:if>
                
                
            </table>
           
            <div id="replyWrite">
              
                
                  <p class="reply_left">${ loginUser.user_id }&nbsp;님</p>
                     <textarea id="replyContent" name="rcontent" placeholder="댓글을 작성하시려면 로그인을 해주세요"></textarea>
            
            
                <p id="counter" class="reply_left">(0 / 1000)</p>
               
                <button type="submit" id="writeBtn">등록하기</button>
             
               <script>
             
   $("#writeBtn").on("click", function(){
	   
	   var rcontent = $("#replyContent").val();
	   
	   $.ajax({
		   url : "${contextPath}/goods/insertReply",
		   data : {rcontent : rcontent},
		  type : "post",
		  dataType : "json",
		  success : function(data){
			  console.log(data);//해당 게시글에 작성된 댓글리스트 받아오기
			 //-> <tbody> 안에 data 의 댓글 리스트를 형식에 맞게 세팅 
			     
			  tableBody = $("#replyTable");
              tableBody.html("");
              
              for(var i in data){
            	
              	   var a = "<tr> <td colspan='2'>";
              	   a+=data[i].user_id;
              	   a+='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';

              	   a+=data[i].createDate;
              	   a+="</td></tr><tr><td style='width:950px;'>";
              	   a+=data[i].rcontent;
              	   a+="</td><td class='reviews'><img src='${ contextPath }/resources/images/reply.png' style='width : 20px;'><span style='font-size: 1.3em;'>&nbsp;1</span></td></tr>"
              		  
              	 
              	   tableBody.append(a);
              	   
                 }
            
            //-> 댓글 작성 <textarea> 비워주기
			  $("#replyContent").val("");
		  }
		  
	   });
   });
   </script>
     <script>
					
						var imgs;
						var img_count;
						var img_position = 1;
						imgs = $(".slider ul");
						img_count = imgs.children().length;
						console.log(img_count);
						//button clickc
						$('#back').click(function(){
							if(1<img_position){
								imgs.animate({
									left : '+=400px'
								});
								img_position--;
							}
						});
						$('#next').click(function(){
							if(img_count>img_position){
								imgs.animate({
									left : '-=400px'
								});
								img_position++;
							}
						});
					
				
				</script>
            </div>
           
        </div>
    </section>
	<!-- 끌어올리 Modal -->
	<div class="modal fade" id="upgoodsModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
	
						<table id="upGoods_tb">
							
								<tr>
									<td colspan="2"><img src="${ contextPath }/resources/images/logo.png" width="40%;"
										style="margin: auto;"></td>

								</tr>
								<tr>
									<td colspan="2"><p>‘${g.gtitle}’ 상품을 끌어올리시겠습니까?</p></td>
								</tr>
								<tr>
									<td colspan="2">상품을 끌어올리면 가장 상단에 상품이 위치하게 되며<br>
										끌어올리기 위해 500포인트 결제가 필요합니다.<br> 결제 하시겠습니까?
									</td>
								</tr>
								<tr>
								<td><button type="reset" id="greset"data-bs-dismiss="modal">아니요</button></td>
								<td><button type="submit" id="gsubmit" onclick="goPayment();">네,결제할게요.</button></td>
								</tr>
						</table>
					

				</div>

			</div>
		</div>
	</div>
	<!-- 끌어올리 Modal -->
	<div class="modal fade" id="likeModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
			<div class="modal-header">
					<div class="titleWrap">
						<span class="circle"></span> <span class="welcome">like goods!</span>
						<span class="circle"></span>
					</div>
				</div>
				<div class="modal-body">
	
					<div  style="overflow:scroll; height:150px;">
						 <c:if test="${ !empty likelist }">
            	<c:forEach var="r" items="${ likelist }">
             
                   ${r } <br>
             </c:forEach>
             </c:if>
   			<c:if test="${ empty likelist }">
   			<img src="${ contextPath }/resources/images/logo.png" width="40%;" style="margin: auto;">
   				아직 해당 상품을 찜한사람이 없습니다.
   			</c:if>
					
					</div>
					

				</div>
			<div class="modal-footer">
					
						<button type="button" id="closeBtn" data-bs-dismiss="modal">닫기</button>
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
  title: '숨김처리',
  html: "<br>'${g.gtitle}' 상품을 숨김 처리 하시겠습니까?<br>숨김처리된 상품은 마이페이지를 통해 관리할 수 있습니다.<br>",
  imageUrl: '${ contextPath }/resources/images/logo.png',
  imageWidth: 232,
  imageHeight: 90,
  imageAlt: 'Custom image',
}).then(function(){
	location.href='${contextPath}/goods/hide?gno='+${g.gno};
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
    	function goPayment(){
    		if(${loginUser.point}>=500){
    			
			location.href='${contextPath }/goods/uppay';
    		}else{
    			 Swal.fire({
    				  title: '포인트 부족',
    				  html: '<br>포인트가 부족합니다.<br>포인트는 댓글작성시 받으실 수 있습니다.<br>',
    				  imageUrl: '${ contextPath }/resources/images/logo.png',
    				  imageWidth: 232,
    				  imageHeight: 90,
    				  imageAlt: 'Custom image',
    				}).then(function(){
    					$('#upgoodsModal').modal('hide');
    				});	
    		}
		}
		
    </script>
     	<jsp:include page="../common/footer.jsp"/>
</body>
</html>