<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신 근처의 굿-바이 마켓 Good-Buy!</title>
<link href="${ contextPath }/resources/css/mypage/mypageMain.css" rel="stylesheet" type="text/css">
<style>
/* 프사 등록 모달 */
#proPhoto {
	width: 200px;
	height: 200px;
	border-radius: 100px;
	border: 5px solid #F1F1F1;
	margin-left: 50%;
	transform: translate(-50%);
	margin-top: 30px;
}

#inputLabel {
	text-decoration: underline;
	font-size: 13px;
	cursor: pointer;
	margin-left: 45%;
}

#fileBtn {
	margin-top: 30px;
	margin-bottom: 50px;
	width: 120px;
	height: 45px;
	text-align: center;
	border: 0px;
	background: #222;
	color: #fff;
	border-radius: 27px;
	font-weight: bold;
	margin-left: 50%;
	transform: translate(-50%);
}

#deleteBtn{
    width: 30px;
    height: 30px;
    color: #949999;
    border: 1px solid #949999;
    border-radius: 50px;
    font-size: 16px;
    background: #fff;
    position: absolute;
    top: 85px;
    left: 300px;
}

</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	 <section id="gbSection">
        <h1 class="title_h1">마이페이지</h1>
        <div class="proWrap">
            <a data-bs-toggle="modal" data-bs-target="#setPhotoModal">
            <!-- 프사 있을 때 -->
            <c:if test="${ !empty loginUser.photo }">
            <img src="${ contextPath }/resources/images/userProfilePhoto/${loginUser.photo}" id="userPhoto">
            </c:if>
             <!-- 프사 없을 때 -->
            <c:if test="${ empty loginUser.photo }">
            <img src="${ contextPath }/resources/images/mypage/unknownUser.png" id="userPhoto">
            </c:if>
            </a>
            <a data-bs-toggle="modal" data-bs-target="#setPhotoModal"><img src="${ contextPath }/resources/images/mypage/camera.png" id="cameraIcon"></a>
            <p>${loginUser.nickname}</p><br>
            <p>${ mtlist.get(0) }</p>
            <p>${loginUser.user_id}</p>
            <p><a onclick="showFollowing()">팔로잉 6</a></p>
            <p><a onclick="showFollower()">팔로워 15</a></p>
            <p><a href="${ contextPath }/mypage/pointList">1,500 P</a></p>
        </div>

        <button onclick="location.href='${contextPath}/mypage/updateMember'" id="editProfileBtn">프로필 수정</button>

        <div class="btnWrap">
            <div class="firstLineBtn" onclick="location.href='${contextPath}/mypage/sellingList'"><img src="${ contextPath }/resources/images/mypage/copy.png"><p>판매내역</p></div>
            <div class="firstLineBtn" onclick="location.href='${contextPath}/mypage/dealHistoryList'"><img src="${ contextPath }/resources/images/mypage/shopping-bag.png"><p>안전거래내역</p></div>
            <div class="firstLineBtn" onclick="location.href='${contextPath}/mypage/likeGoodsList'"><img src="${ contextPath }/resources/images/mypage/heart.png"><p>관심목록</p></div>
            <div class="firstLineBtn" onclick="location.href='${contextPath}/mypage/msgList'"><img src="${ contextPath }/resources/images/mypage/airplane.png"><p>내 쪽지함</p></div>
            <div class="firstLineBtn" onclick="location.href='${contextPath}/mypage/sentReviewList'"><img src="${ contextPath }/resources/images/mypage/star.png"><p>후기</p></div>
           <br>
           <div class="secondLineBtn" onclick="location.href='${contextPath}/mypage/setMyTown'"><img src="${ contextPath }/resources/images/mypage/placeholder.png"><p>내동네 설정</p></div>
           <div class="secondLineBtn" onclick="location.href='${contextPath}/mypage/setKeyword'"><img src="${ contextPath }/resources/images/mypage/pricetag.png"><p>키워드 알림</p></div>
           <div class="secondLineBtn" onclick="location.href='${contextPath}/mypage/myBoardList'"><img src="${ contextPath }/resources/images/mypage/content.png"><p>내 글 / 댓글</p></div>
           <c:if test="${loginUser.is_business == 'N' }">
           <div class="secondLineBtn" onclick="location.href='${contextPath}/business/create'"><img src="${contextPath}/resources/images/mypage/shop.png"><p>비즈프로필</p></div>
           </c:if>
           <c:if test="${loginUser.is_business == 'Y' }">
            <div class="secondLineBtn" onclick="location.href='${contextPath}/business/detail'"><img src="${contextPath}/resources/images/mypage/shop.png"><p>비즈프로필</p></div>
           </c:if>
           <div class="secondLineBtn" onclick="location.href='${contextPath}/mypage/reportList'"><img src="${ contextPath }/resources/images/mypage/alarm2.png"><p>신고</p></div>
        </div>
    </section>
	
	<div class="modal fade" id="setPhotoModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<div class="titleWrap">
						<span class="circle"></span> 
						<span class="welcome">프로필 사진</span> 
						<span class="circle"></span>
					</div>
				</div>
				
				<div class="modal-body">
					<div class="photoWrap">
						<!-- 프사 있을 때 -->
						<c:if test="${ !empty loginUser.photo }">
			            <img src="${ contextPath }/resources/images/userProfilePhoto/${loginUser.photo}" id="proPhoto">
			            </c:if>
						<!-- 프사 없을 때 -->
						<c:if test="${ empty loginUser.photo }">
			            <img src="${ contextPath }/resources/images/mypage/unknownUser.png" id="proPhoto">
			            </c:if>
					</div>
					
					<form action="${ contextPath }/mypage/photoInsert" method="post" enctype="multipart/form-data">
					<input type="file" id="inputFile" name="uploadPhoto" style="display: none;"> 
					<label for="inputFile" id="inputLabel">파일첨부</label> <br>
					<button type="submit" id="fileBtn">등록하기</button>
					</form>
					<form action="${ contextPath }/mypage/deletePhoto" method="post" enctype="multipart/form-data">
					<c:if test="${ !empty loginUser.photo }">
					<button type="submit" id="deleteBtn">X</button>
					</c:if>
					<c:if test="${ empty loginUser.photo }">
					<button type="submit" id="deleteBtn" disabled>X</button>
					</c:if>
					</form>
				</div>
			</div>
		</div>
	</div>



	<jsp:include page="../common/footer.jsp"/>
	
	 <script>
       
       function showFollowing(){
            var url = "${contextPath}/mypage/following";
            var _width = '400';
            var _height = '500';

            // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
            var _left = Math.ceil(( window.screen.width - _width )/2);
            var _top = Math.ceil(( window.screen.height - _height )/2);

            window.open(url,"PopupWin",'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );

       }

       function showFollower(){
            var url = "${contextPath}/mypage/following";
            var _width = '400';
            var _height = '500';

            // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
            var _left = Math.ceil(( window.screen.width - _width )/2);
            var _top = Math.ceil(( window.screen.height - _height )/2);

            window.open(url,"PopupWin",'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
       }
       
		/* 프사 첨부시 미리보기 */
		/* 인풋태그에 변화가 생길 때 setImg함수 실행 proPhoto는 미리보기 셋팅할 태그 id */
     	$("#inputFile").change(function(){
     		setImg(this,'#proPhoto');
     	});
     	
     	function setImg(input,expression){
     		var reader = new FileReader();
     		reader.onload = function(e){
     			$(expression).attr("src", e.target.result);
     		}
     		reader.readAsDataURL(input.files[0]);
     	};
    	  
      
       
       
    </script>
</body>
</html>