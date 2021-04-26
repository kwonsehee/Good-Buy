<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Good-Buy</title>
<!-- css -->
<link href="${ contextPath }/resources/css/goods/sellerfollowing.css" rel="stylesheet" type="text/css">
  <!--sweetalert2-->
  <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
  <!--https://sweetalert2.github.io/ 에 다양하게 사용할 수 있는 방법이 나와있다.-->
<!-- 예를들어 이미지 등을 바꿀 수 있다. 확인 취소버튼을 추가한다거나 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<!-- Optional: include a polyfill for ES6 Promises for IE11 -->
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
</head>
<body>
 <section id="gbSection">
       <jsp:include page="../common/menubar.jsp"/>
        <h3 style="display: inline-block; margin-left: 45%; ">판매자 페이지</h3>
        <a class="btn_gray" href = "javascript:sellerReportPopup()">신고하기</a>
        <table id="seller_tb">
            <tr>
                <td>
				<c:if test="${ seller.photo ne null }">
                <img src="${ contextPath }/resources/images/userProfilePhoto/${ seller.photo }" style="width: 150px; border: 1px solid black; border-radius: 100%;">
                </c:if>
                 <c:if test="${ seller.photo eq null }">
                
                <img src="${ contextPath }/resources/images/person.png" style="width: 150px; border: 1px solid black; border-radius: 100%;">
                </c:if>
				</td>
                <td colspan="2" style="padding-left:5%;">안녕하세요~ 서로 좋은 물건 공유합시다
                    아나바다 운동을 일으켜봅시당@@#@하이하이 저는 뭐시기입니아아</td>
            </tr>
            <tr>
                <th id="seller_id">${ seller.user_id }</th>
                <td style="padding-left:5%;" id="follow_area">
                <c:if test="${follow==0 }">
              	  <button type="button" class="btn_small" id="followBtn">	
              	  <img src="${ contextPath }/resources/images/follower.png" />
              	  <p>&nbsp;&nbsp;&nbsp;팔로우</p></button>
              	 </c:if>
              	 <c:if test="${follow>0 }">
              	  <button type="button" class="btn_small" id="canselfollowBtn">	
              	 
              	  <p>&nbsp;&nbsp;&nbsp;&nbsp;팔로우&nbsp;&nbsp;취소</p></button>
              	 </c:if>
                </td>
                <td><button type="button" class="btn_small" onclick="sendToseller();"><img src="${ contextPath }/resources/images/airplane.png"/><p>쪽지보내기</p></button></td>
            </tr>
            
        </table>
        <script>
             function sellerReportPopup(){
            var url = "sellerReportPopup.html";
            var name = "신고하기";
            var _width = '750';
            var _height = '750';
 
    // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
    var _left = Math.ceil(( window.screen.width - _width )/2);
    var _top = Math.ceil(( window.screen.height - _height )/2); 
 
    window.open(url, name, 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
 
        }
        function sendToseller(){
            var url = "sendToseller.html";
            var name = "쪽지보내기";
            var _width = '500';
            var _height = '550';
 
    // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
    var _left = Math.ceil(( window.screen.width - _width )/2);
    var _top = Math.ceil(( window.screen.height - _height )/2); 
 
    window.open(url, name, 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
 
        }
        function sellerFollow(){
            Swal.fire({
  title: 'Follow',
  html: '<br>\'데세헤\' 님을 팔로우하였습니다.<br>판매자의 상품을 더욱더 빨리 만나보실 수 있습니다.<br>',
  imageUrl: '${ contextPath }/resources/images/logo.png',
  imageWidth: 232,
  imageHeight: 90,
  imageAlt: 'Custom image',
});
        }
        </script>
        <div id="follow_Section">
            <div style="text-align: center; padding-bottom: 2%;">
                <a href="${ contextPath }/goods/myglist">상품</a>
                <a href="${ contextPath }/goods/sellerInfo">거래후기</a>
                <a href="${ contextPath }/goods/sellerfollowing" style="color: black; font-weight: bold;">팔로윙</a>
                <a href="">팔로우</a> 
            </div>
            <div>
            <div class="follow_div">
                <img src="${ contextPath }/resources/images/image 57.png">
                <p>미오세2</p>
                <p>상품1 팔로워12</p>
                <button type="button" class="btn_sq" onclick="sellerFollow()"><img src="${ contextPath }/resources/images/follower.png" /><p>&nbsp;&nbsp;&nbsp;팔로우</p></button>
            </div>                  
            <div class="follow_div">
                <img src="${ contextPath }/resources/images/image 57.png">
                <p>미오세2</p>
                <p>상품1 팔로워12</p>
                <button type="button" class="btn_sq" onclick="sellerFollow()"><img src="${ contextPath }/resources/images/follower.png" /><p>&nbsp;&nbsp;&nbsp;팔로우</p></button>
            </div>   
            <div class="follow_div" >
                <img src="${ contextPath }/resources/images/image 57.png">
                <p>미오세2</p>
                <p>상품1 팔로워12</p>
                <button type="button" class="btn_sq" onclick="sellerFollow()"><img src="${ contextPath }/resources/images/follower.png" /><p>&nbsp;&nbsp;&nbsp;팔로우</p></button>
            </div>   
            <div class="follow_div">
                <img src="${ contextPath }/resources/images/image 57.png">
                <p>미오세2</p>
                <p>상품1 팔로워12</p>
                <button type="button" class="btn_sq" onclick="sellerFollow()"><img src="${ contextPath }/resources/images/follower.png" /><p>&nbsp;&nbsp;&nbsp;팔로우</p></button>
            </div>   
            <div class="follow_div" >
                <img src="${ contextPath }/resources/images/image 57.png">
                <p>미오세2</p>
                <p>상품1 팔로워12</p>
                <button type="button" class="btn_sq" onclick="sellerFollow()"><img src="${ contextPath }/resources/images/follower.png" /><p>&nbsp;&nbsp;&nbsp;팔로우</p></button>
            </div>   
            <div class="follow_div">
                <img src="${ contextPath }/resources/images/image 57.png">
                <p>미오세2</p>
                <p>상품1 팔로워12</p>
                <button type="button" class="btn_sq" onclick="sellerFollow()"><img src="${ contextPath }/resources/images/follower.png" /><p>&nbsp;&nbsp;&nbsp;팔로우</p></button>
            </div>  
        </div> 
        </div> 
        
    </section>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>