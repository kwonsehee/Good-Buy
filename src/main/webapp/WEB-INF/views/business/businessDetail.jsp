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
            	<c:if test="${ business.filePath != null}">
                <img id="thumbnail"  src="${contextPath}/resources/${business.filePath}${business.changeName }">
                </c:if>
                <c:if test="${ business.filePath == null}">
                <img  id="thumbnail" src="${contextPath}/resources/images/business/기본썸네일.png">
                </c:if>
                <img id="profileImg" src="${contextPath}/resources/images/business/디테일프로필샘플.png">
                <label id="name">${ business.shopName }</label>
                <button id="likeBtn" onclick="updateFaCount(${business.shopNo})">+단골${ business.faCount}</button>
                <img id="call" src="${contextPath}/resources/images/business/전화기.png" width="50px" height="50px">
                <label id="callLabel">전화문의</label>
                <img id="line" src="${contextPath}/resources/images/business/선.png" >
                <img id="review" src="${contextPath}/resources/images/business/연필.png" width="50px" height="50px">
                <label id="reviewLabel" data-bs-toggle="modal" data-bs-target="#reviewModal">후기작성</label>
            </div>
            <div class="infoArea">
                <label id="infoLabel">정보</label>
                <p id="info">${business.shopIntro }</p>
                <img id="addressImg"src="${contextPath}/resources/images/business/주소.png" width="30px" height="30px">
                <p id="shopAddress">${business.shopAdd }</p>
                <img id="clockImg" src="${contextPath}/resources/images/business/시계.png" width="30px" height="30px">
                <p id="shopTime">${ business.shopTime1 } ~ ${ business.shopTime2 } <c:if test="${business.shopTime3 !=null }">매주 ${b.shopTime3 } 휴무</c:if></p>
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
                <img id="oneBtn"src="${contextPath}/resources/images/business/원버튼.png">
                <label id="newsTitle">${n.newsTitle }</label>
                <p id="newsInfo">${n.shopNews }</p>
            </div>
            </c:forEach>
            </c:if>
             <script>
			        $(document).ready(function(){
						size_div = $('.newsArea').length;
						
						x = 1;
						$('.newsArea:lt('+x+')').addClass('newsAreaflex');
						$('#oneBtn').click(function(){
							x= (x+1 <= size_div)? x+1 : size_div;
							$('.newsArea:lt('+x+')').addClass('newsAreaflex');
						
						
						});
			
					});
			        
			        function updateFaCount(shopNo){
			    		location.href='${contextPath}/business/updateFaCount?shopNo=' + shopNo;
			    	}
        
        	  </script>
            
            <div class="reviewArea">
                <c:if test="${business.reviewCount != 0 }">
                    <label id="reviewTitle">후기</label>
                    <label id="reviewCount">${business.reviewCount }</label>
                    <c:if test="${business.avgGrade == 5 }">
                    <img id="avgGrade" src="${contextPath}/resources/images/business/별점5.png" height="12px" >
                    </c:if>
                    <c:if test="${business.avgGrade == 4 }">
                    <img id="avgGrade" src="${contextPath}/resources/images/business/별점4.png" height="12px" >
                    </c:if>
                    <c:if test="${business.avgGrade == 3 }">
                    <img id="avgGrade" src="${contextPath}/resources/images/business/별점3.png" height="12px" >
                    </c:if>
                    <c:if test="${business.avgGrade == 2 }">
                    <img id="avgGrade" src="${contextPath}/resources/images/business/별점2.png" height="12px" >
                    </c:if>
                    <c:if test="${business.avgGrade == 1 }">
                    <img id="avgGrade" src="${contextPath}/resources/images/business/별점1.png" height="12px" >
                    </c:if>
                    <c:if test="${business.avgGrade == 0 }">
                    <img id="avgGrade" src="${contextPath}/resources/images/business/별점0.png" height="12px" >
            	 	</c:if>
            <c:forEach var="r" items="${ rList }">
                <div id="firstArea">

	                <label id="writer"><img src="${contextPath}/resources/images/business/미니프로필샘플.png"> ${r.nickName }</label>
	                 <c:if test="${r.grade == 5 }">
                    <img  id="grade" src="${contextPath}/resources/images/business/별점5.png" height="12px" >
                    </c:if>
                    <c:if test="${r.grade == 4 }">
                    <img id="grade" src="${contextPath}/resources/images/business/별점4.png" height="12px" >
                    </c:if>
                    <c:if test="${r.grade == 3 }">
                    <img id="grade" src="${contextPath}/resources/images/business/별점3.png" height="12px" >
                    </c:if>
                    <c:if test="${r.grade == 2 }">
                    <img  id="grade" src="${contextPath}/resources/images/business/별점2.png" height="12px" >
                    </c:if>
                    <c:if  test="${r.grade == 1 }">
                    <img id="grade" src="${contextPath}/resources/images/business/별점1.png" height="12px" >
                    </c:if>
                    <c:if test="${r.grade == 0 }">
                    <img id="grade" src="${contextPath}/resources/images/business/별점0.png" height="12px" >
            	 	</c:if>
	                <p id="reviewInfo">${r.content} </p>
	                
  
                </div>
            </c:forEach>
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
							            <td id="star">
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
							            <td><button id="reviewInsertBtn">완료</button></td>
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
       
    </section>

  
   <jsp:include page="../common/footer.jsp"/>
    <script>
     
      /* $("#review").click(function(){
            var url = "${contextPath}/business/reviewWrite";
            var name = "정보관리";
            var _width = '500';
            var _height = '400';
            // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
            var _left = Math.ceil(( window.screen.width - _width )/2);
            var _top = Math.ceil(( window.screen.height - _height )/2); 
            window.open(url, name, 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
       }); */
       
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
    	  console.log(grade+1111);
    	  console.log(star);
    	  var reviewArea = $(".reviewArea");
    	  var p = "";
    	  var div = "";

    	  $.ajax({
    		 url : "${ contextPath }/business/review/insert" ,
    		 data : {content : content , shopNo : shopNo, grade : grade},
    		 type : "post",
    		 contentType: "application/x-www-form-urlencoded; charset=UTF-8",
    		 dataType : "json",
    		 success : function(data){
    			 console.log(data);
    			
    			 console.log(data.length);
    			 
    			
    			 
    			 console.log(reviewArea);
    			 
    			 

    			 var grade1 = "";
    			 
    			 var reviewCount = $("#reviewCount").text(data[0].reviewCount);
    			 var avgGrade = "";
    			 if(data[0].avgGrade == 0){
    				 avgGrade = $("#avgGrade").attr("src","${contextPath}/resources/images/business/별점0.png");
    			 }else if(data[0].avgGrade == 1){
    				 avgGrade = $("#avgGrade").attr("src","${contextPath}/resources/images/business/별점1.png");
    			 }else if(data[0].avgGrade == 2){
    				 avgGrade = $("#avgGrade").attr("src","${contextPath}/resources/images/business/별점2.png");
    			 }else if(data[0].avgGrade == 3){
    				 avgGrade = $("#avgGrade").attr("src","${contextPath}/resources/images/business/별점3.png");
    			 }else if(data[0].avgGrade == 4){
    				 avgGrade = $("#avgGrade").attr("src","${contextPath}/resources/images/business/별점4.png");
    			 }else if(data[0].avgGrade == 5){
    				 avgGrade = $("#avgGrade").attr("src","${contextPath}/resources/images/business/별점5.png");
    			 }
    			 
    			 for(var i in data){
    				 
    			 console.log(data[i].nickName);
    			 var writer =$("#writer").text(data[i].nickName);
    			
    			 if(data[i].grade == 0){
    				 grade1 = $("#grade").attr("src","${contextPath}/resources/images/business/별점0.png");
    			 }else if(data[i].grade == 1){
    				 grade1 = $("#grade").attr("src","${contextPath}/resources/images/business/별점1.png");
    			 }else if(data[i].grade == 2){
    				 grade1 = $("#grade").attr("src","${contextPath}/resources/images/business/별점2.png");
    			 }else if(data[i].grade == 3){
    				 grade1 = $("#grade").attr("src","${contextPath}/resources/images/business/별점3.png");
    			 }else if(data[i].grade == 4){
    				 grade1 = $("#grade").attr("src","${contextPath}/resources/images/business/별점4.png");
    			 }else if(data[i].grade == 5){
    				 grade1 = $("#grade").attr("src","${contextPath}/resources/images/business/별점5.png");
    			 }
					
    			 p = data[i].content;
    			 $("#reviewInfo").text(p);
/*     			div = $("#firstArea").append(writer,grade1,p);
    			 $(".reviewArea").append(reviewCount,avgGrade,div); */
    			 console.log(reviewCount);
    			 console.log(avgGrade);
    			 console.log(div);
    			 console.log(reviewArea);
    			 console.log(writer);
    			 console.log(data[i].content);
				console.log(data[i].grade);
    			 
    			 }
    			 
				
    			 
    		 },
    		 error : function(e){
    			 
    		 }
    		 
    	  });
      }); 
       
    </script>


</body>
</html>