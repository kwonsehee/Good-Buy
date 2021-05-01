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
  
    <link href="${ contextPath }/resources/css/businessCss/businessChange.css" rel="stylesheet" type="text/css">
</head>
<body>
    
	<jsp:include page="../common/menubar.jsp"/>
    <section id="gbSection">
            	<form action="${ contextPath }/business/update" method="post" id="update" enctype="multipart/form-data">
        <div class="area">
    		
    		
            <div class="photoArea">
            	<c:if test="${b.changeName !=null }">
                <img id="photoPlus"src="${contextPath}/resources/images/goodupload/${b.changeName}">
                </c:if>
            	<c:if test="${b.changeName ==null }">
                <img id="photoPlus"src="${contextPath}/resources/images/business/사진추가샘플.png">
                </c:if>
                <input id="profilePhoto" type="file" name="file"  >
            </div>
             <div class="allArea">
                <div id="userPhotoArea">
                <img id="profileImg" src="${contextPath}/resources/images/business/디테일프로필샘플.png">
                <div id="shopNameArea">
                <button id="likeBtn" disabled="disabled">단골${b.faCount }</button>
                <label id="name">${b.shopName }</label>
                </div>
             	</div>
             	
             	<div id="modalArea">
                <img id="adImg" src="${contextPath}/resources/images/business/메가폰.png" width="50px" height="50px" onclick="location.href='${contextPath}/business/ad'">
                <img id="line" src="${contextPath}/resources/images/business/선.png" >
                <img id="pen" src="${contextPath}/resources/images/business/연필.png" width="50px" height="50px" >
             	</div>
             	
             	<div id="labelArea">
                <label id="adLabel">광고하기</label>
                <label id="newsLabel">소식발행</label> 
             	</div>
             	
            </div>
            <div class="infoArea">


								<h4>카테고리</h4><br>
								<select id="category" name="shopCate">
									<c:if test="${b.shopCate  == '일자리'}">
				                    <option value="일자리" selected >일자리</option>
				                    <option value="과외">과외/클래스</option>
				                    <option value="농수산물">농수산물</option>
				                    <option value="부동산">부동산</option>
				                    <option value="중고차">중고차</option>
				                    <option value="전시">전시/행사</option>
				                    <option value="지역업체">지역업체</option>
				                    </c:if>
				                    <c:if test="${b.shopCate  == '과외'}">
				                    <option value="일자리">일자리</option>
				                    <option value="과외" selected>과외/클래스</option>
				                    <option value="농수산물">농수산물</option>
				                    <option value="부동산">부동산</option>
				                    <option value="중고차">중고차</option>
				                    <option value="전시">전시/행사</option>
				                    <option value="지역업체">지역업체</option>
				                    </c:if>
				                    <c:if test="${b.shopCate  == '농수산물'}">
				                    <option value="일자리" >일자리</option>
				                    <option value="과외">과외/클래스</option>
				                    <option value="농수산물" selected>농수산물</option>
				                    <option value="부동산">부동산</option>
				                    <option value="중고차">중고차</option>
				                    <option value="전시">전시/행사</option>
				                    <option value="지역업체">지역업체</option>
				                    </c:if>
				                    <c:if test="${b.shopCate  == '부동산'}">
				                    <option value="일자리"  >일자리</option>
				                    <option value="과외">과외/클래스</option>
				                    <option value="농수산물">농수산물</option>
				                    <option value="부동산" selected>부동산</option>
				                    <option value="중고차">중고차</option>
				                    <option value="전시">전시/행사</option>
				                    <option value="지역업체">지역업체</option>
				                    </c:if>
				                    <c:if test="${b.shopCate  == '중고차'}">
				                    <option value="일자리"  >일자리</option>
				                    <option value="과외">과외/클래스</option>
				                    <option value="농수산물">농수산물</option>
				                    <option value="부동산">부동산</option>
				                    <option value="중고차" selected>중고차</option>
				                    <option value="전시">전시/행사</option>
				                    <option value="지역업체">지역업체</option>
				                    </c:if>
				                    <c:if test="${b.shopCate  == '전시'}">
				                    <option value="일자리"  >일자리</option>
				                    <option value="과외">과외/클래스</option>
				                    <option value="농수산물">농수산물</option>
				                    <option value="부동산">부동산</option>
				                    <option value="중고차" >중고차</option>
				                    <option value="전시" selected>전시/행사</option>
				                    <option value="지역업체">지역업체</option>
				                    </c:if>
				                    <c:if test="${b.shopCate  == '지역업체'}">
				                    <option value="일자리"  >일자리</option>
				                    <option value="과외">과외/클래스</option>
				                    <option value="농수산물">농수산물</option>
				                    <option value="부동산">부동산</option>
				                    <option value="중고차" >중고차</option>
				                    <option value="전시">전시/행사</option>
				                    <option value="지역업체" selected>지역업체</option>
				                    </c:if>
                				</select><br><br>
  								<h4>가게명</h4><br>
								<input type="text" id="nameInput" name="shopName" placeholder="가게명을 입력해 주세요." value="${ b.shopName }"><br><br>
								<h4>주소</h4><br>
								<input type="text" id="addressInput" name="shopAdd" placeholder="주소를 입력해 주세요." value="${ b.shopAdd }"><br><br>
								<h4>전화번호</h4><br>
								<input type="text" id="phoneInput" name="shopPhone" placeholder="고객이 연락할 수 있는 번호를 적어주세요." value="${ b.shopPhone }"><br><br>
								<h4>소개 문구</h4><br>
								<textarea name="shopIntro" id="infoInput" style="resize: none;" placeholder="상품/서비스를 소개하는 문구를 작성해 주세요.">${ b.shopIntro }</textarea><br><br>
								<h4>영업 시간</h4><br>
								<div>
								<input type="text" id="timeInput1" name="shopTime1" placeholder="시작" value="${ b.shopTime1 }">~
								
               					<input type="text" id="timeInput2" name="shopTime2" placeholder="종료" value="${ b.shopTime2 }" ><br>
								<input type="text" id="timeInput3" name="shopTime3" placeholder="휴무요일을 적어주세요." value="${ b.shopTime3 }"><br>
								<input type="hidden" name="shopNo" value="${b.shopNo }">
								<input type="hidden" name="userId" value="${b.userId }">
								</div>
			
            </div>
            <div class="priceArea">		
				<h4>대표 메뉴</h4><br>
				<input type="text" id="topMenu" name="topMenu" placeholder="대표 메뉴를 입력하세요. (예: 커피)"  value="${ b.topMenu }"><br><br>
				<h4>추가 설명</h4><br>
				<textarea name="menuInfo" id="menuInfo" style="resize: none;" placeholder="다른 메뉴와 설명이 필요하다면 적어주세요." >${b.menuInfo }</textarea><br>
				
            </div>
            <c:if test="${ !empty nList }">
			<c:forEach var="n" items="${ nList }">
		 	<div class="newsArea">
		 		<div class="deleteNewsArea">
                <label class="newsLabel2">소식</label> 
                <button class="deleteNewsBtn" onclick="deleteNews(${n.nNo})" >x</button>
                </div>
                <c:if test="${ n.changeName != null }">
                <img class="newsPhoto" src="${contextPath}/resources/images/goodupload/${n.changeName}">
                </c:if>
                <c:if test="${ n.changeName == null }">
                <img class="newsPhoto" src="${contextPath}/resources/images/business/기본썸네일.png">
                </c:if>
                <label class="newsTitle">${n.newsTitle }</label>
                <p class="newsInfo">${n.shopNews }</p>
            </div>  
         	</c:forEach>
         	 <div id="plusNewsBtnArea">
            		▽
            </div>
         	</c:if>
           
            <script>
            
            /*
 					function deleteNews(nNo){
						var shopNo = ${b.shopNo};
						var newsArea = $(".newsArea");
						  newsArea.html("");
 						
 						$.ajax({
 							url :"${ contextPath }/business/news/delete",
 				   		   data : {nNo : nNo, shopNo : shopNo},
 				   		   type : "post",
 				   		   dataType : "json",
 				   			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
 				   			success : function(data){
 				   			console.log("됨?");
 				   				for(var i in data){
 				   				var deleteNewsArea = $("<div class='deleteNewsArea'>");
 				   				var newsLabel2 = $("<label class='newsLabel2'>").text("소식");
 				   				var deleteNewsBtn = $("<button class='deleteNewsBtn'>");
 				   				
 				   				if(data[i].changeName != null){
 				   				var newsPhoto = $("<img class='newsPhoto'>").attr("src","${contextPath}/resources/images/goodupload/data[i].changeName");
 				   				}else {
 				   				var	newsPhoto = $("<img class='newsPhoto'>").attr("src","${contextPath}/resources/images/business/기본썸네일.png");
 				   				}
 				   				
 				   				var newsTitle = $("<label class='newsTitle'>").text(data[i].newsTitle);
 				   				var newsInfo = $("<p clasee='newsInfo'>").text(data[i].shopNews);
 				   				
 				   				}
 				   				
 				   				var plusNewsBtnArea = $("<div id='plusNewsBtnArea'>").text("▽")
 				   			},
 				   			error : function(e){
 				   				
 				   			}
 						});
 					}           
            
            
            */
            
            
			        $(document).ready(function(){
						size_div = $('.newsArea').length;
						
						x = 1;
						$('.newsArea:lt('+x+')').addClass('newsAreaflex');
						$('#plusNewsBtnArea').click(function(){
							x= (x+1 <= size_div)? x+1 : size_div;
							$('.newsArea:lt('+x+')').addClass('newsAreaflex');
						
						
						});
			
					});
        
        	  </script>
           
        </div>
        </form>
        
        <div id="btnArea">
        <button class="finalBtn" onclick="location.href='${contextPath}/business/update'">수정</button>
        
        
        <button id="deleteBtn" onclick="location.href='${contextPath}/business/delete'">삭제</button>
     
        </div>
      
        
        	
   
	 
	
       
    </section>
 	<jsp:include page="../common/footer.jsp"/>
   

    <script>
		    $("#pen").click(function(){
		        var url = "${ contextPath }/business/newsWriter";
		        var name = "소식발행";
		        var _width = '520';
		        var _height = '700';
		        // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
		        var _left = Math.ceil(( window.screen.width - _width )/2);
		        var _top = Math.ceil(( window.screen.height - _height )/2); 
		        window.open(url, name, 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
		   });
     
       $("#photoPlus").click(function(){
    	   $("#profilePhoto").click();
       });
       $(function(){
					// input type="file" 태그에 파일이 첨부 될 때 동작하는 이벤트
					$("[type=file]").change(function(){
						loadImg(this);
					});
				});
				
				function loadImg(element){
					// element를 판별해서 알맞은 위치에 preview 표현하기
					// console.log(element.name);
					
					// input type="file" 엘리먼트에 첨부 파일 속성, 첨부파일이 잘 존재하는지 확인
					if(element.files && element.files[0]){
						// 파일을 읽어들일 FileReader 객체 생성
						var reader = new FileReader();
						
						// 파일 읽기가 다 완료 되었을 때 실행 되는 메소드
						reader.onload = function(e){
							
							var selector;
							var size;
							
							switch(element.name){
							case "file" :
								selector = "#photoPlus";
								size = {width:"654px", height:"316px" };
								break;
							
							};
							$(selector).attr("src", e.target.result).css(size);
							
							console.log(e);
							console.log(e.target);
							console.log(e.target.result);
						};
						
						// 파일 읽기 하는 메소드
						reader.readAsDataURL(element.files[0]);
					};
				};
			
		$(".finalBtn").click(function(){
			$("#update").submit();
		});
			
    </script>


</body>
</html>