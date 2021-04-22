<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신 근처의 굿-바이 마켓 Good-Buy!</title>
<link href="${ contextPath }/resources/css/mypage/setKeyword.css?v" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	 <section id="gbSection">
        <img src="${ contextPath }/resources/images/mypage/left-arrow.png" id ="backBtn" onclick="location.href='${ contextPath }/mypage/main'">
        <h1 class="title_h1">키워드 알림 설정</h1>

        <div class="inputWrap">
            <input type="text" id="keywordInput" placeholder="키워드를 입력해주세요. (예:자전거)" style=" color:#05AAD1;">
            <button id="keyBtn" onclick="add();">등록</button>
        </div>
       <a onclick="showPopup()" class="popupText">혹시 키워드 알림이 오지 않나요?</a>
       
       <div class="countingWrap">
           <span>알림 받을 키워드</span>
           <span id="keyCount">${list.size()}</span>
           <span>/</span>
           <span>20</span>
       </div>

		<div class="keywordWrap">
		<c:if test="${ list.size() != 0 }">
		<c:forEach items="${ list }" var="klist">
			<div class='eachKeywordWrap'>
			${klist.keyword }&nbsp; &nbsp;
				<button class='cancelBtn' onclick='cancelKeyword()'>X</button>
			</div>
		</c:forEach>
		</c:if>
		</div>

	</section>
	
	
	<jsp:include page="../common/footer.jsp"/>
	
	 <script>
       // 키워드 안내 알림창 팝업 
       function showPopup(){
            var url = "${contextPath}/mypage/keywordPopup";
            var _width = '400';
            var _height = '680';

            // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
            var _left = Math.ceil(( window.screen.width - _width )/2);
            var _top = Math.ceil(( window.screen.height - _height )/2);

            window.open(url,"PopupWin",'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
       }

       // 키워드 추가 
       function add(listSize){
           var keyword = $("#keywordInput").val();
            $(".keywordWrap").append("<div class='eachKeywordWrap'>"+keyword+"&nbsp; &nbsp; <button class='cancelBtn' onclick='cancelKeyword()'>X</button></div>");
            $("#keywordInput").val(""); // input 리셋 시키기

			// 키워드 카운팅
            $("#keyCount").html(listSize); 

            // 키워드 갯수 20개 제한
            if(listSize > 20){
                alert("키워드는 최대 20개까지 등록 가능합니다 :)");
                $("#keyCount").html("20");
                $(".eachKeywordWrap:nth-last-child(1)").remove();
            }
            
            console.log(keyword);
            
            location.href="${contextPath}/mypage/insertKey?key="+keyword;
       }

       // 키워드 X 클릭 -> 취소
       function cancelKeyword(){
           const div = $("#cancelBtn").parent();
           div.remove();
           keyCount = $(".eachKeywordWrap").length;
           $("#keyCount").html(keyCount);
       }
       
    </script>
</body>
</html>