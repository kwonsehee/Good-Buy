<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신 근처의 굿-바이 마켓 Good-Buy!</title>
<link href="${ contextPath }/resources/css/mypage/reportList.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	 <section id="gbSection">
        <img src="${ contextPath }/resources/images/mypage/left-arrow.png" id="backBtn" onclick="location.href='${ contextPath }/mypage/main'">
        <h1 class="title_h1">신고</h1>
        <ul class="subCategory_ul">
            <li><a id="report" href="${ contextPath }/mypage/reportList">내가 한 신고</a></li>
            <li><a id="reported" href="${ contextPath }/mypage/reportedList">내가 당한 신고</a></li>
        </ul>

        <div class="listWrap">
            <div class="eachListWrap">
                <ul class="firstUl">
                <li><div class="bCategory"><p class="cateName">동네생활</p></div></li> 
                <li class="town">둔촌동 피바다</li>
                <li class="dot">•</li>
                <li class="createDate">Yesterday</li>
                </ul>

                <img src="${ contextPath }/resources/images/mypage/more.png" class="moreIcon" onclick="showMenu()">
                <ul class="secondUl">
                    <li>이 글은 사기글 같아요</li>
                    <li>둔촌동 세탁소 추천 해주세요~</li>
                </ul>
                
              
            </div>

            <div class="eachListWrap">
                <ul class="firstUl">
                    <li><div class="bCategory"><p class="cateName">회원신고</p></div></li> 
                    <li class="town">폭행몬스터</li>
                    <li class="dot">•</li>
                    <li class="createDate">Yesterday</li>
                    </ul>
    
                    <img src="${ contextPath }/resources/images/mypage/more.png" class="moreIcon" onclick="showMenu()">
                    <ul class="secondUl">
                        <li>저와 쪽지를 주고 받던 도중 상스러운 욕을 했어요ㅡㅡ 아주 괘씸한 넘입니다ㅡㅡ</li>
                        
                    </ul>
                    
               
            </div>

            <div class="eachListWrap">
                <ul class="firstUl">
                    <li><div class="bCategory"><p class="cateName">회원신고</p></div></li> 
                    <li class="town">계란도른자</li>
                    <li class="dot">•</li>
                    <li class="createDate">Yesterday</li>
                    </ul>
    
                    <img src="${ contextPath }/resources/images/mypage/more.png" class="moreIcon" onclick="showMenu()">
                    <ul class="secondUl">
                        <li>이 사람 불법 도박 게임장 업체 홍보 하는데요?ㅋ</li>
                        <li>즉/시/환/급 & 초/보/자/환/영♣︎</li>
                    </ul>
                    
                
            </div>
        </div>

        <div class="pagingArea">
            <ul>
                <li><a href="#">&lt;&lt;</a></li>
                <li><a href="#">&lt;</a></li>
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">&gt;</a></li>
                <li><a href="#">&gt;&gt;</a></li>
            </ul>
        </div>
        <div class="subMenu">
            <a href="#">삭제</a>
        </div>
    </section>
	
	
	<jsp:include page="../common/footer.jsp"/>
	
	
	 <script>
       function showMenu(){
            $(".subMenu").css("display","block");
       }
    </script>

	
</body>
</html>