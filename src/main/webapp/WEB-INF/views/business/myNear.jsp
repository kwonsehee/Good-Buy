<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>당신 근처의 굿-바이 마켓 Good-Buy!</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <!-- 공통 UI -->
   
    <link href="${ contextPath }/resources/css/businessCss/myNear.css?v=1" rel="stylesheet" type="text/css">
 
</head>

<body>
	<c:if test="${ !empty sessionScope.loginUser }">
     <jsp:include page="../common/menubar.jsp"/>

    <section id="gbSection">
        <!--카테고리 부분 시작-->
        <div id="cateArea">
            <ul id="category">
                <li><img class="cateimg" src="${contextPath}/resources/images/business/일자리1.png" onclick="location.href='${contextPath}/business/job/list'"></li>
                <li><img class="cateimg" src="${contextPath}/resources/images/business//과외1.png" onclick="location.href='${contextPath}/business/study/list'"></li>
                <li><img class="cateimg" src="${contextPath}/resources/images/business/농수산물1.png" onclick="location.href='${contextPath}/business/fruit/list'"></li>
                <li><img class="cateimg" src="${contextPath}/resources/images/business/부동산1.png" onclick="location.href='${contextPath}/business/house/list'"></li>
                <li><img class="cateimg" src="${contextPath}/resources/images/business/중고차1.png" onclick="location.href='${contextPath}/business/car/list'"></li>
                <li><img class="cateimg" src="${contextPath}/resources/images/business/전시1.png" onclick="location.href='${contextPath}/business/event/list'"></li>
                <li><img class="cateimg" src="${contextPath}/resources/images/business/지역업체1.png" onclick="location.href='${contextPath}/business/company/list'"></li>
            </ul>
        </div>
        <!--카테고리 부분 끝-->

        <!--내 근처  시작-->
        <h3 id="nearNews">내 근처 소식</h3>
		<c:if test="${!empty  nList }">
        <div class="nearArea">
        <c:forEach var="n" items="${nList}" >
            <div class="nearList" onclick="detailList(${n.shopNo})">
            	<c:if test="${ n.filePath != null }">
                <img class="thumbnail" src="${contextPath}/resources/images/goodupload/${n.changeName}" >
                </c:if>
                <c:if test="${ n.filePath == null }">
                <img  class="thumbnail" src="${contextPath}/resources/images/business/기본썸네일.png" >
                </c:if>
 
                <p class="title"> ${n.newsTitle} </p>
                <p class="content"> ${ fn:substring(n.shopNews,0,50) } 
                <c:if test="${fn:length(n.shopNews )>50}">
				...
                </c:if>
                </p>
                <div class="lastInfo">
                <img src="${contextPath}/resources/images/business/미니프로필샘플.png">
                <label class="name"> ${loginUser.nickname }</label>
                <label class="address">	${ n.address_3 }</label>
                </div>
            </div>
            </c:forEach>
        </div>
        
        

        <div class="btnArea">
        <button id="nearBtn" onclick="location.href='${contextPath}/business/company/list'">내 근처 소식 전체보기</button>
        </div>
        </c:if>
        
        <c:if test="${empty nList }">
        <div class="logoArea">
       		<img src="${contextPath}/resources/images/logo2.png">
            <p>소식이 없습니다.</p>
        </div>
        </c:if>
        <!--내 근처 끝-->

        <!--이웃들의 추천 가게 시작-->
        
        <h3 id="likeShopArea">이웃들의 추천 가게</h3>
        <c:if test="${!empty bList }">
        <div id="star">
        <c:if test="${ color == 0 }">
        <a class="gradeRanking" onclick="location.href='${contextPath}/business/gradeRanking'" >별점순</a>
        <a class="reviewRanking" onclick="location.href='${contextPath}/business/reviewRanking'" >후기순</a>
        </c:if>
        <c:if test="${ color == 1 }">
        <a class="gradeRanking" onclick="location.href='${contextPath}/business/gradeRanking'"  style="color:#37BBDA">별점순</a>
        <a class="reviewRanking" onclick="location.href='${contextPath}/business/reviewRanking'"  >후기순</a>
        </c:if>
        <c:if test="${ color == 2 }">
        <a class="gradeRanking" onclick="location.href='${contextPath}/business/gradeRanking'" >별점순</a>
        <a class="reviewRanking" onclick="location.href='${contextPath}/business/reviewRanking'" style="color:#37BBDA">후기순</a>
        </c:if>
        </div>
       
        <div class="likeArea">
            <c:forEach var="b" items="${ bList }">
            <div class="likeList" onclick="detailList(${b.shopNo})">
            	<c:if test="${ b.filePath !=null }">
                <img class="thumbnail2" src="${contextPath}/resources/images/goodupload/${b.changeName}">
                </c:if>
                <c:if test="${ b.filePath ==null }">
                <img class="thumbnail2" src="${contextPath}/resources/images/business/기본썸네일.png">
                </c:if>
                <div class="firstLike">
                    <label class="shopName"> ${b.shopName }</label>
                    <label class="shopAddress">${b.shopAdd }</label>
                </div>
                <div class="secondLike">
                    <p> ${ fn:substring(b.shopIntro,0,70) } 
                    <c:if test="${fn:length(b.shopIntro )>70}">
					...
	                </c:if>
                    </p>
                </div>
                <div class="thirdLike">
                    <label class="reviewCount"> 후기${b.reviewCount }</label>
                    <label class="likeCount">단골${b.faCount }</label>
                    <c:if test="${b.avgGrade == 5 }">
                    <img src="${contextPath}/resources/images/business/별점5.png" height="12px" >
                    </c:if>
                    <c:if test="${b.avgGrade == 4 }">
                    <img src="${contextPath}/resources/images/business/별점4.png" height="12px" >
                    </c:if>
                    <c:if test="${b.avgGrade == 3 }">
                    <img src="${contextPath}/resources/images/business/별점3.png" height="12px" >
                    </c:if>
                    <c:if test="${b.avgGrade == 2 }">
                    <img src="${contextPath}/resources/images/business/별점2.png" height="12px" >
                    </c:if>
                    <c:if test="${b.avgGrade == 1 }">
                    <img src="${contextPath}/resources/images/business/별점1.png" height="12px" >
                    </c:if>
                    <c:if test="${b.avgGrade == 0 }">
                    <img src="${contextPath}/resources/images/business/별점0.png" height="12px" >
                    </c:if>
                </div>
                <div class="fourthLike">
                <c:set var="check" value="0"/>
                <c:forEach var="r" items="${ rList }">
                <c:if test="${ r.shopNo == b.shopNo }">
                    <p class="review"><b> ${r.nickName }</b>${ r.content } </p>
                    <c:set var="check" value="1"/>
                </c:if>
                </c:forEach>
                 <c:if test="${ check==0 }">
                    <p class="review">후기가 없습니다.</p>
                </c:if>
                </div>
                
            </div>
            </c:forEach>
          </div>
            <div class="plusArea">
	        	<a>더보기</a>
	        </div>
	       
	        
	       
	        
        <script>
        $(document).ready(function(){
			size_div = $('.likeList').length;
			
			x = 3;
			$('.likeList:lt('+x+')').addClass('likeListflex');
			$('.plusArea').click(function(){
				x= (x+3 <= size_div)? x+3 : size_div;
				$('.likeList:lt('+x+')').addClass('likeListflex');
			
			
			});

		});
        
        </script>
     
		 </c:if>
		 
		 <c:if test="${empty bList }">
		        <div class="logoArea">
	       		<img src="${contextPath}/resources/images/logo2.png">
	            <p>추천 가게가 없습니다.</p>
        		</div>
	     </c:if>
        <div class="btnArea">
        	<c:if test="${ loginUser.is_business eq 'Y' }">
            <button id="businessBtn"><img src="${contextPath}/resources/images/business/shop 1.png"><label onclick="location.href='${contextPath}/business/change'">비즈 프로필 관리</label></button>
            </c:if>
            <c:if test="${ loginUser.is_business eq 'N'}">
            <button id="businessBtn"><img src="${contextPath}/resources/images/business/shop 1.png"><label onclick="location.href='${contextPath}/business/create'">비즈 프로필 생성</label></button>
            </c:if>
           
        </div>
        <!--이웃들의 추천 가게 끝-->
       
    </section>
    <script>
    	function detailList(shopNo){
    		location.href='${contextPath}/business/detail?shopNo=' + shopNo;
    	}
    </script>

    <jsp:include page="../common/footer.jsp"/>
   

	</c:if>
	<c:if test="${ empty sessionScope.loginUser }">
		<h3>로그인 후 이용해주세요</h3>
	</c:if>
</body>
</html>