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
   
    <link href="${ contextPath }/resources/css/businessCss/cateNear.css" rel="stylesheet" type="text/css">
</head>
<body>
    <jsp:include page="../common/menubar.jsp"/>
    <section id="gbSection">
         <!--카테고리 부분 시작-->
         <div id="cateArea">
            <ul id="category">
                <li><a>일자리</a></li>
                <li><a>과외/클래스</a></li>
                <li><a>농수산물</a></li>
                <li><a>부동산</a></li>
                <li><a>중고차</a></li>
                <li><a>전시/행사</a></li>
                <li><a>지역업체 소개</a></li>
            </ul>
        </div>
        <!--카테고리 부분 끝-->

        <!--내 근처  시작-->
        
        <!--내 근처  시작-->
        <div class="nearArea">
            <div class="nearList">
                <img src="${contextPath}/resources/images/business/내근처샘플.png">
                <p class="title">바이올린1대1맞춤강습해요</p>
                <pre class="content">정적이고 아름다운 바이올린 눈높이에
 맞춰 친절히 가르쳐 드릴게요~~</pre>
                <div class="lastInfo">
                <img src="${contextPath}/resources/images/business/미니프로필샘플.png">
                <label class="name">바이바이</label>
                <label class="address">구월동</label>
                </div>
            </div>
            <div class="nearList">
                <img src="${contextPath}/resources/images/business/내근처샘플.png">
                <p class="title">바이올린1대1맞춤강습해요</p>
                <pre class="content">정적이고 아름다운 바이올린 눈높이에
 맞춰 친절히 가르쳐 드릴게요~~</pre>
                <div class="lastInfo">
                <img src="${contextPath}/resources/images/business/미니프로필샘플.png">
                <label class="name">바이바이</label>
                <label class="address">구월동</label>
                </div>
            </div>
            <div class="nearList">
                <img src="${contextPath}/resources/images/business/내근처샘플.png">
                <p class="title">바이올린1대1맞춤강습해요</p>
                <pre class="content">정적이고 아름다운 바이올린 눈높이에
 맞춰 친절히 가르쳐 드릴게요~~</pre>
                <div class="lastInfo">
                <img src="${contextPath}/resources/images/business/미니프로필샘플.png">
                <label class="name">바이바이</label>
                <label class="address">구월동</label>
                </div>
            </div>
            <div class="nearList">
                <img src="${contextPath}/resources/images/business/내근처샘플.png">
                <p class="title">바이올린1대1맞춤강습해요</p>
                <pre class="content">정적이고 아름다운 바이올린 눈높이에
 맞춰 친절히 가르쳐 드릴게요~~</pre>
                <div class="lastInfo">
                <img src="${contextPath}/resources/images/business/미니프로필샘플.png">
                <label class="name">바이바이</label>
                <label class="address">구월동</label>
                </div>
            </div>
            <div class="nearList">
                <img src="${contextPath}/resources/images/business/내근처샘플.png">
                <p class="title">바이올린1대1맞춤강습해요</p>
                <pre class="content">정적이고 아름다운 바이올린 눈높이에
 맞춰 친절히 가르쳐 드릴게요~~</pre>
                <div class="lastInfo">
                <img src="${contextPath}/resources/images/business/미니프로필샘플.png">
                <label class="name">바이바이</label>
                <label class="address">구월동</label>
                </div>
            </div>
            <div class="nearList">
                <img src="${contextPath}/resources/images/business/내근처샘플.png">
                <p class="title">바이올린1대1맞춤강습해요</p>
                <pre class="content">정적이고 아름다운 바이올린 눈높이에
 맞춰 친절히 가르쳐 드릴게요~~</pre>
                <div class="lastInfo">
                <img src="${contextPath}/resources/images/business/미니프로필샘플.png">
                <label class="name">바이바이</label>
                <label class="address">구월동</label>
                </div>
            </div>
            <div class="nearList">
                <img src="${contextPath}/resources/images/business/내근처샘플.png">
                <p class="title">바이올린1대1맞춤강습해요</p>
                <pre class="content">정적이고 아름다운 바이올린 눈높이에
 맞춰 친절히 가르쳐 드릴게요~~</pre>
                <div class="lastInfo">
                <img src="${contextPath}/resources/images/business/미니프로필샘플.png">
                <label class="name">바이바이</label>
                <label class="address">구월동</label>
                </div>
            </div>
            <div class="nearList">
                <img src="${contextPath}/resources/images/business/내근처샘플.png">
                <p class="title">바이올린1대1맞춤강습해요</p>
                <pre class="content">정적이고 아름다운 바이올린 눈높이에
 맞춰 친절히 가르쳐 드릴게요~~</pre>
                <div class="lastInfo">
                <img src="${contextPath}/resources/images/business/미니프로필샘플.png">
                <label class="name">바이바이</label>
                <label class="address">구월동</label>
                </div>
            </div>
        </div>

        <div class="btnArea">
        <a>더보기</a>
        </div>
        <!--내 근처 끝-->
       
    </section>

     <jsp:include page="../common/footer.jsp"/>

   


</body>
</html>