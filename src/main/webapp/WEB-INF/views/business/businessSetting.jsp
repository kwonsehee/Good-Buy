<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>당신 근처의 굿-바이 마켓 Good-Buy!</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <!-- 공통 UI -->
  
    <link href="${ contextPath }/resources/css/businessCss/businessSetting.css" rel="stylesheet" type="text/css">
</head>
<body>
    
	<jsp:include page="../common/menubar.jsp"/>
    <section id="gbSection">
        <div class="area">
            <div class="photoArea">
            	<form action="${ contextPath }/business/photoInsert" method="post" id="photoInsertForm" enctype="multipart/form-data">
                <img id="photoPlus"src="${contextPath}/resources/images/business/사진추가샘플.png">
                <input id="profilePhoto" type="file" name="profilePhoto" >
                </form>
                <img id="profileImg" src="${contextPath}/resources/images/business/디테일프로필샘플.png">
                <div id="nameArea">
                <label id="name">가게명</label>
                </div>
               
                <button id="likeBtn">단골0</button>
                <img id="adImg" src="${contextPath}/resources/images/business/메가폰.png" width="50px" height="50px" onclick="location.href='${contextPath}/business/ad'">
                <label id="adLabel">광고하기</label>
                <img id="line" src="${contextPath}/resources/images/business/선.png" >
                <img id="pen" src="${contextPath}/resources/images/business/연필.png" width="50px" height="50px" >
                <label id="newsLabel">소식발행</label>
            </div>
            <div class="infoArea">
                <label id="infoLabel">정보</label>
               <div id="infoPlusArea">
                   <label id="infoPlus" >+ 소개 문구 등록</label>
               </div>
                <div id="addressArea">
                    <img id="addressImg"src="${contextPath}/resources/images/business/주소.png" width="30px" height="30px">
                    <label id="shopAddress">주소를 추가해 주세요.</label>
                </div>
                <div id="timeArea">
                    <img id="clockImg" src="${contextPath}/resources/images/business/시계.png" width="30px" height="30px">
                    <label id="shopTime">영업시간을 추가해 주세요.</label>
                </div>
                <div id="infoBtnArea">
                <button id="infoBtn" data-bs-toggle="modal" data-bs-target="#infoSetModal">정보 관리하기</button>
                 </div>
            </div>
            <div class="priceArea">
                <label id="priceLabel">가격</label>
                <label id="pricePlusLabel">가격을 추가해 주세요.</label>
                <div id="priceBtnArea">
                <button id="priceBtn" data-bs-toggle="modal" data-bs-target="#priceSetModal" >가격 설정하기</button>
                </div>
            </div>
        </div>
        <div id="btnArea">
        <button id="finalBtn" onclick="location.href='${contextPath}/business/list'">완료</button>
        </div>
    <!-- 정보관리 Modal -->
	<div class="modal fade" id="infoSetModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<div class="titleWrap">
						<span class="circle"></span> <span class="welcome">정보관리</span>
						<span class="circle"></span>
					</div>
				</div>
					<div class="modal-body">
						<div class="infoSetformWrap">
							<form action="${ contextPath }/business/infoSet" method="post" id="infoSetForm">
								<h3>카테고리</h3><br>
								<select id="category">
				                    <option>일자리</option>
				                    <option>과외/클래스</option>
				                    <option>농수산물</option>
				                    <option>부동산</option>
				                    <option>중고차</option>
				                    <option>전시/행사</option>
				                    <option>지역업체</option>
                				</select><br><br>
                				<h3>상세 업종</h3><br>
								<input type="text" id="detailInput" placeholder="예) 카페, 한식전문점, 옷수선, 반찬가게등" ><br><br>
								<h3>주소</h3><br>
								<input type="text" id="addressInput" placeholder="주소를 입력해 주세요." ><br><br>
								<h3>전화번호</h3><br>
								<input type="text" id="phoneInput" placeholder="고객이 연락할 수 있는 번호를 적어주세요." ><br><br>
								<h3>소개 문구</h3><br>
								<textarea name="infoInput" id="infoInput" style="resize: none;" placeholder="상품/서비스를 소개하는 문구를 작성해 주세요."></textarea><br><br>
								<h3>영업 시간</h3><br>
								<input type="text" id="timeInput1" placeholder="시작" >
								<label id="line2">~</label>
               					<input type="text" id="timeInput2" placeholder="종료" ><br>
								<input type="text" id="timeInput3" placeholder="휴무요일을 적어주세요."><br>
								<button type="submit" class="sucessBtn" style="font-weight: bold;">완료</button>
							</form>
						</div>


					</div>
					<div class="modal-footer">
						<button type="button" id="closeBtn" data-bs-dismiss="modal">닫기</button>
					</div>
			</div>
		</div>
	</div>
	 <!-- 가격설정 Modal -->
	<div class="modal fade" id="priceSetModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<div class="titleWrap">
						<span class="circle"></span> <span class="welcome">가격관리</span>
						<span class="circle"></span>
					</div>
				</div>

				
					<div class="modal-body">
						<div class="priceSetformWrap">
							<form action="${ contextPath }/business/infoSet" method="post" id="priceSetForm">
								<h3>대표 메뉴</h3><br>
								<input type="text" id="topMenu" placeholder="대표 메뉴를 입력하세요. (예: 커피)" ><br><br>
								<h3>가격</h3><br>
								<input type="text" id="priceInput" placeholder="가격을 입력하세요." ><br><br>
								<h3>추가 설명</h3><br>
								<textarea name="menuInfo" id="menuInfo" style="resize: none;" placeholder="다른 메뉴와 설명이 필요하다면 적어주세요."></textarea><br>
								<button type="submit" class="sucessBtn"style="font-weight: bold;">완료</button>
							</form>
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
							case "profilePhoto" :
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
			

			
    </script>


</body>
</html>