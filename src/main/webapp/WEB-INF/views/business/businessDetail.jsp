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
  
    <link href="${ contextPath }/resources/css/businessCss/businessDetail.css" rel="stylesheet" type="text/css">
 
    
</head>
<body>
 <jsp:include page="../common/menubar.jsp"/>
    
    <section id="gbSection">
        <div class="area">
            <div class="photoArea">
            	<c:if test="${ business.changeName != null}">
                <img id="thumbnail"  src="${contextPath}/resources/images/goodupload/${business.changeName }">
                </c:if>
                <c:if test="${ business.changeName == null}">
                <img  id="thumbnail" src="${contextPath}/resources/images/business/기본썸네일.png">
                </c:if>
            </div>
            
            <div class="allArea">
            	<div id="userPhotoArea">
                   <c:if test="${ !empty loginUser.photo }">
            <img src="${ contextPath }/resources/images/userProfilePhoto/${loginUser.photo}" id="profileImg">
            </c:if>
         
            <c:if test="${ empty loginUser.photo }">
            <img src="${ contextPath }/resources/images/mypage/unknownUser.png" id="profileImg">
            </c:if>
                <div id="shopNameArea">
              	<c:if test="${ faCount == 0 }">
              	<input type="hidden" id="buserId" name="buserId" value="${bisuness.userId }">
                <button id="likeBtn" onclick="updateFaCount(${business.shopNo})">+단골</button>
                </c:if> 
               <c:if test="${ faCount > 0 }">
                <button id="likeBtn" onclick="deleteFaCount(${business.shopNo})">-단골</button>
                </c:if> 
                <label id="name">${ business.shopName }</label>
                </div>
                </div>
                <div id="modalArea">
                <img id="call" src="${contextPath}/resources/images/business/전화기.png" width="50px" height="50px" data-bs-toggle="modal" data-bs-target="#callModal">

                <img id="line" src="${contextPath}/resources/images/business/선.png" data-bs-toggle="modal" data-bs-target="#callModal" >
                <img id="review" src="${contextPath}/resources/images/business/연필.png" width="50px" height="50px" data-bs-toggle="modal" data-bs-target="#reviewModal">
                </div>
                <div id="labelArea">
                <label id="callLabel" data-bs-toggle="modal" data-bs-target="#callModal">전화문의</label>
                <label id="reviewLabel" data-bs-toggle="modal" data-bs-target="#reviewModal">후기작성</label>
                </div>
            </div>
            
            <div class="infoArea">
            	<div id="infoLabelArea">
                <label id="infoLabel">정보</label>
                </div>
                <div id="IntroArea">
                <p id="info">${business.shopIntro }</p>
                </div>
                <div id="addressArea">
                <img id="addressImg"src="${contextPath}/resources/images/business/주소.png" width="30px" height="30px">
                <p id="shopAddress">${business.shopAdd }</p>
                </div>
                <div id="timeArea">
                <img id="clockImg" src="${contextPath}/resources/images/business/시계.png" width="30px" height="30px">
                <p id="shopTime">${ business.shopTime1 } ~ ${ business.shopTime2 } <c:if test="${business.shopTime3 !=null }">매주 ${b.shopTime3 } 휴무</c:if></p>
                </div>
            </div>
            
            <div class="priceArea">
                <label id="priceLabel">가격</label>
                <label id="titleMenu">대표 메뉴 : ${ business.topMenu }</label>
                <p id="menuInfo"> ${ business.menuInfo } </p>
            </div>
            
            <c:if test="${ !empty news  }">
            <c:forEach var="n" items="${ news }">
            <div class="newsArea">
                <label id="newsLabel">소식</label>
                <c:if test="${ n.changeName != null }">
                <img id="newsPhoto" src="${contextPath}/resources/images/goodupload/${n.changeName}">
                </c:if>
                <c:if test="${ n.changeName == null }">
                <img id="newsPhoto" src="${contextPath}/resources/images/business/기본썸네일.png">
                </c:if>
                <label id="newsTitle">${n.newsTitle }</label>
                <p id="newsInfo">${n.shopNews }</p>
            </div>
            </c:forEach>
            
                <div id="plusNewsBtnArea">
            		▽
            	</div>
            	
            </c:if>
            
             <script>
			        $(document).ready(function(){
						size_div = $('.newsArea').length;
						
						x = 1;
						$('.newsArea:lt('+x+')').addClass('newsAreaflex');
						$('#plusNewsBtnArea').click(function(){
							x= (x+1 <= size_div)? x+1 : size_div;
							$('.newsArea:lt('+x+')').addClass('newsAreaflex');
						
						
						});
			
					});
			        
			        function updateFaCount(shopNo){
			        	alert("단골 가게로 등록 하시겠습니까?");
			        	var buserId = "${business.userId}";
			    		location.href='${contextPath}/business/updateFaCount?shopNo=' + shopNo+"&buserId=" + buserId;
			    	}
			        function deleteFaCount(shopNo){
			        	alert("단골 등록을 취소 하시겠습니까?");
			    		location.href='${contextPath}/business/deleteFaCount?shopNo=' + shopNo + "&pageName=shopDetail";
			    	}
        
        	  </script>
            
            <div class="reviewArea">
                <c:if test="${business.reviewCount != 0 }">
                    <label id="reviewTitle">후기</label>
                    <label id="reviewCount">${business.reviewCount }</label>
                    <c:if test="${business.avgGrade == 5 }">
                    <img class="avgGrade" src="${contextPath}/resources/images/business/별점5.png" height="12px" >
                    </c:if>
                    <c:if test="${business.avgGrade == 4 }">
                    <img class="avgGrade" src="${contextPath}/resources/images/business/별점4.png" height="12px" >
                    </c:if>
                    <c:if test="${business.avgGrade == 3 }">
                    <img class="avgGrade" src="${contextPath}/resources/images/business/별점3.png" height="12px" >
                    </c:if>
                    <c:if test="${business.avgGrade == 2 }">
                    <img class="avgGrade" src="${contextPath}/resources/images/business/별점2.png" height="12px" >
                    </c:if>
                    <c:if test="${business.avgGrade == 1 }">
                    <img class="avgGrade" src="${contextPath}/resources/images/business/별점1.png" height="12px" >
                    </c:if>
                    <c:if test="${business.avgGrade == 0 }">
                    <img class="avgGrade" src="${contextPath}/resources/images/business/별점0.png" height="12px" >
            	 	</c:if>
            <c:forEach var="r" items="${ rList }">
                <div class="firstArea">
                	<div class="reviewInfoArea">
          			<c:if test="${r.photo != null }">
	                <label class="writer">${r.nickName }<img class="userPhoto" src="${contextPath}/resources/images/userProfilePhoto/${r.photo}"></label>
	                </c:if>
					<c:if test="${r.photo == null }">
	                <label class="writer">${r.nickName }<img class="userPhoto" src="${contextPath}/resources/images/mypage/unknownUser.png"></label>
	                </c:if>
	                 <c:if test="${r.grade == 5 }">
                    <img  class="grade" src="${contextPath}/resources/images/business/별점5.png" height="12px" >
                    </c:if>
                    <c:if test="${r.grade == 4 }">
                    <img class="grade" src="${contextPath}/resources/images/business/별점4.png" height="12px" >
                    </c:if>
                    <c:if test="${r.grade == 3 }">
                    <img class="grade" src="${contextPath}/resources/images/business/별점3.png" height="12px" >
                    </c:if>
                    <c:if test="${r.grade == 2 }">
                    <img  class="grade" src="${contextPath}/resources/images/business/별점2.png" height="12px" >
                    </c:if>
                    <c:if  test="${r.grade == 1 }">
                    <img class="grade" src="${contextPath}/resources/images/business/별점1.png" height="12px" >
                    </c:if>
                    <c:if test="${r.grade == 0 }">
                    <img class="grade" src="${contextPath}/resources/images/business/별점0.png" height="12px" >
            	 	</c:if>
	                <p class="reviewInfo">${r.content} </p>
	                </div>
	                <c:if test="${r.userId eq loginUser.user_id }">
	                <div class="deleteReviewArea">
	                <button class="deleteReviewBtn" onclick="deleteReview(${r.reviewNo})">x</button>
					</div>
					</c:if>
  					
                </div>

            </c:forEach>
            	 <div id="plusReviewBtnArea">
            		▽
            	</div>
                </c:if>
                 <c:if test="${business.reviewCount == 0 }">
               		<div id="firstArea">
                    <label id="reviewTitle">후기</label>
                    <label id="reviewCount">${business.reviewCount }</label>
                     <h5>후기가 없습니다.</h5>                                
                	</div>
             	 </c:if>
             	
            </div>
            
            
            
        </div>
        
        <!--review Modal -->
	<div class="modal fade" id="reviewModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<div class="titleWrap">
						<span class="circle"></span> <span class="welcome">후기 작성</span>
						<span class="circle"></span>
					</div>
				</div>

				
					<div class="review-body">
						<div class="reviewformWrap">
							
								 <table id="reviewWrite">
							        <tr >
							            <td id="star2">
							                <span id="star">
							                    <a value=1 style="padding-right: 0;">★</a> 
							                    <a  value=2 style="padding-right: 0;">★</a> 
							                    <a  value=3 style="padding-right: 0;">★</a> 
							                    <a  value=4 style="padding-right: 0;">★</a>
							                    <a value=5 style="padding-right: 0;">★</a>
							                <span>
							            </td>
							        </tr>
							        <tr>
							            <td><textarea name="content" id="reviewInput" style="resize: none;" placeholder="가게 이용 후기를 자유롭게 작성해 주세요."></textarea></td>
							        </tr>
							        <tr id="btnArea">
							            <td><button id="reviewInsertBtn" data-bs-dismiss="modal">완료</button></td>
							        </tr>
							    </table>
						
							
						</div>

					</div>
					<div class="modal-footer">
					
						<button type="button" id="closeBtn" data-bs-dismiss="modal">닫기</button>
					</div>
			</div>
		</div>
	</div>
	
	     <!--전화문의 Modal -->
	<div class="modal fade" id="callModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<div class="titleWrap">
						<span class="circle"></span> <span class="welcome">전화 번호</span>
						<span class="circle"></span>
					</div>
				</div>

				
					<div class="call-body">
						<div class="callformWrap">
							<p id="phoneP">${business.shopPhone }<p>
							<p>${business.shopName } 가게의 전화번호 입니다.<p>
						</div>

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
     
       
       // 별 색 채워짐 이벤트
       $('#star a').click(function(){ 
         $(this).parent().children("a").removeClass("on"); 
         $(this).addClass("on").prevAll("a").addClass("on"); 
         //console.log($(this).attr("value")); 
         star = $(this).attr("value");
        console.log(this);
         grade = $(this).attr("value");
  	
         
     });   
       
      $("#reviewInsertBtn").on("click",function(){
    	  var content = $("#reviewInput").val();
    	  var shopNo =${business.shopNo};
    	  var shopName = "${business.shopName}";
    	  var buserId = "${business.userId}";
    	  console.log(grade+1111);
    	  console.log(star);
    	  var userId = "${loginUser.user_id}";
    	  var reviewArea = $(".reviewArea");
		  reviewArea.html("");
		  $('#star a').parent().children("a").removeClass("on");
		  $("#reviewInput").val("");

    	  $.ajax({
    		 url : "${ contextPath }/business/review/insert" ,
    		 data : {content : content , shopNo : shopNo, grade : grade , shopName : shopName , buserId : buserId},
    		 type : "post",
    		 contentType: "application/x-www-form-urlencoded; charset=UTF-8",
    		 dataType : "json",
    		 success : function(data){
 
					 
				 var reviewTitle = $("<label id='reviewTitle'>").text("후기");
    			 var reviewCount = $("<label id='reviewCount'>").text(data[0].reviewCount);
				 var userPhoto;	 
    			 var grade1;
    			 var avgGrade;
    			 
    			
    			 
    			 if(data[0].avgGrade == 0){
    				 avgGrade = $("<img class='avgGrade'>").attr("src","${contextPath}/resources/images/business/별점0.png");
    			 }else if(data[0].avgGrade == 1){
    				 avgGrade = $("<img class='avgGrade'>").attr("src","${contextPath}/resources/images/business/별점1.png");
    			 }else if(data[0].avgGrade == 2){
    				 avgGrade = $("<img class='avgGrade'>").attr("src","${contextPath}/resources/images/business/별점2.png");
    			 }else if(data[0].avgGrade == 3){
    				 avgGrade = $("<img class='avgGrade'>").attr("src","${contextPath}/resources/images/business/별점3.png");
    			 }else if(data[0].avgGrade == 4){
    				 avgGrade = $("<img class='avgGrade'>").attr("src","${contextPath}/resources/images/business/별점4.png");
    			 }else if(data[0].avgGrade == 5){
    				 avgGrade = $("<img class='avgGrade'>").attr("src","${contextPath}/resources/images/business/별점5.png");
    			 }
    			 $(".reviewArea").append(reviewTitle,reviewCount,avgGrade); 
    			 for(var i in data){
    		     var div = $("<div class='firstArea'>");
    		     var reviewInfoArea = $("<div class='reviewInfoArea'>");
    			 var Photo = data[i].photo;
    			 var writer =$("<label class='writer'>").text(data[i].nickName);
    			 if( Photo !=null){
    			     userPhoto = $("<img class='userPhoto'>").attr("src","${ contextPath }/resources/images/userProfilePhoto/data[i].photo");
    			 }else if(Photo == null){
    				 userPhoto = $("<img class='userPhoto'>").attr("src","${ contextPath }/resources/images/mypage/unknownUser.png");
    			 }
    			 
    			 
    			 
    			 
    			 
    			 if(data[i].grade == 0){
    				 grade1 = $("<img class='grade'>").attr("src","${contextPath}/resources/images/business/별점0.png");
    			 }else if(data[i].grade == 1){
    				 grade1 = $("<img class='grade'>").attr("src","${contextPath}/resources/images/business/별점1.png");
    			 }else if(data[i].grade == 2){
    				 grade1 = $("<img class='grade'>").attr("src","${contextPath}/resources/images/business/별점2.png");
    			 }else if(data[i].grade == 3){
    				 grade1 = $("<img class='grade'>").attr("src","${contextPath}/resources/images/business/별점3.png");
    			 }else if(data[i].grade == 4){
    				 grade1 = $("<img class='grade'>").attr("src","${contextPath}/resources/images/business/별점4.png");
    			 }else if(data[i].grade == 5){
    				 grade1 = $("<img class='grade'>").attr("src","${contextPath}/resources/images/business/별점5.png");
    			 }
    		     var p = $("<p class='reviewInfo'>").text(data[i].content);
    		     
    		     var reviewNo = data[i].reviewNo;	 
  				writer.append(userPhoto);	
   				reviewInfoArea.append(writer,grade1,p);
   				div.append(reviewInfoArea);
      			 $(".reviewArea").append(div); 
    		     
    			 if(data[i].userId == userId ){
    				 var deleteBtnArea =$("<div class='deleteReviewArea'>");
        			 var deleteBtn = $("<button class='deleteReviewBtn'  onclick='deleteReview("+reviewNo+")'>");
        			 deleteBtn.text("x");
        			 deleteBtnArea.append(deleteBtn);
    				 reviewInfoArea.append(writer,grade1,p);
    	  			div.append(deleteBtnArea);

    				 
    			 }
    			 

    			 
    			 }
    			 
    			 var plusBtnArea = $("<div id='plusReviewBtnArea'>")
    			 plusBtnArea.text("▽");
    			 $(".reviewArea").append(plusBtnArea); 
    			 
    			 plusReview();
    			 
    		 },
    		 error : function(e){
    			 
    		 }
    		 
    	  });
      }); 
       
      
       
       function deleteReview(reviewNo){
       	console.log("됨?")
   	   var content = $("#reviewInput").val();
    	   var shopNo2 =${business.shopNo};
    	var userId2 = "${loginUser.user_id}";

    	  var reviewArea2 = $(".reviewArea");
		  reviewArea2.html("");
		  $('#star a').parent().children("a").removeClass("on");
		  $("#reviewInput").val("");
   	   
   	   $.ajax({
   		   url :"${ contextPath }/business/review/delete",
   		   data : {reviewNo : reviewNo , shopNo2 : shopNo2},
   		   type : "post",
   		   dataType : "json",
   			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
   		   success : function(data1){
   			   console.log("여기?");
   			   console.log(data1);
   			   var reviewTitle2 = $("<label id='reviewTitle'>").text("후기");
     			 var reviewCount2 = $("<label id='reviewCount'>").text(data1[0].reviewCount);
 				  var userPhoto2;	 
     			  var grade2;
     			  var avgGrade2;
     			 
     			
     			 
     			 if(data1[0].avgGrade == 0){
     				 avgGrade2 = $("<img class='avgGrade'>").attr("src","${contextPath}/resources/images/business/별점0.png");
     			 }else if(data1[0].avgGrade == 1){
     				 avgGrade2 = $("<img class='avgGrade'>").attr("src","${contextPath}/resources/images/business/별점1.png");
     			 }else if(data1[0].avgGrade == 2){
     				 avgGrade2 = $("<img class='avgGrade'>").attr("src","${contextPath}/resources/images/business/별점2.png");
     			 }else if(data1[0].avgGrade == 3){
     				 avgGrade2 = $("<img class='avgGrade'>").attr("src","${contextPath}/resources/images/business/별점3.png");
     			 }else if(data1[0].avgGrade == 4){
     				 avgGrade2 = $("<img class='avgGrade'>").attr("src","${contextPath}/resources/images/business/별점4.png");
     			 }else if(data1[0].avgGrade == 5){
     				 avgGrade2 = $("<img class='avgGrade'>").attr("src","${contextPath}/resources/images/business/별점5.png");
     			 }
     			$(".reviewArea").append(reviewTitle2,reviewCount2,avgGrade2); 
     			 for(var j in data1){
     		     var div2 = $("<div class='firstArea'>");
     		    var reviewInfoArea2 = $("<div class='reviewInfoArea'>");
     			 var Photo2 = data1[j].photo;
     			 var writer2 =$("<label class='writer'>").text(data1[j].nickName);
     			var loot = "${contextPath}/resources/images/userProfilePhoto/";
	   				var changeName = data[j].photo;
     			 if( Photo2 !=null){
     			     userPhoto2 = $("<img class='userPhoto'>").attr("src",loot+changeName);
     			 }else if(Photo2 == null){
     				 userPhoto2 = $("<img class='userPhoto'>").attr("src","${ contextPath }/resources/images/mypage/unknownUser.png");
     			 }
     			 
     			 
     			 
     			 
     			 if(data1[j].grade2 == 0){
     				 grade2 = $("<img class='grade'>").attr("src","${contextPath}/resources/images/business/별점0.png");
     			 }else if(data1[j].grade == 1){
     				 grade2 = $("<img class='grade'>").attr("src","${contextPath}/resources/images/business/별점1.png");
     			 }else if(data1[j].grade == 2){
     				 grade2 = $("<img class='grade'>").attr("src","${contextPath}/resources/images/business/별점2.png");
     			 }else if(data1[j].grade == 3){
     				 grade2 = $("<img class='grade'>").attr("src","${contextPath}/resources/images/business/별점3.png");
     			 }else if(data1[j].grade == 4){
     				 grade2 = $("<img class='grade'>").attr("src","${contextPath}/resources/images/business/별점4.png");
     			 }else if(data1[j].grade == 5){
     				 grade2 = $("<img class='grade'>").attr("src","${contextPath}/resources/images/business/별점5.png");
     			 }
     		     var p2 = $("<p class='reviewInfo'>").text(data1[j].content);

    			var reviewNo = data1[j].reviewNo;	 
 				writer2.append(userPhoto2);	
  				reviewInfoArea2.append(writer2,grade2,p2);
  				div2.append(reviewInfoArea2);
     			 $(".reviewArea").append(div2); 
    			 
     			 if(data1[j].userId == userId2 ){
    				 var deleteBtnArea2 =$("<div class='deleteReviewArea'>");
        			 var deleteBtn2 = $("<button class='deleteReviewBtn' onclick='deleteReview("+reviewNo+")'>");
        			 deleteBtn2.text("x");
        			 deleteBtnArea2.append(deleteBtn2);
    				 reviewInfoArea2.append(writer2,grade2,p2);
    	  			div2.append(deleteBtnArea2);
    	  			
    				
    				 
    			 }
    			 
     			 
     			 }
     			 
     			 var plusBtnArea2 = $("<div id='plusReviewBtnArea'>");
    			 plusBtnArea2.text("▽");
    			 $(".reviewArea").append(plusBtnArea2); 
    			 
    			 
     			 
     			 plusReview();
     			 
   			   
   		   },
   		   error : function(e){
   			   
   		   }
   	   });
      }
     
		
       
       function plusReview (){
    	   size_div = $('.firstArea').length;
			
			x = 5;
			$('.firstArea:lt('+x+')').addClass('firstAreaflex');
			$('#plusReviewBtnArea').click(function(){
				x= (x+1 <= size_div)? x+5 : size_div;
				$('.firstArea:lt('+x+')').addClass('firstAreaflex');
			
			
			});
       }
    	   
       $(document).ready(function(){
    	   plusReview();

		});   
       
    </script>


</body>
</html>