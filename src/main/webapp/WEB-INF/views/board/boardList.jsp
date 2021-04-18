<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>당신 근처의 굿-바이 마켓 Good-Buy!</title>
  
   
    <link href="${contextPath }/resources/css/board/boardList.css" rel="stylesheet" type="text/css">
   
</head>
<body>
<jsp:include page="../common/menubar.jsp"/>
    
<br>
    <section id="gbSection">
        <br> <br>   <div id="maintitle">
            <a>내동네생활</a>
            <br>
    </div>
        <br><br><br>
        <select id="townselect">
            <option value="">카테고리 ▼</option>
            <option value="">일상</option>
            <option value="">동물</option>
            <option value="">맛집</option>
            <option value="">기타</option>
        </select>
        <div class="list">
            <div class="start" onclick="location.href='${contextPath }/board/detail'">
                <ul>
                    <li><div class="kind"><p class="subject">우리동네질문</p></div></li>
                    <li><p class="title">런닝같이 뛰실분</p></li>
                    <br>
                    <li class="name" style="color: black;">김아무개</li>
                    <li class="Date">2021.11.13</li>
                    <li class="hearts"><img src="${contextPath}/resources/images/mypage/heart.png" style="width:24px; height:21px;"></li>
                </ul>
                
                <img src="${contextPath}/resources/images/board/see.jpg" class="Photo">
                <p class="bcontent">신나고 재밌게 계속 뛰엉우엉웡신나고 재밌게 계속 뛰엉우엉웡
                    신나고 재밌게 계속 뛰엉우엉웡
                </p>
            </div>
            <br>
            <div class="start" onclick="location.href=${contextPath}'/board/detail'">
                <ul>
                    <li><div class="kind"><p class="subject">우리동네질문</p></div></li>
                    <li><p class="title">런닝같이 뛰실분</p></li>
                    <br>
                    <li class="name" style="color: black;">김아무개</li>
                    <li class="Date">2021.11.13</li>
                    <li class="hearts"><img src="${contextPath}/resources/images/board/heart.png" style="width:24px; height:21px;"></li>
                </ul>
                
                <img src="${contextPath}/resources/images/board/see.jpg" class="Photo">
                <p class="bcontent">신나고 재밌게 계속 뛰엉우엉웡신나고 재밌게 계속 뛰엉우엉웡
                    신나고 재밌게 계속 뛰엉우엉웡
                </p>
            </div>
            <br>
            <div class="start">
                <ul>
                    <li><div class="kind"><p class="subject">우리동네질문</p></div></li>
                    <li><p class="title">런닝같이 뛰실분</p></li>
                    <br>
                    <li class="name" style="color: black;">김아무개</li>
                    <li class="Date">2021.11.13</li>
                    <li class="hearts"><img src="${contextPath}/resources/images/board/heart.png" style="width:24px; height:21px;"></li>
                </ul>
                
                <img src="${contextPath}/resources/images/board/see.jpg" class="Photo">
                <p class="bcontent">신나고 재밌게 계속 뛰엉우엉웡신나고 재밌게 계속 뛰엉우엉웡
                    신나고 재밌게 계속 뛰엉우엉웡</p>
            </div>
            <br>
            <div class="start">
                <ul>
                    <li><div class="kind"><p class="subject">우리동네질문</p></div></li>
                    <li><p class="title">런닝같이 뛰실분</p></li>
                    <br>
                    <li class="name" style="color: black;">김아무개</li>
                    <li class="Date">2021.11.13</li>
                    <li class="hearts"><img src="${contextPath}/resources/images/board/heart.png" style="width:24px; height:21px;"></li>
                </ul>
                
                <img src="${contextPath}/resources/images/board/see.jpg" class="Photo">
                <p class="bcontent">신나고 재밌게 계속 뛰엉우엉웡신나고 재밌게 계속 뛰엉우엉웡
                    신나고 재밌게 계속 뛰엉우엉웡</p>
            </div>
            <br>
            <br><br><br>
            <div class="townserch">
                <input type="text" id="townbox" placeholder="동네생활을 검색하세요!" style=" color:#05AAD1;">
                <button type="submit" id="townbutton"  onclick="location.href='${contextPath}/board/serch'"  style="margin-left: 15px;">검색</button>
               
            
            </div>
          
            
        </div>
        <button id="writeBtn" onclick="location.href='${contextPath}/board/write'">동네 생활 글쓰기</button>
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
    </section>
    <jsp:include page="../common/footer.jsp"/>
    
    
    


</body>
</html>