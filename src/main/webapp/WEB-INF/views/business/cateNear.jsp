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
   
    <link href="${ contextPath }/resources/css/businessCss/cateNear.css" rel="stylesheet" type="text/css">
</head>
<body>
    <jsp:include page="../common/menubar.jsp"/>
    <section id="gbSection">
         <!--카테고리 부분 시작-->
         <div id="cateArea">
            <ul id="category">
            	<c:if test="${ category eq '일자리' }">
                <li><a class="cate" style="color:#37BBDA" onclick="location.href='${contextPath}/business/job/list'">일자리</a></li>
                <li><a class="cate" onclick="location.href='${contextPath}/business/study/list'">과외/클래스</a></li>
                <li><a class="cate" onclick="location.href='${contextPath}/business/fruit/list'">농수산물</a></li>
                <li><a class="cate" onclick="location.href='${contextPath}/business/house/list'">부동산</a></li>
                <li><a class="cate" onclick="location.href='${contextPath}/business/car/list'">중고차</a></li>
                <li><a class="cate" onclick="location.href='${contextPath}/business/event/list'">전시/행사</a></li>
                <li><a class="cate" onclick="location.href='${contextPath}/business/company/list'">지역업체 소개</a></li>
                </c:if>
                <c:if test="${ category eq '과외' }">
                <li><a class="cate"  onclick="location.href='${contextPath}/business/job/list'">일자리</a></li>
                <li><a class="cate" style="color:#37BBDA" onclick="location.href='${contextPath}/business/study/list'">과외/클래스</a></li>
                <li><a class="cate" onclick="location.href='${contextPath}/business/fruit/list'">농수산물</a></li>
                <li><a class="cate" onclick="location.href='${contextPath}/business/house/list'">부동산</a></li>
                <li><a class="cate" onclick="location.href='${contextPath}/business/car/list'">중고차</a></li>
                <li><a class="cate" onclick="location.href='${contextPath}/business/event/list'">전시/행사</a></li>
                <li><a class="cate" onclick="location.href='${contextPath}/business/company/list'">지역업체 소개</a></li>
                </c:if>
                <c:if test="${ category eq '농수산물' }">
                <li><a class="cate" onclick="location.href='${contextPath}/business/job/list'">일자리</a></li>
                <li><a class="cate" onclick="location.href='${contextPath}/business/study/list'">과외/클래스</a></li>
                <li><a class="cate" style="color:#37BBDA" onclick="location.href='${contextPath}/business/fruit/list'">농수산물</a></li>
                <li><a class="cate" onclick="location.href='${contextPath}/business/house/list'">부동산</a></li>
                <li><a class="cate" onclick="location.href='${contextPath}/business/car/list'">중고차</a></li>
                <li><a class="cate" onclick="location.href='${contextPath}/business/event/list'">전시/행사</a></li>
                <li><a class="cate" onclick="location.href='${contextPath}/business/company/list'">지역업체 소개</a></li>
                </c:if>
                <c:if test="${ category eq '부동산' }">
                <li><a class="cate" onclick="location.href='${contextPath}/business/job/list'">일자리</a></li>
                <li><a class="cate" onclick="location.href='${contextPath}/business/study/list'">과외/클래스</a></li>
                <li><a class="cate" onclick="location.href='${contextPath}/business/fruit/list'">농수산물</a></li>
                <li><a class="cate" style="color:#37BBDA" onclick="location.href='${contextPath}/business/house/list'">부동산</a></li>
                <li><a class="cate" onclick="location.href='${contextPath}/business/car/list'">중고차</a></li>
                <li><a class="cate" onclick="location.href='${contextPath}/business/event/list'">전시/행사</a></li>
                <li><a class="cate" onclick="location.href='${contextPath}/business/company/list'">지역업체 소개</a></li>
                </c:if>
                <c:if test="${ category eq '중고차' }">
                <li><a class="cate" onclick="location.href='${contextPath}/business/job/list'">일자리</a></li>
                <li><a class="cate" onclick="location.href='${contextPath}/business/study/list'">과외/클래스</a></li>
                <li><a class="cate" onclick="location.href='${contextPath}/business/fruit/list'">농수산물</a></li>
                <li><a class="cate" onclick="location.href='${contextPath}/business/house/list'">부동산</a></li>
                <li><a class="cate" style="color:#37BBDA" onclick="location.href='${contextPath}/business/car/list'">중고차</a></li>
                <li><a class="cate" onclick="location.href='${contextPath}/business/event/list'">전시/행사</a></li>
                <li><a class="cate" onclick="location.href='${contextPath}/business/company/list'">지역업체 소개</a></li>
                </c:if>
                <c:if test="${ category eq '전시' }">
                <li><a class="cate" onclick="location.href='${contextPath}/business/job/list'">일자리</a></li>
                <li><a class="cate" onclick="location.href='${contextPath}/business/study/list'">과외/클래스</a></li>
                <li><a class="cate" onclick="location.href='${contextPath}/business/fruit/list'">농수산물</a></li>
                <li><a class="cate" onclick="location.href='${contextPath}/business/house/list'">부동산</a></li>
                <li><a class="cate" onclick="location.href='${contextPath}/business/car/list'">중고차</a></li>
                <li><a class="cate" style="color:#37BBDA" onclick="location.href='${contextPath}/business/event/list'">전시/행사</a></li>
                <li><a class="cate" onclick="location.href='${contextPath}/business/company/list'">지역업체 소개</a></li>
                </c:if>
                <c:if test="${ category eq '지역업체' }">
                <li><a class="cate" onclick="location.href='${contextPath}/business/job/list'">일자리</a></li>
                <li><a class="cate" onclick="location.href='${contextPath}/business/study/list'">과외/클래스</a></li>
                <li><a class="cate" onclick="location.href='${contextPath}/business/fruit/list'">농수산물</a></li>
                <li><a class="cate" onclick="location.href='${contextPath}/business/house/list'">부동산</a></li>
                <li><a class="cate" onclick="location.href='${contextPath}/business/car/list'">중고차</a></li>
                <li><a class="cate" onclick="location.href='${contextPath}/business/event/list'">전시/행사</a></li>
                <li><a class="cate" style="color:#37BBDA" onclick="location.href='${contextPath}/business/company/list'">지역업체 소개</a></li>
                </c:if>
                
            </ul>
        </div>
        <!--카테고리 부분 끝-->


        <c:if test="${nList.size() != 0  }">
        <!--내 근처  시작-->
        <div class="nearArea">
        	<c:forEach var="n" items="${ nList }">
            <div class="nearList">
                <c:if test="${ n.filePath != null }">
                <img class="thumbnail" src="${contextPath}/resources/${n.filePath}${n.changeName}" >
                </c:if>
                <c:if test="${ n.filePath == null }">
                <img  class="thumbnail" src="${contextPath}/resources/images/business/기본썸네일.png" >
                </c:if>
                <p class="title"> ${ n.newsTitle }</p>
                <p class="content"> ${ n.shopNews }</p>
                <div class="lastInfo">
                <img src="${contextPath}/resources/images/business/미니프로필샘플.png">
                <label class="name">${loginUser.nickname }</label>
                <label class="address">${ n.address_3 }</label>
                </div>
            </div>
            </c:forEach>
        </div>

		

        <div class="btnArea">
        <a>더보기</a>
        </div>
        
        </c:if>
        
        <c:if test="${nList.size() == 0 }">
        	<div class="logoArea">
                <img src="${contextPath}/resources/images/logo2.png">
                <p>소식이 없습니다.</p>
            </div>
        </c:if>
        
         <script>
        $(document).ready(function(){
			size_div = $('.nearList').length;
			
			x = 8;
			$('.nearList:lt('+x+')').addClass('nearListflex');
			$('.btnArea').click(function(){
				x= (x+8 <= size_div)? x+8 : size_div;
				$('.nearList:lt('+x+')').addClass('nearListflex');
			
			
			});

		});
        
        </script>
        <!--내 근처 끝-->
       
    </section>

     <jsp:include page="../common/footer.jsp"/>

   


</body>
</html>