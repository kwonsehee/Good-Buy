<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신 근처의 굿-바이 마켓 Good-Buy!</title>
<link href="${ contextPath }/resources/css/mypage/myGoodsReplyList.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	  <section id="gbSection">
        <img src="${ contextPath }/resources/images/mypage/left-arrow.png" id ="backBtn" onclick="location.href='${contextPath}/mypage/main'">
        <h1 class="title_h1">내 글 / 댓글</h1>
        <ul class="subCategory_ul">
            <li><a id="sub_board" href="myBoardList.html">동네생활 글</a></li>
            <li><a id="sub_boardReply" href="myBoardReplyList.html">동네생활 댓글</a></li>
            <li><a id="sub_goods" href="myGoodsReplyList.html">중고거래 댓글</a></li>
        </ul>


        <div class="listWrap">
            <div class="eachListWrap">
                <img src="${ contextPath }/resources/images/mypage/ex2.jpeg" class="gPhoto">
                <ul class="goods_ul">
                    <li>강아지 노즈워크 IQ트레이닝 돌돌이 장난감</li>  
                    <li><img src="${ contextPath }/resources/images/mypage/more.png" class="moreIcon" onclick="showMenu()"></li>  
                </ul>
               
                <ul class="content_ul">
                    <li>토요일 오후 1시 시간 괜찮으세요?</li>                  
                    <li>에서 2hours ago 작성</li>
                </ul>                         
            </div>
            <div class="eachListWrap">
                <img src="${ contextPath }/resources/images/mypage/ex2.jpeg" class="gPhoto">
                <ul class="goods_ul">
                    <li>강아지 노즈워크 IQ트레이닝 돌돌이 장난감</li>  
                    <li><img src="${ contextPath }/resources/images/mypage/more.png" class="moreIcon" onclick="showMenu()"></li>  
                </ul>
               
                <ul class="content_ul">
                    <li>토요일 오후 1시 시간 괜찮으세요?</li>                  
                    <li>에서 2hours ago 작성</li>
                </ul>                         
            </div>
            <div class="eachListWrap">
                <img src="${ contextPath }/resources/images/mypage/ex1.jpeg" class="gPhoto">
                <ul class="goods_ul">
                    <li>단열 에어캡</li>  
                    <li><img src="${ contextPath }/resources/images/mypage/more.png" class="moreIcon" onclick="showMenu()"></li>  
                </ul>
               
                <ul class="content_ul">
                    <li>토요일 오후 1시 시간 괜찮으세요?</li>                  
                    <li>에서 2hours ago 작성</li>
                </ul>                         
            </div>
            <div class="eachListWrap">
                <img src="${ contextPath }/resources/images/mypage/ex3.jpeg" class="gPhoto">
                <ul class="goods_ul">
                    <li>강아지 계단 3단</li>  
                    <li><img src="${ contextPath }/resources/images/mypage/more.png" class="moreIcon" onclick="showMenu()"></li>  
                </ul>
               
                <ul class="content_ul">
                    <li>토요일 오후 1시 시간 괜찮으세요?</li>                  
                    <li>에서 2hours ago 작성</li>
                </ul>                         
            </div>

            <div class="subMenu">
                <a href="#">삭제</a>
            </div>
               
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