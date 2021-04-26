<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>당신 근처의 굿-바이 마켓 Good-Buy!</title>

   
    <link href="${contextPath }/resources/css/board/boardMain.css" rel="stylesheet" type="text/css">

</head>

<body>
<jsp:include page="../common/menubar.jsp"/>
    <!--============================================================================================================================-->
   <br><br> 
    <section id="gbSection">
        <!-- 카테고리 -->
        <br><br>
        <div id="maintitle">
            <a>내동네생활</a>
            <br>
    </div>
        <ul class="categorys">
            <li><a href="${contextPath }/board/list"><img  class="categorya" src="${contextPath }/resources/images/board/life.png"></a><br>일상</li>
            <li><a href="${contextPath }/board/list"><img  class="categorya" src="${contextPath }/resources/images/board/dog.png"></a><br>동물</li>
            <li><a href="${contextPath }/board/list"><img class="categorya"  src="${contextPath }/resources/images/board/food.png"></a><br>맛집</li>
            <li><a href="${contextPath }/board/list"><img  class="categorya" src="${contextPath }/resources/images/board/town.png"></a><br>기타</li>
        </ul>

        <br>
        <!-- 검색바 -->

        
        
        
        
        
        <!-- 추천 게시글-->
        
        
        <br>        <br>        <br>
        <div id="title1">
            <a>내동네생활 추천글</a>
            <a href="${contextPath }/board/list" id="Viewmore" style="font-size: 14px;
        text-decoration: underline; color: black;">더보기</a>
    </div>
    <div id="townstory1">
        
        <div class="townboard">
            <img src="${contextPath }/resources/images/board/see.jpg" id="storyimage"> <br>
            <div class="title">
                런닝같이 뛰실분<br>
            </div>
            <div class="date">
                <div class="name">김아무개</div>
                <div class="heart"><img src="${contextPath }/resources/images/mypage/heart.png"></div>
                
            </div>
            <label class="boarddate">2021.11.13</label>
            
            
            <p class="story">신나고 재밌게 계속 뛰엉 쭈욱</p>
        </div>
        <div class="townboard">
            <img src="${contextPath }/resources/images/board/see.jpg" id="storyimage"> <br>
            <div class="title">
                런닝같이 뛰실분<br>
            </div>
            <div class="name">김아무개</div>
            <div class="heart"><img src="${contextPath }/resources/images/mypage/heart.png"></div>
            
            <label class="boarddate">2021.11.13</label>
            
            
            <p class="story">신나고 재밌게 계속 뛰엉 쭈욱
            </p>
        </div>
        <div class="townboard">
            <img src="${contextPath }/resources/images/board/see.jpg" id="storyimage"> <br>
            <div class="title">
                런닝같이 뛰실분<br>
            </div>
            <div class="date">
                <div class="name">김아무개</div>
                <div class="heart"><img src="${contextPath }/resources/images/mypage/heart.png"></div>
            </div>
            <label class="boarddate">2021.11.13</label>
            
            
            <p class="story">신나고 재밌게 계속 뛰엉 쭈욱
            
            </p>
        </div>
        <div class="townboard">
            <img src="${contextPath }/resources/images/board/see.jpg" id="storyimage"> <br>
            <div class="title">
                런닝같이 뛰실분<br>
            </div>
            <div class="date">
                <div class="name">김아무개</div>
                <div class="heart"><img src="${contextPath }/resources/images/mypage/heart.png"></div>
            </div>
            <label class="boarddate">2021.11.13</label>
            
            
            <p class="story">신나고 재밌게 계속 뛰엉 쭈욱</p>
        </div>
        
    </div>
    <br><br><br>
    
    
    <!--내동네생활 최신글 -->
    <div id="title1">
        <a>내동네생활 최신글</a>
      <a href="${contextPath }/board/list" id="Viewmore" style="font-size: 14px;
        text-decoration: underline; color: black;">더보기</a>
    </div>
    <div id="townstory1">
        <div class="townboard">
            <img src="${contextPath }/resources/images/board/see.jpg" id="storyimage"> <br>
            <div class="title">
                런닝같이 뛰실분<br>
            </div>
            <div class="date">
                <div class="name">김아무개</div>
                <div class="heart"><img src="${contextPath }/resources/images/mypage/heart.png" style="width: 18px;
                    height: 16px;"></div>
                    </div>
                    <label class="boarddate">2021.11.13</label>
                    
                    
                    <p class="story">신나고 재밌게 계속 뛰엉 쭈욱</p>
                </div>
                <div class="townboard">
                    <img src="${contextPath }/resources/images/board/see.jpg" id="storyimage"> <br>
                    <div class="title">
                        런닝같이 뛰실분<br>
                    </div>
                    <div class="date">
                        <div class="name">김아무개</div>
                        <div class="heart"><img src="${contextPath }/resources/images/mypage/heart.png" style="width: 18px;
                    height: 16px;"></div>
                    </div>
                    <label class="boarddate">2021.11.13</label>
                    
                    
                    <p class="story">신나고 재밌게 계속 뛰엉 쭈욱</p>
                </div>
                <div class="townboard">
                    <img src="${contextPath }/resources/images/board/see.jpg" id="storyimage"> <br>
                    <div class="title">
                        런닝같이 뛰실분<br>
                    </div>
                    <div class="date">
                        <div class="name">김아무개</div>
                        <div class="heart"><img src="${contextPath }/resources/images/mypage/heart.png" style="width: 18px;
                    height: 16px;"></div>
                    </div>
                    <label class="boarddate">2021.11.13</label>
              
                    
                    <p class="story">신나고 재밌게 계속 뛰엉 쭈욱</p>
                </div>
                <div class="townboard">
                    <img src="${contextPath }/resources/images/board/see.jpg" id="storyimage"> <br>
                    <div class="title">
                        런닝같이 뛰실분<br>
                    </div>
                    <div class="date">
                        <div class="name">김아무개</div>
                <div class="heart"><img src="${contextPath }/resources/images/mypage/heart.png" style="width: 18px;
                    height: 16px;"></div>
                    </div>
                    <label class="boarddate">2021.11.13</label>
                    
                    
                    <p class="story">신나고 재밌게 계속 뛰엉 쭈욱</p>
                </div>
            </div>
            <div class="townserch">
                <input type="text" id="townbox" placeholder="동네생활을 검색하세요!" style=" color:#05AAD1;">
                <button type="submit" id="townbutton"  onclick="${contextPath}/board/serch'"  style="margin-left: 15px;">검색</button>
            
            </div>
            <button id="writeBtn" onclick="location.href='${contextPath }/board/write'">동네 생활 글쓰기</button>
        </div>
    </section>

    <jsp:include page="../common/footer.jsp"/>


</body>
</html>