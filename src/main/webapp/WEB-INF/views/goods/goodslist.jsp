<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Good-Buy</title>
<!-- css -->
<link href="${ contextPath }/resources/css/goods/list.css?v=0" rel="stylesheet" type="text/css">

</head>
<body>
 <section id="gbSection">
       <jsp:include page="../common/menubar.jsp"/>
 
       <table id="goodlist" >
           <tr>
            <td>
                <img src="${ contextPath }/resources/images/filter.png" onclick="showCate();" id="gfilter"> 전체
                <div class="catebar">
                  
                    <button onclick="closeCate()">X</button>
                       
                    <ul>
                        <li><a href="#">의류</a></li>
                        <li><a href="#">유아/출산</a></li>
                        <li><a href="#">디지털/가전</a></li>
                        <li><a href="#">도서/티켓/취미/애완</a></li>
                        <li><a href="#">스타굿즈</a></li>
                        <li><a href="#">생활/문구/가구/식품</a></li>
                        <li><a href="#">스포츠/레저</a></li>
                        <li><a href="#">뷰티/미용</a></li>
                    </ul>
                </div>
            </td>
            <td colspan="4" id="selectTown" style="text-align: right;">
                <span style="font-weight: bold; font-size: 15px;">내 동네</span>
                <span style=" padding-left: 20px;">수원 팔달구 우만동</span>
                <img src="${ contextPath }/resources/images/recycle.png" id="changeTown">     
            </td>
           </tr>
           <tr>
               <td onclick="selectGoods();"><img src="${ contextPath }/resources/images/goods.jpeg" class="goodlistimg">
                    <p>뉴발란스 신발~</p>
                    <span>20,000원</span>
                    <span>13시간전</span></td>
               <td><img src="${ contextPath }/resources/images/goods.jpeg" class="goodlistimg">
                <p>뉴발란스 신발~</p>
                <span>20,000원</span>
                <span>13시간전</span></td>
               <td><img src="${ contextPath }/resources/images/goods.jpeg" class="goodlistimg">
                <p>뉴발란스 신발~</p>
                <span>20,000원</span>
                <span>13시간전</span></td>
               <td><img src="${ contextPath }/resources/images/goods.jpeg"class="goodlistimg">
                <p>뉴발란스 신발~</p>
                <span>20,000원</span>
                <span>13시간전</span></td>
               <td><img src="${ contextPath }/resources/images/goods.jpeg"class="goodlistimg">
                <p>뉴발란스 신발~</p>
                <span>20,000원</span>
                <span>13시간전</span></td>
           </tr>
           <tr>
            <td><img src="${ contextPath }/resources/images/goods.jpeg"class="goodlistimg">
                <p>뉴발란스 신발~</p>
                <span>20,000원</span>
                <span>13시간전</span></td>
            <td><img src="${ contextPath }/resources/images/goods.jpeg"class="goodlistimg">
                <p>뉴발란스 신발~</p>
                <span>20,000원</span>
                <span>13시간전</span></td>
            <td><img src="${ contextPath }/resources/images/goods.jpeg"class="goodlistimg">
                <p>뉴발란스 신발~</p>
                <span>20,000원</span>
                <span>13시간전</span></td>
            <td><img src="${ contextPath }/resources/images/goods.jpeg"class="goodlistimg">
                <p>뉴발란스 신발~</p>
                <span>20,000원</span>
                <span>13시간전</span></td>
            <td><img src="${ contextPath }/resources/images/goods.jpeg"class="goodlistimg">

                <p>뉴발란스 신발~</p>
                <span>20,000원</span>
                <span>13시간전</span></td>
        </tr>
       </table>
       <div style="margin-top: 3%; padding-left: 8%; float: left; text-decoration: underline;">
       		<a href="${ contextPath }/goods/mylist">내 상품 모아보기</a>
       </div>
       <div id="pageArea">
            <a> &lt;&lt;&nbsp; </a>
            <a> &lt;&nbsp; </a>
            <a>1</a>
            <a>2</a>
            <a>3</a>
            <a>4</a>
            <a>5</a>
            <a> &nbsp;&gt; </a>
            <a> &nbsp;&gt;&gt; </a>

       </div>
       <button id="writeBtn" onclick="location.href='${ contextPath }/goods/insert'" >중고거래 글쓰기</button>
    </section>
    <script type="text/javascript">
    function showCate(){
        $(".catebar").css("left","0px");   
   }
    function closeCate(){
        $(".catebar").css("left","-300px");   
    }
    function selectGoods(){
		location.href="${contextPath}/goods/detail";
	}
	
    </script>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>